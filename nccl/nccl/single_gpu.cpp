#include <nccl.h>
#include <cuda_runtime.h>
#include <stdio.h>
#include <stdlib.h>

// NCCL错误处理宏
#define NCCLCHECK(cmd) do {                         \
  ncclResult_t res = cmd;                           \
  if (res != ncclSuccess) {                         \
    fprintf(stderr, "NCCL错误 %d 在行 %d: %s\n",    \
            res, __LINE__, ncclGetErrorString(res));\
    exit(EXIT_FAILURE);                             \
  }                                                 \
} while(0)

// CUDA错误处理宏
#define CUDA_CHECK(cmd) do {                        \
  cudaError_t err = cmd;                            \
  if (err != cudaSuccess) {                         \
    fprintf(stderr, "CUDA错误 %s 在行 %d\n",        \
            cudaGetErrorString(err), __LINE__);     \
    exit(EXIT_FAILURE);                             \
  }                                                 \
} while(0)

int main() {
    // 设备ID配置
    const int nDevices = 1;
    int devices[] = {0};  // 使用GPU索引0
    
    // 1. 初始化通信器
    ncclComm_t comm;
    NCCLCHECK(ncclCommInitAll(&comm, nDevices, devices));
    
    // 2. 设置当前设备
    CUDA_CHECK(cudaSetDevice(devices[0]));
    
    // 3. 创建CUDA流
    cudaStream_t stream;
    CUDA_CHECK(cudaStreamCreate(&stream));
    
    // 4. 分配设备内存
    float *d_send, *d_recv;
    CUDA_CHECK(cudaMalloc(&d_send, sizeof(float)));
    CUDA_CHECK(cudaMalloc(&d_recv, sizeof(float)));
    
    // 5. 初始化数据
    const float initValue = 1.0f;
    CUDA_CHECK(cudaMemcpy(d_send, &initValue, sizeof(float), cudaMemcpyHostToDevice));
    
    // 6. 执行AllReduce操作
    NCCLCHECK(ncclAllReduce(
        (const void*)d_send,  // 发送缓冲区
        (void*)d_recv,        // 接收缓冲区
        1,                    // 元素数量
        ncclFloat,            // 数据类型
        ncclSum,              // 操作类型
        comm,                 // NCCL通信器
        stream                // CUDA流
    ));
    
    // 7. 同步设备
    CUDA_CHECK(cudaStreamSynchronize(stream));
    
    // 8. 获取结果
    float host_result;
    CUDA_CHECK(cudaMemcpy(&host_result, d_recv, sizeof(float), cudaMemcpyDeviceToHost));
    printf("计算结果: %.0f (预期: 1.0)\n", host_result);
    
    // 9. 清理资源
    CUDA_CHECK(cudaFree(d_send));
    CUDA_CHECK(cudaFree(d_recv));
    CUDA_CHECK(cudaStreamDestroy(stream));
    NCCLCHECK(ncclCommDestroy(comm));
    
    return 0;
}
