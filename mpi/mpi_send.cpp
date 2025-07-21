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