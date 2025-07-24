#include<iostream>
#include<mpi.h>
using namespace std;
int main(int argc,char **argv)
{
    MPI_Init(&argc,&argv);
    int rank,size,data=0;
    MPI_Comm_rank(MPI_COMM_WORLD,&rank);
    MPI_Comm_size(MPI_COMM_WORLD,&size);

    if(rank==0)
    {
         data=1234;
    }
    MPI_Bcast(&data,1,MPI_INT,0,MPI_COMM_WORLD);
    cout<<"The rank "<<rank<<" of "<<size<<" recieved "<<data<<endl;
    MPI_Finalize();
    return 0;
}