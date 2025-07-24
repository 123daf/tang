#include<iostream>
#include<mpi.h>
#include<vector>
using namespace std;
int main(int argc,char** argv)
{
    MPI_Init(&argc,&argv);
    int rank,size,n=5,i,m;
    vector<int>a;
    vector<int>b(n);
    vector<int>c;
    MPI_Comm_rank(MPI_COMM_WORLD,&rank);
    MPI_Comm_size(MPI_COMM_WORLD,&size);
    m=size*n;

    if(rank==0)//scatter
    { 
        a.resize(m);
        for(i=0;i<m;i++)
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


    if(rank==0) {c.resize(m);}//gather
    MPI_Gather(b.data(),n,MPI_INT,c.data(),n,MPI_INT,0,MPI_COMM_WORLD);
    cout<<"rank "<<rank<<" of "<<size<<" send : ";
    for(int k=0;k<n;k++){cout<<b[k]<<" ";}
    cout<<"to rank 0"<<endl;
    if(rank==0){
        cout<<"rank 0 gathered ";
        for(i=0;i<m;i++)
    {
        cout<<c[i]<<" ";
    } 
cout<<endl;}
    MPI_Finalize();
    return 0;
}
