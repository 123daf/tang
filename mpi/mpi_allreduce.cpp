#include<iostream>
#include<mpi.h>
using namespace std;
int main(int argc,char ** argv)
{
    MPI_Init(&argc,&argv);
    int rank,size,data=0,sum;
    MPI_Comm_rank(MPI_COMM_WORLD,&rank);
    MPI_Comm_size(MPI_COMM_WORLD,&size);
    data=rank+1;
    MPI_Allreduce(&data,&sum,1,MPI_INT,MPI_SUM,MPI_COMM_WORLD);
    cout<<"rank "<<rank<<" recieved sum = "<<sum<<endl;
    MPI_Finalize();
    return 0;
} 