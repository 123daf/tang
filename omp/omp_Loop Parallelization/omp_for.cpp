#include<iostream>
#include<omp.h>
using namespace std;

int main() {
    const long long n = 1000000000;  // 10亿
    const int block_size = 100000;   // 优化缓存访问
    
    // ===== 修正1：独立变量存储结果 =====
    long long serial_sum = 0;
    long long parallel_sum = 0;

    // ===== 串行计算 =====
    double starttime = omp_get_wtime();
    for(long long i = 0; i < n; i++) {  // 修正2：使用long long循环变量
        serial_sum += i;
    }
    double endtime = omp_get_wtime();
    cout << serial_sum << endl;
    cout << "running time is " << (endtime-starttime) << endl;

    // ===== 并行计算 =====
    double starttime2 = omp_get_wtime();
    #pragma omp parallel for reduction(+:parallel_sum) \
                schedule(dynamic, block_size)  // 修正3：优化调度策略
    for(long long i = 0; i < n; i++) {  // 修正2：使用long long循环变量
        parallel_sum += i;
    }
    double endtime2 = omp_get_wtime();
    cout << parallel_sum << endl;
    cout << " openmp running time is " << (endtime2-starttime2) << endl;

    // ===== 验证结果 =====
    if(serial_sum == parallel_sum) {
        cout << "\n✅ 验证通过: 结果一致" << endl;
    } else {
        cout << "\n❌ 验证失败: serial=" << serial_sum 
             << " parallel=" << parallel_sum << endl;
    }
    
    return 0;
}