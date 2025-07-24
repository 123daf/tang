#include<iostream>
#include<mpi.h>
#include<vector>
using namespace std;
int main(int argc,char** argv)
{
    MPI_Init(&argc,&argv);
    int rank,size,n=5;
    vector<int>a;
    vector<int>b(n);
    MPI_Comm_rank(MPI_COMM_WORLD,&rank);
    MPI_Comm_size(MPI_COMM_WORLD,&size);
    if(rank==0)
    {int m=size*n;
        a.resize(m);
        for(int i=0;i<m;i++)
        {
            a[i]=i;
        }

    }
    MPI_Scatter(a.data(),n,MPI_INT,b.data(),n,MPI_INT,0,MPI_COMM_WORLD);
    cout<<"Rank "<<rank<<" of "<<size<<" recived: ";
    for(int j=0;j<n;j++)
    {
        cout<<b[j]<<" ";
    }
    cout<<endl;
    MPI_Finalize();
    return 0;
}
