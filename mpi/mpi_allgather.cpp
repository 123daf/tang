#include<iostream>
#include<mpi.h>
#include<vector>
using namespace std;
int main(int argc,char **argv)
{
    MPI_Init(&argc,&argv);
    int rank,size,data=0;
    MPI_Comm_rank(MPI_COMM_WORLD,&rank);
    MPI_Comm_size(MPI_COMM_WORLD,&size);
    data=rank+1;
    vector<int>a(size);
    MPI_Allgather(&data,1,MPI_INT,a.data(),1,MPI_INT,MPI_COMM_WORLD);
    cout<<"rank "<<rank<< " allgather:";
    for(int i=0;i<size;i++)
    {
        cout<<a[i]<<" ";
    }
    cout<<endl;
    MPI_Finalize();
    return 0;

}