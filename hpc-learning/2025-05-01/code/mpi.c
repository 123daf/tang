#include <mpi.h>
#include <iostream>
int main(int argc, char* argv[]) {
    // 初始化 MPI 环境
    MPI_Init(&argc, &argv);
    // 获取当前进程的秩（rank）
    int rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    // 获取总进程数
    int size;
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    // 每个进程打印自己的秩和总进程数
    std::cout << "Hello from rank " << rank << " of " << size << " processes." << std::endl;
    // 结束 MPI 环境
    MPI_Finalize();

    return 0;
}
