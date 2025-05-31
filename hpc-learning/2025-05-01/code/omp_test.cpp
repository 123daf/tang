#include<iostream>
#include<omp.h>
using namespace std;
int main()
{
int num,count;
count=omp_get_num_threads();//线程数量
num=omp_get_thread_num();//线程号
cout<<" 在使用openmp前"<<endl;
cout<<" 并行域中的线程数量为："<<count<<"，来自并行域中的线程号："<<num<<endl;
cout<<" 在使用openmp时"<<endl;
#pragma omp parallel num_threads(3) private(num,count)
{
    count=omp_get_num_threads();//线程数量
num=omp_get_thread_num();//线程号
cout<<" 并行域中的线程数量为："<<count<<"，来自并行域中的线程号："<<num<<endl;}
count=omp_get_num_threads();//线程数量
num=omp_get_thread_num();//线程号
cout<<" 在使用openmp后"<<endl;
cout<<" 并行域中的线程数量为："<<count<<"，来自并行域中的线程号："<<num<<endl;
return 0;
}