#include <iostream>
#include <omp.h>

int main() {
    int num_threads = omp_get_max_threads(); // 获取最大线程数
    std::cout << "Number of threads: " << num_threads << std::endl;

    #pragma omp parallel
    {
        int thread_id = omp_get_thread_num(); // 获取当前线程的编号
        std::cout << "Hello from thread " << thread_id << "!" << std::endl;
    }

    return 0;
}