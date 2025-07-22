#include <nccl.h>
#include <cuda_runtime.h>
#include <iostream>
#include <cstdlib> // 添加此头文件以支持 exit 函数

#define CUDACHECK(cmd) { cudaError_t e = cmd; if(e != cudaSuccess) { \
    std::cerr << "CUDA error " << __FILE__ << ":" << __LINE__ << " '" << cudaGetErrorString(e) << "'" << std::endl; \
    exit(EXIT_FAILURE); }}
#define NCCLCHECK(cmd) { ncclResult_t r = cmd; if(r != ncclSuccess) { \
    std::cerr << "NCCL error " << __FILE__ << ":" << __LINE__ << " '" << ncclGetErrorString(r) << "'" << std::endl; \
    exit(EXIT_FAILURE); }}

int main() {
    const int numGPUs = 4;
    ncclComm_t comms[numGPUs];       // NCCL 通信器数组
    cudaStream_t streams[numGPUs];   // 每个 GPU 的 CUDA 流
    float *sendbuff[numGPUs], *recvbuff[numGPUs];  // 设备内存指针

    // 1. 初始化 NCCL 通信器
    NCCLCHECK(ncclCommInitAll(comms, numGPUs, nullptr));

    // 2. 为每个 GPU 分配资源和初始化数据
    for (int i = 0; i < numGPUs; ++i) {
        CUDACHECK(cudaSetDevice(i));  // 绑定当前 GPU
        
        // 分配设备内存
        CUDACHECK(cudaMalloc((void**)&sendbuff[i], sizeof(float)));
        CUDACHECK(cudaMalloc((void**)&recvbuff[i], sizeof(float)));
        
        // 创建 CUDA 流
        CUDACHECK(cudaStreamCreate(&streams[i]));
        
        // 初始化数据（使用显式赋值确保精度）
        float initVal = static_cast<float>(i + 1);
        CUDACHECK(cudaMemcpy(sendbuff[i], &initVal, sizeof(float), cudaMemcpyHostToDevice));
    }

    // 3. 执行 AllReduce 求和操作
    for (int i = 0; i < numGPUs; ++i) {
        NCCLCHECK(ncclAllReduce(
            (const void*)sendbuff[i], // 输入数据地址
            (void*)recvbuff[i],       // 输出数据地址
            1,                        // 数据数量
            ncclFloat,                // 数据类型
            ncclSum,                  // 规约操作
            comms[i],                 // 当前 GPU 的通信器
            streams[i]                // 绑定的 CUDA 流
        ));
    }

    // 4. 同步流并验证结果
    for (int i = 0; i < numGPUs; ++i) {
        CUDACHECK(cudaSetDevice(i));
        CUDACHECK(cudaStreamSynchronize(streams[i]));  // 等待通信完成
        
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
