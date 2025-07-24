# MPI并行计算实战指南（C++/WSL2/VSCode）

## 一、MPI核心概念速记
### 进程模型
- **多进程独立运行**：每个进程拥有独立内存空间
- **通信域(Communicator)**：`MPI_COMM_WORLD` 包含所有进程

### 四大基础函数
### MPI 核心基础函数说明

| **函数名**             | **参数说明**                                                                                             | **功能描述**                                                                 | **注意事项**                                                                 |
|------------------------|---------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|----------------------------------------------------------------------------|
| **`MPI_Init`**         | `int *argc, char ***argv`                                                                               | 初始化 MPI 环境，建立进程间通信基础。                                       | 必须是首个调用的 MPI 函数；参数直接传递 `main` 函数的 `argc` 和 `argv`[3](@ref)。 |
| **`MPI_Comm_rank`**    | `MPI_Comm comm, int *rank`                                                                              | 获取当前进程在通信域中的唯一 ID（Rank），范围是 `0` ~ `size-1`。             | `comm` 通常用 `MPI_COMM_WORLD`（默认全局通信域）[2,3](@ref)。         |
| **`MPI_Comm_size`**    | `MPI_Comm comm, int *size`                                                                              | 获取通信域内的总进程数（`size`）。                                           | `size` 值由 `mpiexec -n` 指定；非 0 进程需依赖此值划分任务[1,5](@ref)。 |
| **`MPI_Finalize`**     | 无参数                                                                                                  | 终止 MPI 环境，释放通信资源。                                               | 必须是最后调用的 MPI 函数；调用后不可再使用其他 MPI 接口[1,3](@ref)。   |

---

---

## 二、点对点通信
### 阻塞式消息传递（Send/Recv）
```
#include<iostream>
#include<mpi.h>
using namespace std;
int main(int argc,char** argv)
{
    MPI_Init(&argc,&argv);
    int rank;
    MPI_Comm_rank(MPI_COMM_WORLD,&rank);
    if(rank==0)
    {
        int data=13;
        MPI_Send(&data,1,MPI_INT,1,0,MPI_COMM_WORLD);
    }
    else if(rank==1)
    {
        int data;
        MPI_Recv(&data,1,MPI_INT,0,0,MPI_COMM_WORLD,MPI_STATUS_IGNORE);
        cout<<"received:"<<data<<endl;
    }
    MPI_Finalize();
    return 0;
}
```
### 参数解析
| 函数       | 关键参数说明                  |
|------------|-----------------------------|
| `MPI_Send` | (数据指针, 元素数量, 数据类型, 目标进程, 消息标签, 通信域) |
| `MPI_Recv` | (数据指针, 最大容量, 数据类型, 来源进程, 标签, 通信域, 状态对象) |

⚠️ **死锁警告**：当两个进程同时执行`Send`会互相等待导致死锁

---

## 三、集体通信
### 全局归约（Reduce）
```

#include <mpi.h>
#include <iostream>

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);
    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    int local_val = rank;       // 每个进程的局部值
    int global_sum;
    // 所有进程的local_val求和，结果存到进程0的global_sum中
    MPI_Reduce(&local_val, &global_sum, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);

    if (rank == 0) 
        std::cout << "Total Sum: " << global_sum << std::endl; // 输出 0+1+2+...+N-1

    MPI_Finalize();
    return 0;
}
```
### 数据分发收集（Scatter/Gather）
```
#include <mpi.h>
#include <vector>

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);
    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    const int total_size = 100;
    std::vector<int> global_data;
    if (rank == 0) {
        global_data.resize(total_size);
        for (int i = 0; i < total_size; ++i) global_data[i] = i;
    }

    // 每个进程接收25个数据
    std::vector<int> local_data(25);
    MPI_Scatter(global_data.data(), 25, MPI_INT, 
                local_data.data(), 25, MPI_INT, 
                0, MPI_COMM_WORLD);

    // 计算局部和
    int local_sum = 0;
    for (int val : local_data) local_sum += val;

    // 收集所有局部和到进程0
    std::vector<int> all_sums(size);
    MPI_Gather(&local_sum, 1, MPI_INT, 
               all_sums.data(), 1, MPI_INT, 
               0, MPI_COMM_WORLD);

    if (rank == 0) {
        int total_sum = 0;
        for (int sum : all_sums) total_sum += sum;
        std::cout << "Global Sum: " << total_sum << std::endl; // 输出0~99的和=4950
    }

    MPI_Finalize();
    return 0;
}
```

## 四、矩阵乘法实战（分块并行）
```#include <mpi.h>
#include <vector>
#include <iostream>

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);
    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    const int N = 4; // 矩阵维度
    std::vector<std::vector<int>> A(N, std::vector<int>(N));
    std::vector<std::vector<int>> B(N, std::vector<int>(N));
    std::vector<std::vector<int>> C(N, std::vector<int>(N));

    // 进程0初始化矩阵A和B
    if (rank == 0) {
        for (int i = 0; i < N; ++i) {
            for (int j = 0; j < N; ++j) {
                A[i][j] = i * j;
                B[i][j] = i + j;
            }
        }
    }

    // 分发矩阵A的行块（每进程1行）
    std::vector<int> local_row(N);
    MPI_Scatter(A.data(), N, MPI_INT, 
                local_row.data(), N, MPI_INT, 
                0, MPI_COMM_WORLD);

    // 广播矩阵B到所有进程
    MPI_Bcast(B.data(), N * N, MPI_INT, 0, MPI_COMM_WORLD);

    // 计算局部结果（1行 x 整个B矩阵）
    std::vector<int> local_result(N, 0);
    for (int j = 0; j < N; ++j) {
        for (int k = 0; k < N; ++k) {
            local_result[j] += local_row[k] * B[k][j];
        }
    }

    // 收集结果到进程0
    MPI_Gather(local_result.data(), N, MPI_INT, 
               C.data(), N, MPI_INT, 
               0, MPI_COMM_WORLD);

    // 进程0打印结果
    if (rank == 0) {
        std::cout << "Result Matrix:\n";
        for (int i = 0; i < N; ++i) {
            for (int j = 0; j < N; ++j) std::cout << C[i][j] << " ";
            std::cout << "\n";
        }
    }

    MPI_Finalize();
    return 0;
}
```
### 优化要点
1. **分块计算**：使用`Scatter`分发A矩阵的行块
2. **广播复用**：`Bcast`广播B矩阵避免重复传输
3. **结果聚合**：`Gather`收集各进程计算结果

#### 运行命令
```
bash
mpicxx -o matmul matmul.cpp
mpiexec -n 4 ./matmul
```
---

## 五、性能优化技巧
| 技术                 | 应用场景                          | 优势                     |
|----------------------|----------------------------------|--------------------------|
| `MPI_Sendrecv`       | 双向数据交换                    | 避免死锁                 |
| `MPI_Allreduce`      | 全局统计（如标准差）            | 减少Reduce+Bcast两步操作 |
| 非阻塞通信           | 计算通信重叠                    | 隐藏通信延迟             |
| 动态任务分配         | 负载不均衡场景                  | 提升核心利用率           |

---

## 六、VSCode调试配置
### 调试步骤
1. 编译时添加调试信息：
```
bash

mpicxx -g -O0 -o program program.cpp
```
2. 在代码中设置断点
3. 按F5启动调试（自动运行4进程）

---
