g++ -fopenmp omp_example.cpp -o omp_example
sudo apt install g++
sudo apt update
sudo apt install build-essential
g++ -fopenmp omp_example.cpp -o omp_example
./omp_example
g++ -fopenmp omp_example.cpp -o omp_example
./omp_example
g++ -fopenmp omp_example.cpp -o omp_example
./omp_example
g++ -fopenmp omp_example.cpp -o omp_example
./omp_example
g++ -fopenmp omp_example.cpp -o omp_example
./omp_example
sudo apt-get update
sudo apt-get install libopenmpi-dev
mpic++ -o hello_mpi hello_mpi.cpp
mpirun -np 4 ./hello_mpi
mpic++ -op p.cpp
mpirun -np 4./p
mpic++ -o array_product_sum array_product_sum.cpp
mpirun -np 4 ./array_product_sum
mpic++ -o array_product_sum array_product_sum.cpp
mpirun -np10  ./array_product_sum
mpirun -np 4 ./array_product_sum
mpic++ -o sum_product sum_product.cpp
mpirun -np 4 ./sum_product
mpic++ -o sum_product sum_product.cpp
mpirun -np 4 ./sum_product
g++ -std=c++11 -o dot_product main.cpp
./dot_product
g++ -std=c++11 -o dot_product main.cpp
./dot_product
g++ -std=c++11 -o dot_product main.cpp
cd /path/to/your/project
g++ -std=c++11 -o dot_product dot_product.cpp
./dot_product
mpic++ -o sum_product sum_product.cpp
mpirun -np 4 ./sum_product
g++ -std=c++11 -o dot_product dot_product.cpp
./dot_product
g++ -o matrix_multiplication matrix_multiplication.cpp
./matrix_multiplication
mpicxx -o matrix_mpi matrix_mpi.cpp
mpirun -np 4 ./matrix_mpi
mpicxx -o matrix_mpi matrix_mpi.cpp
mpirun -np 4 ./matrix_mpi
Open MPI has detected that this process has attempted to initialize
MPI (via MPI_INIT or MPI_INIT_THREAD) more than once.  This is
erroneous.
--------------------------------------------------------------------------
[LAPTOP-I2TCFNV7:45374] *** An error occurred in MPI_Init
[LAPTOP-I2TCFNV7:45374] *** reported by process [2356805633,2]
[LAPTOP-I2TCFNV7:45374] *** on a NULL communicator
[LAPTOP-I2TCFNV7:45374] *** Unknown error
[LAPTOP-I2TCFNV7:45374] *** MPI_ERRORS_ARE_FATAL (processes in this communicator will now abort,
[LAPTOP-I2TCFNV7:45374] ***    and potentially your MPI job)
[LAPTOP-I2TCFNV7:45368] 2 more processes have sent help message help-mpi-runtime.txt / mpi_init: invoked multiple times
[LAPTOP-I2TCFNV7:45368] Set MCA parameter "orte_base_help_aggregate" to 0 to see all help / error messages
[LAPTOP-I2TCFNV7:45368] 2 more processes have sent help message help-mpi-errors.txt / mpi_errors_are_fatal unknown handle
tang@LAPTOP-I2TCFNV7:~$ mpicxx -o matrix_mpi matrix_mpi.cpp
tang@LAPTOP-I2TCFNV7:~$ mpirun -np 4 ./matrix_mpi
terminate called after throwing an instance of 'std::length_error'
[LAPTOP-I2TCFNV7:49207] *** Process received signal ***
[LAPTOP-I2TCFNV7:49207] Signal: Aborted (6)
[LAPTOP-I2TCFNV7:49207] Signal code:  (-6)
[LAPTOP-I2TCFNV7:49207] [ 0] /lib/x86_64-linux-gnu/libc.so.6(+0x42520)[0x7fe38e501520]
[LAPTOP-I2TCFNV7:49207] [ 1] /lib/x86_64-linux-gnu/libc.so.6(pthread_kill+0x12c)[0x7fe38e5559fc]
[LAPTOP-I2TCFNV7:49207] [ 2] /lib/x86_64-linux-gnu/libc.so.6(raise+0x16)[0x7fe38e501476]
[LAPTOP-I2TCFNV7:49207] [ 3] /lib/x86_64-linux-gnu/libc.so.6(abort+0xd3)[0x7fe38e4e77f3]
[LAPTOP-I2TCFNV7:49207] [ 4] /lib/x86_64-linux-gnu/libstdc++.so.6(+0xa2b9e)[0x7fe38e7aab9e]
[LAPTOP-I2TCFNV7:49207] [ 5] /lib/x86_64-linux-gnu/libstdc++.so.6(+0xae20c)[0x7fe38e7b620c]
[LAPTOP-I2TCFNV7:49207] [ 6] /lib/x86_64-linux-gnu/libstdc++.so.6(+0xae277)[0x7fe38e7b6277]
[LAPTOP-I2TCFNV7:49207] [ 7] /lib/x86_64-linux-gnu/libstdc++.so.6(+0xae4d8)[0x7fe38e7b64d8]
[LAPTOP-I2TCFNV7:49207] [ 8] /lib/x86_64-linux-gnu/libstdc++.so.6(_ZSt20__throw_length_errorPKc+0x40)[0x7fe38e7ad449]
[LAPTOP-I2TCFNV7:49207] [ 9] ./matrix_mpi(+0xf2b6)[0x5631e65322b6]
[LAPTOP-I2TCFNV7:49207] [10] ./matrix_mpi(+0xefae)[0x5631e6531fae]
[LAPTOP-I2TCFNV7:49207] [11] ./matrix_mpi(+0x9812)[0x5631e652c812]
[LAPTOP-I2TCFNV7:49207] [12] ./matrix_mpi(+0x9cf2)[0x5631e652ccf2]
[LAPTOP-I2TCFNV7:49207] [13] /lib/x86_64-linux-gnu/libc.so.6(+0x29d90)[0x7fe38e4e8d90]
[LAPTOP-I2TCFNV7:49207] [14] /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0x80)[0x7fe38e4e8e40]
[LAPTOP-I2TCFNV7:49207] [15] ./matrix_mpi(+0x9685)[0x5631e652c685]
[LAPTOP-I2TCFNV7:49207] *** End of error message ***
terminate called after throwing an instance of 'std::length_error'
[LAPTOP-I2TCFNV7:49208] *** Process received signal ***
[LAPTOP-I2TCFNV7:49208] Signal: Aborted (6)
[LAPTOP-I2TCFNV7:49208] Signal code:  (-6)
[LAPTOP-I2TCFNV7:49208] [ 0] /lib/x86_64-linux-gnu/libc.so.6(+0x42520)[0x7fc969211520]
[LAPTOP-I2TCFNV7:49208] [ 1] /lib/x86_64-linux-gnu/libc.so.6(pthread_kill+0x12c)[0x7fc9692659fc]
[LAPTOP-I2TCFNV7:49208] [ 2] /lib/x86_64-linux-gnu/libc.so.6(raise+0x16)[0x7fc969211476]
[LAPTOP-I2TCFNV7:49208] [ 3] /lib/x86_64-linux-gnu/libc.so.6(abort+0xd3)[0x7fc9691f77f3]
[LAPTOP-I2TCFNV7:49208] [ 4] /lib/x86_64-linux-gnu/libstdc++.so.6(+0xa2b9e)[0x7fc9694bab9e]
[LAPTOP-I2TCFNV7:49208] [ 5] /lib/x86_64-linux-gnu/libstdc++.so.6(+0xae20c)[0x7fc9694c620c]
[LAPTOP-I2TCFNV7:49208] [ 6] /lib/x86_64-linux-gnu/libstdc++.so.6(+0xae277)[0x7fc9694c6277]
[LAPTOP-I2TCFNV7:49208] [ 7] /lib/x86_64-linux-gnu/libstdc++.so.6(+0xae4d8)[0x7fc9694c64d8]
[LAPTOP-I2TCFNV7:49208] [ 8] /lib/x86_64-linux-gnu/libstdc++.so.6(_ZSt20__throw_length_errorPKc+0x40)[0x7fc9694bd449]
[LAPTOP-I2TCFNV7:49208] [ 9] ./matrix_mpi(+0xf2b6)[0x56452f70d2b6]
[LAPTOP-I2TCFNV7:49208] [10] ./matrix_mpi(+0xefae)[0x56452f70cfae]
[LAPTOP-I2TCFNV7:49208] [11] ./matrix_mpi(+0x9812)[0x56452f707812]
[LAPTOP-I2TCFNV7:49208] [12] ./matrix_mpi(+0x9cf2)[0x56452f707cf2]
[LAPTOP-I2TCFNV7:49208] [13] /lib/x86_64-linux-gnu/libc.so.6(+0x29d90)[0x7fc9691f8d90]
[LAPTOP-I2TCFNV7:49208] [14] /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0x80)[0x7fc9691f8e40]
[LAPTOP-I2TCFNV7:49208] [15] ./matrix_mpi(+0x9685)[0x56452f707685]
[LAPTOP-I2TCFNV7:49208] *** End of error message ***
terminate called after throwing an instance of 'std::length_error'
[LAPTOP-I2TCFNV7:49206] *** Process received signal ***
[LAPTOP-I2TCFNV7:49206] Signal: Aborted (6)
[LAPTOP-I2TCFNV7:49206] Signal code:  (-6)
[LAPTOP-I2TCFNV7:49206] [ 0] /lib/x86_64-linux-gnu/libc.so.6(+0x42520)[0x7f46dbc9a520]
[LAPTOP-I2TCFNV7:49206] [ 1] /lib/x86_64-linux-gnu/libc.so.6(pthread_kill+0x12c)[0x7f46dbcee9fc]
[LAPTOP-I2TCFNV7:49206] [ 2] /lib/x86_64-linux-gnu/libc.so.6(raise+0x16)[0x7f46dbc9a476]
[LAPTOP-I2TCFNV7:49206] [ 3] /lib/x86_64-linux-gnu/libc.so.6(abort+0xd3)[0x7f46dbc807f3]
[LAPTOP-I2TCFNV7:49206] [ 4] /lib/x86_64-linux-gnu/libstdc++.so.6(+0xa2b9e)[0x7f46dbf43b9e]
[LAPTOP-I2TCFNV7:49206] [ 5] /lib/x86_64-linux-gnu/libstdc++.so.6(+0xae20c)[0x7f46dbf4f20c]
[LAPTOP-I2TCFNV7:49206] [ 6] /lib/x86_64-linux-gnu/libstdc++.so.6(+0xae277)[0x7f46dbf4f277]
[LAPTOP-I2TCFNV7:49206] [ 7] /lib/x86_64-linux-gnu/libstdc++.so.6(+0xae4d8)[0x7f46dbf4f4d8]
[LAPTOP-I2TCFNV7:49206] [ 8] /lib/x86_64-linux-gnu/libstdc++.so.6(_ZSt20__throw_length_errorPKc+0x40)[0x7f46dbf46449]
[LAPTOP-I2TCFNV7:49206] [ 9] ./matrix_mpi(+0xf2b6)[0x5610ce5d02b6]
[LAPTOP-I2TCFNV7:49206] [10] ./matrix_mpi(+0xefae)[0x5610ce5cffae]
[LAPTOP-I2TCFNV7:49206] [11] ./matrix_mpi(+0x9812)[0x5610ce5ca812]
[LAPTOP-I2TCFNV7:49206] [12] ./matrix_mpi(+0x9cf2)[0x5610ce5cacf2]
[LAPTOP-I2TCFNV7:49206] [13] /lib/x86_64-linux-gnu/libc.so.6(+0x29d90)[0x7f46dbc81d90]
[LAPTOP-I2TCFNV7:49206] [14] /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0x80)[0x7f46dbc81e40]
[LAPTOP-I2TCFNV7:49206] [15] ./matrix_mpi(+0x9685)[0x5610ce5ca685]
[LAPTOP-I2TCFNV7:49206] *** End of error message ***
[LAPTOP-I2TCFNV7:49205] *** Process received signal ***
[LAPTOP-I2TCFNV7:49205] Signal: Segmentation fault (11)
[LAPTOP-I2TCFNV7:49205] Signal code: Address not mapped (1)
[LAPTOP-I2TCFNV7:49205] Failing at address: 0x564412032000
malloc(): invalid size (unsorted)
[LAPTOP-I2TCFNV7:49205] *** Process received signal ***
[LAPTOP-I2TCFNV7:49205] Signal: Aborted (6)
[LAPTOP-I2TCFNV7:49205] Signal code:  (-6)
--------------------------------------------------------------------------
Primary job  terminated normally, but 1 process returned
a non-zero exit code. Per user-direction, the job has been aborted.
--------------------------------------------------------------------------
mpirun noticed that process rank 2 with PID 0 on node LAPTOP-I2TCFNV7 exited on signal 6 (Aborted).
--------------------------------------------------------------------------
tang@LAPTOP-I2TCFNV7:~$ mpicxx -o matrix_mpi matrix_mpi.cpp
mpicxx -o matrix_mpi matrix_mpi.cpp
mpirun -np 4 ./matrix_mpi
g++ -o matrix_multiplication matrix_multiplication.cpp
./matrix_multiplication
mpicxx -o matrix_mpi matrix_mpi.cpp
mpirun -np 4 ./matrix_mpi
[LAPTOP-I2TCFNV7:51870] *** Process received signal ***
[LAPTOP-I2TCFNV7:51870] Signal: Segmentation fault (11)
[LAPTOP-I2TCFNV7:51870] Signal code: Address not mapped (1)
[LAPTOP-I2TCFNV7:51870] Failing at address: 0x331
[LAPTOP-I2TCFNV7:51870] [ 0] /lib/x86_64-linux-gnu/libc.so.6(+0x42520)[0x7f84280b9520]
[LAPTOP-I2TCFNV7:51870] [ 1] ./matrix_mpi(+0x9f48)[0x56189c460f48]
[LAPTOP-I2TCFNV7:51870] [ 2] /lib/x86_64-linux-gnu/libc.so.6(+0x29d90)[0x7f84280a0d90]
[LAPTOP-I2TCFNV7:51870] [ 3] /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0x80)[0x7f84280a0e40]
[LAPTOP-I2TCFNV7:51870] [ 4] ./matrix_mpi(+0x9685)[0x56189c460685]
[LAPTOP-I2TCFNV7:51870] *** End of error message ***
--------------------------------------------------------------------------
Primary job  terminated normally, but 1 process returned
a non-zero exit code. Per user-direction, the job has been aborted.
--------------------------------------------------------------------------
mpirun noticed that process rank 0 with PID 0 on node LAPTOP-I2TCFNV7 exited on signal 11 (Segmentation fault).
--------------------------------------------------------------------------
mpicxx -o matrix_mpi matrix_mpi.cpp
matrix_mpi.cpp: In function ‘int main(int, char**)’:
matrix_mpi.cpp:64:56: error: invalid conversion from ‘int’ to ‘MPI_Datatype’ {aka ‘ompi_datatype_t*’} [-fpermissive]
In file included from matrix_mpi.cpp:1:
/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h:400:47: error: invalid conversion from ‘MPI_Datatype’ {aka ‘ompi_datatype_t*’} to ‘int’ [-fpermissive]
/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h:1171:20: note: in expansion of macro ‘OMPI_PREDEFINED_GLOBAL’
matrix_mpi.cpp:64:59: note: in expansion of macro ‘MPI_DOUBLE’
matrix_mpi.cpp:63:23: error: too many arguments to function ‘int MPI_Gatherv(const void*, int, MPI_Datatype, void*, const int*, const int*, MPI_Datatype, int, MPI_Comm)’
In file included from matrix_mpi.cpp:1:
/usr/lib/x86_64-linux-gnu/openmpi/include/mpi.h:1559:20: note: declared here
mpicxx -o matrix_mpi matrix_mpi.cpp
mpirun -np 4 ./matrix_mpi
export OMP_NUM_THREADS=4
g++ -fopenmp -std=c++11 -o matrix_multiplication matrix_multiplication.cpp
./matrix_multiplication
mpicxx -o matrix_mpi matrix_mpi.cpp
mpirun -np 4 ./matrix_mpi
mpicxx -o matrix_mpi matrix_mpi.cpp
mpirun -np 4 ./matrix_mpi
g++ -fopenmp -std=c++11 -o matrix matrix.cpp
./matrix
export OMP_NUM_THREADS=4
g++ -fopenmp -std=c++11 -o matrix_multiplication matrix_multiplication.cpp
./matrix_multiplication
<<" 在使用openmap前的并行域中的线程数量"<<count<<endl;
cout<<" 在使用openmap前的并行域中的线程号"




count=omp_get_num_threads();//线程数量
num=omp_get_num_procs();//线程号
cout<<" 在使用openmap前的并行域中的线程数量"<<count<<endl;
cout<<" 在使用openmap前的并行域中的线程号"<<numg++ -fopenmp omp_test.cpp -o omp_test
g++ -fopenmp omp_test.cpp -o omp_test
g++ -fopenmp omp_test.cpp -o omp_test
g++ -fopenmp omp_test.cpp -o omp_test
ls
pwd

g++ -fopenmp omp_test.cpp -o omp_test
ls
g++ -fopenmp omp_test.cpp -o omp_test
./omp_test
g++ -fopenmp omp_test.cpp -o omp_test
./omp_test
g++ -fopenmp omp_test.cpp omp_test
g++ -fopenmp omp_test.cpp -o omp_test
./omp_test
sudo apt update
sudo apt install -y sl
sl
jj
sudo apt update
sudo apt install -y sl
sl
sudo apt update
sudo apt install -y sl
sl
sudo apt update
sudo apt install -y sl
sudo apt update
sudo apt install -y sl
sl
sudo apt install cmatrix
cmatrix
echo "Hello"
cowsay
echo "hello"|cowsay
sudo apt install fortune 
fortune
sudo apt install cmatrix
cd
/cd
ls 5.2.md
/ls
/proc
/dev
/dev/null
/apt -h
/wsl
cd[~sum_product.cpp]
cd[/home/tang/wsl]
cd[/home/tang/matrix.cpp]
cd[~dot_product.cpp]
jj
g++ main.cpp printfhello.cpp factorial.cpp -o main
cd/
cd/mnt/e/factorial.cpp
cd/mnt/e/factorial
jj
ls/mnt/e
sudo mkdir /mnt/e
sudo mount -t drvfs E: /mnt/e
/mnt/e
jj
sudo mkdir -p /mnt/e
sudo mount -t drvfs E: /mnt/e -o metadata
ln -s /mnt/e/projects ~/e_projects
cd ~/e.main
cd~/e.factorial
g++ main.cpp printfhello.cpp factorial.cpp -o main
tang@LAPTOP-I2TCFNV7:/mnt/c/Users/Lenovo$ ln -s /mnt/e/projects ~/e_projectsl
ls/ mnt /
ls /mnt /4
ls /mnt /e
/mnt/
ls /mnt /
g++ main.cpp -o main
g++ factorial.cpp factorial
cd/
cd/mnt/
cd/file1.h
cd ../../../e
ls
cd
ls
g++ main.cpp factorial.cpp printfhello.cpp main
g++ main.cpp factorial.cpp printfhello.cpp -o  main 
./main
ll
make
rm *.o
rm main
make
ll
make
mark
make
ll
make
./hello
rm hello
make
.ll
ll
./hello
make
rm hello
make
./hello
make
make clean
rm hello
make
./hello
ll
make
rm hello
make
make hello
make
cd../
../
:make
makehello
g++ main.cpp factorial.cpp printfhello.cpp -o main
cd..
cd ..
g++ main.cpp factorial.cpp printfhello.cpp -o main
cd ~
g++ main.cpp factorial.cpp printfhello.cpp -o main
./main
make
./hello
sudo apt update
sudo apt install gdb
gdb -v
g++ a.cpp -o a
./a
g++ -g a.cpp
gdb ./a.cpp
g++ -g a.cpp
gdb ./a
man gdb
g++ -g a.cpp
gdb ./a
sudo apt update
sudo apt install coreutils-dbgsym
g++ -g a.cpp
./a
gdb ./a
list
gdb ./a
g++ -g a.cpp -o a 
./a
gdb ./a
gbd ./a
list
g++ -g a.cpp -o a
./a
gdb ./a
g++ -g a.cpp -o a
./a
gbd ./a
g++ -g ./a
g++ -g a.cpp
gdb a
g++ -g a.cpp -o a
./a
g++ -g a.cpp
gdb ./a
ll
vim gdb.text
cd..
cd ..
cd ~
ll
vim gdb.txt
cd ..
cd ~
gdb a
ll
cp a.cpp e.cpp
vim e.cpp
g++ -g e.cpp -o e
g++ -g e.cpp
./e
ll
man ulimit
ulimit -a
g++ -g e.cpp
./e
ll
gdb ./e core
g++ -g e.cpp -o e
g++ -g -o e  e.cpp
./e
g++ -g e.cpp -o e
./e
ll
gbd ./e core
gdb ./e core
ll
./e
sudo apt install systemd-coredump
su
echo "core_%e_%p_%t" > /proc/sys/kernel/core_pattern
ulimit -a
./e
gdb ./e core
./e
ll
sudo apt install systemd-coredump
su
coredumpctl list
g++ -g e.cpp -o e
./e
coredumpctl list
cat /proc/sys/kernel/core_pattern
sudo systemctl status systemd-coredump
ulimit -c unlimited
echo 'core' | sudo tee /proc/sys/kernel/core_pattern
cat /proc/sys/kernel/core_pattern
./e
coredumpctl list
ls core*
gdb ./e core
gdb ./e core.68147 
cp e.cpp f.cpp
vim c.pp
vim f.cpp
g++ -g f.cpp -o f
./f
./f &
gdb -p 71886
g++ -g f.cpp -o f
./f &
gdb -p 72896
cd ..
cd ~
g++ -g f.cpp -o f
./f &
gdb -p 1264
g++ -g f.cpp -o f
./f &
gdb -p 3105
g++ -g f.cpp -o f
./f &
gdb -p 4078
./ f &
g++ -g f.cpp -o f
./f &
gdb -p 5134
cd ..
cd ~
mkdir new_folder
cd new_folder
mkdir /home/projects
cd ..
mkdir /home/projects
mkdir ~/projects
ls ~/projects
ls
multipass list
vim
vi
wsl --list --verbose
man vim
cd ..
cd ~
sudo apt-get install hwloc
which lstopo
lstopo --version
lstopo --no-io --no-useless-caches > topology.txt
lscpu | grep -E "Core(s)|Thread(s)"
lscpu -all
lscpu --all
lscpu --all --extended
sudo apt install cpuid  # Debian/Ubuntusudo apt install cpuid  # Debian/Ubuntu
cpuid -1
cpuid -1 | grep -A 10 "flags"
clean
clear
make
./hello
cd codes/compile_first_steps/
make 1
make -f Makefile1
make
set -e
ROOT_PATH=`cd $(dirname $0) && pwd`
make
make'
cd ..
cd ~
make
g++ hello.cpp -o hello1
./hello1
echo "========"
echo "单文件编译"
set -e
ROOT_PATH=`cd $(dirname $0) && pwd`
SCRIPT_NAME=`basename $0`
SCRIPT=$ROOT_PATH/`basename $0`
cd ${ROOT_PATH}
m0D="${ROOT_PATH}/out/m0"
m1D="${ROOT_PATH}/out/m1"
make
cd codes/compile_first_steps/
bash compile.sh 
bash compile.sh m0
bash compile.sh m1
bash compile.sh m3
bash compile.sh m4
cd / codes
cd ..
cd ~
cd '/home/tang/LzuOssHPC-2023-main'
cd / codes/
cd/codes
cd /home/tang/LzuOssHPC-2023-main/codes/compile_first_steps'

cd /codes/compile_first_steps
cd ..
cd /'/home/tang/LzuOssHPC-2023-main/codes/compile_first_steps/compile.sh'
cd /home/tang/LzuOssHPC-2023-main/codes/compile_first_steps/compile.sh
cd '/home/tang/LzuOssHPC-2023-main'
cd / codes 
cd /codes /compile _first_steps
'/home/tang/LzuOssHPC-2023-main/codes/compile_first_steps/compile.sh'
cd /'/home/tang/LzuOssHPC-2023-main/codes/compile_first_steps/

complile.sh


/
bash compile.sh
ls
cd codes/compile_first_steps/
ls
bash compile.sh
./compile.sh
bash compile.sh 
bash compile.sh help
bash compile.sh m0
bash compile.sh  m1
bash compile.sh  m2
bash compile.sh  m3
bash compile.sh  m4
bash compile.sh m5
bash compile.sh clean
cd ..
cd compile_makefile/
make
ls $(SRC_DIR)
make
ls $(ROOT_DIR)/step2/src/main.cpp
ls $(ROOT_DIR)/step2/src
ls $(SRC_DIR)
ls
ls $(SRC_DIR)
ls $(ROOT_DIR)
cd ..
ls
cd compile_makefile/
cd ..
make
ls
cd compile_makefile/
make
ls
make
ls
make
ls
make
m
make
g++ -Wall -std=c++11 -I../inc -o bin/my_program obj/main.o obj/particle.o obj/v3.o
./bin/my_program
ls -l bin/my_program
./bin/my_program
./bin/my_program 5
cd ..
cd compile_cmake/
cmake ..
sudo apt update
sudo apt install cmake
cmake --version
cmake ..
ls
cmake .
make
rm -rf CMakeCache.txt CMakeFiles
cmake .
make
./main
./ main 4
./main 5
./ main 1
./main 1
rm -rf CMakeCache.txt CMakeFiles
cmake.
cmake .
make
./main 1
./ main 5
./main 4
./main 7
nvcc --version
clear
cd ..
tar -xvf hpc_sdk_*.tbz2
cd ..
cd ~/Downloads
ls -l hpc_sdk_*.tbz2
ls
# 方法1：直接删除标记文件
rm NVIDIA-Linux-x86_64-570.144.run:Zone.Identifier
ls
chmod +x NVIDIA-Linux-x86_64-570.144.run
sudo ./NVIDIA-Linux-x86_64-570.144.run --no-opengl-files
lspci | grep -i nvidia
lspci 
sudo virsh dumpxml <VM_NAME> | grep -i nvidia
sudo virsh dumpxml <VM_NAME> 
nvidia-smi  
nvcc --version
sudo apt install nvidia-cuda-toolkit
nvcc --version
cd src
cd '/home/tang/LzuOssHPC-2023-main'
cd codes/
cd upper_level_algorithm_opt/
cd scr
cd src/
g++ -std=c++17 -I../inc datagen.cpp -o datagen
./datagen 1000 1000 1000
mpicxx -std=c++17 -I../inc matrix_cal_mpi.cpp -o matrix_cal_mpi -lopenblas
sudo apt update
sudo apt install libopenblas-dev
ls /usr/lib/x86_64-linux-gnu/libopenblas.so*
# 使用 NVIDIA HPC SDK 编译 CUDA 实现
nvc++ -std=c++17 -I../inc matrix_cal_mpi_cuda.cu -o matrix_cal_mpi_cuda -lcublas
# 示例：编译 MPI 基础版本
mpicxx -std=c++17 -I../inc matrix_cal_mpi.cpp -o matrix_cal_mpi -lopenblas
./matrix_cal_mpi
./matrix_cal_mpi ./data
ls -l ./data
./matrix_cal_mpi ./src
./datagen 1000 1000 1000 ./data
./matrix_cal_mpi
./matrix_cal_mpi ./data
mpirun -np 10 ./matrix_cal_mpi ./data
pirun -np 100 ./matrix_cal_mpi ./data
mpirun -np 100 ./matrix_cal_mpi ./data
mpirun -np 20 ./matrix_cal_mpi ./data
clear
sudo apt update
sudo apt install linux-tools-$(uname -r) linux-cloud-tools-$(uname -r) linux-tools-common
cd ..
uname -runame -r
uname -r
sudo apt install linux-tools-common linux-tools-generic linux-cloud-tools-common
perf --version
sudo apt update
sudo apt  linux-tools-5.15.167.4-microsoft-standard-WSL2
sudo apt install linux-tools-5.15.167.4-microsoft-standard-wsl2
sudo apt install linux-tools-generi
sudo apt install linux-tools-generic
sudo apt install linux-tools-common
sudo apt update
uname -r
sudo apt install linux-headers-$(uname -r)
sudo apt update && sudo apt install -y linux-headers-generic-wsl
sudo apt install linux-tools-`uname -r` 
sudo apt update && sudo apt install -y software-properties-common
sudo add-apt-repository ppa:cappelikan/ppa -y
sudo apt update
sudo apt install -y wsl-kernel-package linux-headers-$(uname -r)
sudo apt update
sudo apt install --install-recommends linux-generic-hwe-22.04
uname -r
perf --version
sudo apt update && sudo apt install linux-tools-$(uname -r) linux-cloud-tools-$(uname -r) linux-tools-generic linux-cloud-tools-generic
sudo apt install linux-tools-generic linux-cloud-tools-generic
perf --version
sudo apt install linux-tools-5.15.167.4-microsoft-standard-WSL2
sudo apt update
sudo apt install linux-tools-common linux-tools-generic
sudo apt install linux-tools-$(uname -r)
sudo apt install build-essential flex bison dwarves libdw-dev libelf-dev
sudo apt install linux-tools-$(uname -r)
sudo apt install linux-tools-common perf
apt search linux-tools-
uname -r
sudo apt install linux-tools-generic
sudo apt install linux-tools-oracle
sudo apt install linux-tools-realtime
sudo apt install linux-tools-virtual
sudo apt update && sudo apt upgrade
sudo apt install linux-tools-generic linux-cloud-tools-generic
perf --version
sudo apt install linux-tools-standard-WSL2
sudo apt update
sudo apt install linux-tools-common linux-tools-generic linux-tools-`uname -r`
sudo apt install linux-tools-generic-wsl2
sudo apt install linux-tools-generic linux-tools-common
sudo apt update && sudo apt upgrade -y
sudo apt install linux-tools-$(uname -r)
sudo apt install wslu
sudo apt install linux-tools-wsl
lsb_release -a
sudo add-apt-repository universe
sudo apt update
sudo apt install linux-tools-generic
sudo perf --version
sudo apt install linux-tools-common
sudo apt install linux-tools-$(uname -r)
sudo apt update
sudo apt install linux-tools-standard-WSL2 linux-cloud-tools-standard-WSL2
sudo apt install linux-perf
uname -r
sudo apt install linux-tools-common
sudo apt install linux-tools-$(uname -r)
sudo apt install linux-tools-`uname -r`     linux-cloud-tools-`uname -r`     linux-tools-common     linux-cloud-tools-common
gcc -O3 -march=native -mtune=native -g -o matmul matmul.c -lm
sudo apt install linux-tools-generic linux-cloud-tools-generic
perf --version  # 检查性能分析工具是否安装成功
sudo apt install linux-tools-5.15.167.4-microsoft-standard-WSL2 linux-cloud-tools-5.15.167.4-microsoft-standard-WSL2
sudo apt install linux-cloud-tools-5.15.167.4-microsoft-standard-WSL2
sudo apt update
lsb_release -a
sudo add-apt-repository universe
sudo apt update
sudo apt install linux-tools-generic
sudo perf --version
sudo apt install linux-tools-common
sudo apt install linux-tools-$(uname -r)
sudo ln -s /usr/lib/linux-tools/$(uname -r) /usr/lib/linux-tools/generic
perf stat -e cycles,instructions sleep 1
sudo apt update && sudo apt upgrade
sudo reboot
sudo apt install linux-tools-`uname -r`
sudo apt update
sudo apt install linux-tools-common linux-tools-generic linux-tools-`uname -r`
sudo apt update && sudo apt install -y linux-tools-generic linux-tools-common
sudo apt autoremove
perf --version
sudo apt install linux-tools-5.15.167.4-microsoft-standard-wsl2
sudo apt install linux-cloud-tools-5.15.167.4-microsoft-standard-wsl2
sudo apt install linux-cloud-tools-generic
sudo apt install wslu
sudo apt update
sudo apt install linux-tools-5.15.167.4-microsoft-standard-wsl2
sudo apt install linux-tools-generic
sudo apt install linux-tools-common
uname -r  # 查看当前内核版本
sudo apt install linux-tools-$(uname -r)
uname -r  
sudo apt install linux-tools-$(uname -r)
sudo apt install $(uname -r)
sudo apt install linux-tools-wsl
sudo apt install linux-tools-common
perf --version 验证安装结果
建议优先使用通用包安装，
perf --version
sudo apt install linux-tools-5.15.167.4-microsoft-standard-WSL2 linux-cloud-tools-5.15.167.4-microsoft-standard-WSL2
uname -r
sudo apt install linux-tools-generic linux-cloud-tools-generic
sudo apt install linux-tools-generic linux-tools-common
sudo apt install linux-tools-common
perf --version
sudo apt install linux-tools-5.15.167.4-microsoft-standard-wsl2 linux-cloud-tools-5.15.167.4-microsoft-standard-wsl2
sudo apt install linux-tools-generic linux-cloud-tools-generic
perf stat
suao apt install linux-tools-5.15.167.4-microsoft-standard-WSL2
sudo apt install linux-tools-5.15.167.4-microsoft-standard-WSL2
wget https://registrationcenter-download.intel.com/akdlm/IRC_NAS/740981cd-e6af-4eb6-b147-c7912fadfb84/intel-vtune-2025.3.0.18_offline.sh
sudo sh ./intel-vtune-2025.3.0.18_offline.sh
sudo apt install linux-tools-generic linux-cloud-tools-generic
sudo apt install linux-tools-5.15.167.4-microsoft-standard-WSL2 linux-cloud-tools-5.15.167.4-microsoft-standard-WSL2
sudo apt install linux-tools-generic linux-tools-common
perf --version
sudo apt install linux-tools-5.15.167.4-microsoft-standard-WSL2
linux-cloud-tools-`uname -r`
source /opt/intel/oneapi/setvars.sh
vtune-server --help
ls
cd codes/upper_level_algorithm_opt/
ls
cd src
ls
vtune -collect hotspots ./matrix_cal_mpi
vtune-server --data-direectory .
source setvars.sh
source /opt/intel/oneapi/setvars.sh
vim ~/run vtune.sh
vtune-server --help
ls
source /opt/intel/oneapi/setvars.sh
source /opt/intel/
oneapi/ packagemanager/ 
cd /opt/intel/oneapi/
source setvars.sh
source /opt/intel/oneapi/setvars.sh
source /opt/intel/
source setvars.sh
source /opt/intel/oneapi/setvars.sh
cd ..
cd ~
source /opt/intel/oneapi/setvars.sh
vtune
cd '/home/tang/LzuOssHPC-2023-main/codes/upper_level_algorithm_opt'
cd src/
ls
vtune -collect hotspots ./matrix-1000-1000-1000.6.bin
vtune -collect threading ./matrix_cal_mpi_openmp.cpp
vtune -collect threading ./matrix_cal_mpi
vtune -collect threading ./matrix_cal_mpi./data
cd data/
ls
vtune -collect threading ./matrix-1000-1000-1000.0.bin 
vtune -collect threading -result-dir vtune_results ./matrix_cal_mpi ./data/matrix-1000-1000-1000-0.bin
mpirun -n 4 amplxe-cl -collect hotspots -result-dir vtune_results ./matrix_cal_mpi ./data/matrix-1000-1000-1000-0.bin
clear
pwd
cd ..
cd src
cd  data
pwd
cd
cd /
cd home
cd -
cd /home/ 
cd
ls
cd  LzuOssHPC-2023-main  
touch 124
ls
file 124
file QQ.jpg
cat codes
ls
cat 124
cd  problem-sets
history
ls
cd  ..
cd '/home/tang/LzuOssHPC-2023-main/codes/upper_level_algorithm_opt'
cd src
ls
touch 124
cd ..
mkdir 222
ls
mkdir -p 12/23/34
cd 12
ls
cd 23
ls
rm ~
rm 34
rm -f 34
cd ..
ls
find . -name 12
ls --help
ls -a
ls -l
ls -lh
man ls
exit
ls
file 124
file QQ.peg
file  QQ.jpg
echo hello
echo hello world
ls
echo hello world > 124
file 124
cat 124
echo hello world >>  124
cat 124
echo happy > 124
cat 124
echo hello world > 123
cat <123 >124
ls
cat 124
cat kjash
ls >dev>null
ls
echo $home
env
echo $PATH
ls
cat 123
cut - c 4 123
cut -c 3 123
cat 123
echo world>>123
cat 123
paste -s 123
head 123
vim 123
cat 123
head 123
tail 123
sort 123
sort -n 123
sort -r 123
ech hello >>123
echo hello >> 123
ls
ls  | grep 123
nl 123
ls | tea 123
ls | tee 123
cat 123
yim
vim
vtune
source /opt/intel/oneapi/setvars.sh
cd '/home/tang/LzuOssHPC-2023-main/codes/upper_level_algorithm_opt/src/data'
ls
cd ..
ls
vtune -collect threading ./ datagen  
nvcc matrix_cal_cuda.cu -o matrix_cal_cuda
cd '/home/tang/LzuOssHPC-2023-main/codes/upper_level_algorithm_opt/src
/
cd '/home/tang/LzuOssHPC-2023-main/codes/upper_level_algorithm_opt/src/




cd '/home/tang/LzuOssHPC-2023-main/codes/upper_level_algorithm_opt'
cd src
ls
nvcc matrix_cal_cuda.cu -o matrix_cal_cuda
nvcc matrix_cal_cuda.cu -I../inc -o matrix_cal_cuda
cuda
nvcc matrix_calc_cuda.cu -I../inc -o matrix_calc_cuda --std=c++11
ls - la
ls
nvcc matrix_cal_cuda.cu -I../inc -o matrix_cal_cuda --std=c++11
nvcc matrix_cal_cuda.cu -I../inc -o matrix_cal_cuda --std=c++17
nvcc --version
nvcc matrix_cal_cuda.cu -I../inc -o matrix_cal_cuda --std=c++14
nvcc matrix_calc_cuda.cu -I./inc -o matrix_calc_cuda --std=c++17
nvcc matrix_cal_cuda.cu -I./inc -o matrix_cal_cuda --std=c++17
nvcc matrix_cal_cuda.cu -I../inc -o matrix_cal_cuda --std=c++17
ls
vtune -collect threading ./ matrix_cal_mpi
source /opt/intel/oneapi/setvars.sh
vtune -collect threading ./ matrix_cal_mpi
vtune -collect threading ./ matrix_cal_mpi.cpp
vtune -collect hotspots ./matrix_cal_mpi
vtune-server --data-directory .
cd '/home/tang/LzuOssHPC-2023-main/codes/upper_level_algorithm_opt'
cd src
ls
g++ matrix_cal_general.cpp  -o matrix_cal_general
g++ -I../inc matrix_cal_general.cpp -o matrix_cal_general
./matrix_cal_general
mpirun -np 10 ./matrix_cal_general ./data
g++ -I../inc matrix_cal_mpi_openmp.cpp -o matrix_cal_mpi_openmp
g++ -I/home/tang/LzuOssHPC-2023-main/codes/upper_level_algorithm_opt/inc -fopenmp -o matrix_cal_openmp.exe /home/tang/LzuOssHPC-2023-main/codes/upper_level_algorithm_opt/src/matrix_cal_mpi_openmp.cpp
sudo apt-get install libopenmpi-dev openmpi-bin
mpic++ matrix_cal_mpi_openmp.cpp -o matrix_cal_mpi_openmp
cd ..
mpic++ matrix_cal_mpi_openmp.cpp -o matrix_cal_mpi_openmp
ls
cd src
ls
g++ -I../inc matrix_cal_mpi_openmp.cpp -o matrix_cal_mpi_openmpmpic++ -I/path/to/read_data_directory matrix_cal_mpi_openmp.cpp -o matrix_cal_mpi_openmp -fopenmp
mpic++ -I/path/to/read_data_directory matrix_cal_mpi_openmp.cpp -o matrix_cal_mpi_openmp -fopenmp
g++ -I../inc matrix_cal_mpi_openmp.cpp -o matrix_cal_mpi_openmpmpic++ -I/path/to/read_data_directory matrix_cal_mpi_openmp.cpp -o matrix_cal_mpi_openmp -fopenmp
sudo apt update
sudo apt install libopenmpi-dev openmpi-bin
mpicc --version
g++ -I/usr/include/mpi your_file.cpp -o output_file
mpicxx -std=c++11 matrix_cal_mpi_openmp.cpp -o matrix_cal_mpi_openmp -I/usr/local/cuda/include -L/usr/local/cuda/lib64 -lcudart
g++ -I/usr/include/mpi matrix_cal_mpi_openmp.cpp -o output_file
mpicxx -std=c++11 matrix_cal_mpi_openmp.cpp -o matrix_cal_mpi_openmp -I/usr/local/cuda/include -L/usr/local/cuda/lib64 -lcudart
g++ -I/usr/include/mpi matrix_cal_mpi_openmp.cpp -o output_file
mpicxx -std=c++11 matrix_cal_mpi_openmp.cpp -o matrix_cal_mpi_openmp -I/usr/local/cuda/include -L/usr/local/cuda/lib64 -lcudart
g++ -I../inc matrix_cal_mpi_openmp.cpp -o matrix_cal_mpi_openmpmpic++ -I/path/to/read_data_directory matrix_cal_mpi_openmp.cpp -o matrix_cal_mpi_openmp -fopenmp
mpic++ -I/home/tang/LzuOssHPC-2023-main/codes/upper_level_algorithm_opt/inc -fopenmp -o matrix_cal_mpi_openmp.exe /home/tang/LzuOssHPC-2023-main/codes/upper_level_algorithm_opt/src/matrix_cal_mpi_openmp.cpp
./matrix_cal_mpi_openmp.exe 
mpirun -np 10 ./matrix_cal__mpi_openmp.exe
mpirun -np 10 ./matrix_cal_mpi_openmp.exe
nvcc -o matrix_cal_cuda matrix_cal_cuda.cu -lcudart
cc -o matrix_cal_cuda matrix_cal_cuda.cu -lcudart
matrix_cal_cuda.cu:5:10: fatal error: read_data.hpp: No such file or directory
compilation terminated.
nvcc -o matrix_cal_cuda matrix_cal_cuda.cu -lcudart -I../inc
gcc --version
nvcc -std=c++71 -o matrix matrix_cal_cuda.cu
nvcc -std=c++17 -o matrix matrix_cal_cuda.cu
nvcc -std=c++17 -o matrix matrix_cal_cuda.cu -I../inc
nvcc --version
gcc --version
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.9.0/local_installers/cuda-repo-wsl-ubuntu-12-9-local_12.9.0-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-12-9-local_12.9.0-1_amd64.deb
sudo cp /var/cuda-repo-wsl-ubuntu-12-9-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-9
nvcc -std=c++17 -o matrix matrix_cal_cuda.cu -I../inc
nvcc --version
ls /usr/local/cuda-12.9
echo $PATH
ls /usr/local/cuda-12.9
nano ~/.bashrc  # 或 nano ~/.zshrc
nvcc --vesion
nvcc --version
gcc --version
nvcc -std=c++17 -o matrix matrix_cal_cuda.cu -I../inc
cd '/home/tang/LzuOssHPC-2023-main/codes/upper_level_algorithm_opt/src'

echo 'export PATH="/usr/local/cuda-12.x/bin:$PATH"' >> ~/.bashrc
ls /usr/local/
echo 'export PATH="/usr/local/cuda-12.9/bin:$PATH"' >> ~/.bashrc
nvcc --version
source ~/.bashrc  
nvcc --version
nvcc -std=c++17 -o matrix matrix_cal_cuda.cu -I../inc
cd '/home/tang/LzuOssHPC-2023-main/codes/upper_level_algorithm_opt'
cd src
ls
nvcc -std=c++17 -o matrix matrix_cal_cuda.cu -I../inc
./matrix
nvcc -std=c++17 -o matrix_cal_mpi_cuda  matrix_cal_mpi_cuda.cu -I../inc
nvcc -std=c++17 -o matrix_cal_mpi_cuda matrix_cal_mpi_cuda.cu -I/usr/include -I../inc
mpic++ -cc=nvcc -std=c++17 -o matrix_cal_mpi_cuda matrix_cal_mpi_cuda.cu -I../inc
sudo find / -name mpi.h 2>/dev/null
sudo apt update
apt list --upgradable
sudo apt-get install openmpi-bin libopenmpi-dev
nvcc -std=c++17 -I/usr/lib/openmpi/include -I../inc -o matrix_cal_mpi_cuda matrix_cal_mpi_cuda.cu
mpic++ nvcc -std=c++17 -o matrix_cal_mpi_cuda matrix_cal_mpi_cuda.cu -I../inc
mpic++-I../inc-nvcc -o matrix_cal_mpi_cuda matrix_cal_mpi_cuda.cu 
mpic++-I../inc nvcc -o matrix_cal_mpi_cuda matrix_cal_mpi_cuda.cu 
mpic++ -I../inc nvcc -o matrix_cal_mpi_cuda matrix_cal_mpi_cuda.cu 
nvcc -I../inc matrix_cal_mpi_cuda.cu -o matrix_cal_mpi_cuda
cd '/home/tang/LzuOssHPC-2023-main/codes/upper_level_algorithm_opt/src'
nvcc -I../inc matrix_cal_mpi_cuda.cu -o matrix_cal_mpi_cuda
fzf
sudo apt install fzf
cd /usr
fzf
cd -
nvcc -I../inc matrix_cal_mpi_cuda.cu -o matrix_cal_mpi_cuda -I/usr/nvcc -I/usr/include/x86_64-linux-gnu/mpi
nvcc -I../inc matrix_cal_mpi_cuda.cu -o matrix_cal_mpi_cuda -I/usr/nvcc -I/usr/include/x86_64-linux-gnu/mpi -lmpi
./matrix_cal_mpi_cuda
mpirun -np 10 ./ matrix_cal_mpi_cuda
mpirun -np 5 ./ matrix_cal_mpi_cuda
ls
g++ -fopenmp -o matrix_cal_openmp matrix_cal_openmp.cpp
g++ -fopenmp -o matrix_cal_openmp matrix_cal_openmp.cpp -I../inc
./matrix_cal_openmp 
ls
OMP_NUM_THREADS=4 ./matrix_cal_openomp
OMP_NUM_THREADS=4 ./matrix_cal_openmp
OMP_NUM_THREADS=10 ./matrix_cal_openmp
ls
sudo apt-get update
sudo apt-get install libopenblas-dev
g++ -o matrix_cal_openblas matrix_cal_openblas.cpp -lopenblas -lpthread -fPIC -I../inc
./matrix_cal_openblas 
ls
git --version
git init
git --version
git config --global user.name "123daf"
git config --global user.email  1136347230@qq.com
