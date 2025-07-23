#include <nccl.h>
#include <cuda_runtime.h>
#include <iostream>
#include <cmath>
#include <cstdlib>

#define CUDACHECK(cmd) {\
    cudaError_t e = cmd;\
    if(e != cudaSuccess) {\
        std::cerr << "CUDA错误 " << __FILE__ << ":" << __LINE__ \
                  << " '" << cudaGetErrorString(e) << "'\n"; \
        exit(EXIT_FAILURE);\
    }\
}

#define NCCLCHECK(cmd) {\
    ncclResult_t r = cmd;\
    if(r != ncclSuccess) {\
        std::cerr << "NCCL错误 " << __FILE__ << ":" << __LINE__ \
                  << " '" << ncclGetErrorString(r) << "'\n"; \
        exit(EXIT_FAILURE);\
    }\
}

int main() {
    // 1. 动态获取GPU数量（适配各种设备）
    int numGPUs;
    CUDACHECK(cudaGetDeviceCount(&numGPUs));
    std::cout << "系统可用GPU数量: " << numGPUs << std::endl;

    if(numGPUs < 1) {
        std::cerr << "错误: 没有检测到可用GPU设备" << std::endl;
        return EXIT_FAILURE;
    }

    // 2. 创建设备ID数组和通信器数组
    int* devices = new int[numGPUs];
    for (int i = 0; i < numGPUs; ++i) 
        devices[i] = i;
    
    ncclComm_t* comms = new ncclComm_t[numGPUs];
    cudaStream_t* streams = new cudaStream_t[numGPUs];
    float** sendbuff = new float*[numGPUs];
    float** recvbuff = new float*[numGPUs];

    // 3. 初始化NCCL通信器
    NCCLCHECK(ncclCommInitAll(comms, numGPUs, devices));

    // 4. 初始化每块GPU
    for (int i = 0; i < numGPUs; ++i) {
        CUDACHECK(cudaSetDevice(i));
        CUDACHECK(cudaMalloc(&sendbuff[i], sizeof(float)));
        CUDACHECK(cudaMalloc(&recvbuff[i], sizeof(float)));
        CUDACHECK(cudaStreamCreate(&streams[i]));
        
        float hostValue = i + 1.0f;
        CUDACHECK(cudaMemcpy(sendbuff[i], &hostValue, sizeof(float), 
                             cudaMemcpyHostToDevice));
    }

    // 5. 执行AllReduce
    NCCLCHECK(ncclGroupStart());
    for (int i = 0; i < numGPUs; ++i) {
        NCCLCHECK(ncclAllReduce(
            (const void*)sendbuff[i],
            (void*)recvbuff[i],
            1,
            ncclFloat,
            ncclSum,
            comms[i],
            streams[i]
        ));
    }
    NCCLCHECK(ncclGroupEnd());

    // 6. 验证结果
    float expectedSum = numGPUs * (numGPUs + 1) / 2.0f;
    bool allPassed = true;
    
    for (int i = 0; i < numGPUs; ++i) {
        CUDACHECK(cudaSetDevice(i));
        CUDACHECK(cudaStreamSynchronize(streams[i]));
        
        float hostResult;
        CUDACHECK(cudaMemcpy(&hostResult, recvbuff[i], sizeof(float), 
                             cudaMemcpyDeviceToHost));
        
        if (std::fabs(hostResult - expectedSum) < 0.001f) {
            std::cout << "GPU " << i << ": 验证通过 ✅ (" << hostResult << ")" << std::endl;
        } else {
            std::cerr << "GPU " << i << ": 结果错误 ❌ (" << hostResult 
                      << " 期望值: " << expectedSum << ")" << std::endl;
            allPassed = false;
        }
    }

    // 7. 资源清理
    for (int i = 0; i < numGPUs; ++i) {
        CUDACHECK(cudaSetDevice(i));
        CUDACHECK(cudaFree(sendbuff[i]));
        CUDACHECK(cudaFree(recvbuff[i]));
        CUDACHECK(cudaStreamDestroy(streams[i]));
        NCCLCHECK(ncclCommDestroy(comms[i]));
    }
    
    delete[] devices;
    delete[] comms;
    delete[] streams;
    delete[] sendbuff;
    delete[] recvbuff;
    
    std::cout << "\n测试" << (allPassed ? "成功 ✅" : "失败 ❌") << std::endl;
    return allPassed ? EXIT_SUCCESS : EXIT_FAILURE;
}
