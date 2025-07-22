#include <nccl.h>
#include <cuda_runtime.h>
#include <iostream>
#include <cstdlib>  // for exit

#define CUDACHECK(cmd) { \
    cudaError_t e = cmd; \
    if(e != cudaSuccess) { \
        std::cerr << "CUDA error at " << __FILE__ << ":" << __LINE__ << " - " << cudaGetErrorString(e) << std::endl; \
        exit(EXIT_FAILURE); \
    } \
}

#define NCCLCHECK(cmd) { \
    ncclResult_t r = cmd; \
    if(r != ncclSuccess) { \
        std::cerr << "NCCL error at " << __FILE__ << ":" << __LINE__ << " - " << ncclGetErrorString(r) << std::endl; \
        exit(EXIT_FAILURE); \
    } \
}

int main() {
    const int numGPUs = 4;
    ncclComm_t comms[numGPUs];       // NCCL通信器数组
    cudaStream_t streams[numGPUs];   // 每个GPU的CUDA流
    float* sendbuff[numGPUs];        // 发送缓冲区
    float* recvbuff[numGPUs];         // 接收缓冲区

    // 1. 初始化NCCL通信器
    NCCLCHECK(ncclCommInitAll(comms, numGPUs, nullptr));

    // 2. 为每个GPU分配资源和初始化数据
    for (int i = 0; i < numGPUs; ++i) {
        CUDACHECK(cudaSetDevice(i));
        CUDACHECK(cudaMalloc(&sendbuff[i], sizeof(float)));
        CUDACHECK(cudaMalloc(&recvbuff[i], sizeof(float)));
        float initVal = static_cast<float>(i + 1);
        CUDACHECK(cudaMemcpy(sendbuff[i], &initVal, sizeof(float), cudaMemcpyHostToDevice));
        CUDACHECK(cudaStreamCreate(&streams[i]));
    }

    // 3. 执行AllReduce求和操作
    for (int i = 0; i < numGPUs; ++i) {
        NCCLCHECK(ncclAllReduce(
            (const void*)sendbuff[i], // 输入数据地址
            (void*)recvbuff[i],       // 输出数据地址
            1,                        // 数据数量
            ncclFloat,                // 数据类型
            ncclSum,                  // 规约操作（求和）
            comms[i],                 // 当前GPU的通信器
            streams[i]                // 绑定的CUDA流
        ));
    }

    // 4. 同步流并验证结果
    for (int i = 0; i < numGPUs; ++i) {
        CUDACHECK(cudaSetDevice(i));
        CUDACHECK(cudaStreamSynchronize(streams[i]));
        float result;
        CUDACHECK(cudaMemcpy(&result, recvbuff[i], sizeof(float), cudaMemcpyDeviceToHost));
        std::cout << "GPU " << i << ": result = " << result << std::endl;
    }

    // 5. 释放资源
    for (int i = 0; i < numGPUs; ++i) {
        CUDACHECK(cudaSetDevice(i));
        CUDACHECK(cudaFree(sendbuff[i]));
        CUDACHECK(cudaFree(recvbuff[i]));
        CUDACHECK(cudaStreamDestroy(streams[i]));
        NCCLCHECK(ncclCommDestroy(comms[i]));
    }

    return 0;
}
