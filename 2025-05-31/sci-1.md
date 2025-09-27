 ### 1. 什么是编译器？
​​编译器​​是一种将高级编程语言（如C/C++）编写的源代码转换为计算机可以直接执行的机器代码（或中间代码）的程序
### 2.市面上常见的 C/C++ 编译器
1. ​​GCC (GNU Compiler Collection)
​​​​简介​​：开源的编译器套件，支持多种语言（C/C++、Fortran等），由GNU项目维护。
2. ​​Clang/LLVM​​
​​简介​​：基于LLVM架构的C/C++编译器前端，由苹果主导开发。
3. Microsoft Visual C++ (MSVC)​​
​​简介​​：微软开发的编译器，集成于Visual Studio。
​​适用平台​​：Windows、Xbox。
### 3.如何选择编译器？
​- ​学习/开源项目​​：GCC或Clang（跨平台、社区支持好）。
​​Windows原生开发​​：MSVC（IDE集成度高）或MinGW-w64。
​​高性能计算​​：Intel ICC（针对CPU优化）。
​​Web/跨平台​​：Emscripten（编译为WebAssembly）。
​​嵌入式系统​​：GCC或ICC（根据目标硬件选择）。
### 二. June 2023 发布的 Top500 榜单中能效比、峰值性能最高的两台超算分别是什么
能效比（即每瓦特的性能）和峰值性能（即理论最大计算能力
能效比最高：Fugaku（日本富士通）
峰值性能最高：Frontier（美国Frontier）
## 3.lstopo
 1. ![lstopo使用](https://i.imgur.com/Zp33p5S.png)
 2. ![lscpu](https://i.imgur.com/MudFwgQ.png)
 3. ![cpuid](https://i.imgur.com/nyZ2auV.png)
 - 快速查看 CPU 核心数、架构	lscpu	输出简洁，适合人类阅读
- 检查指令集支持（如 AVX）	cpuid	显示详细标志位
------
#  sci_2
```
set -e

ROOT_PATH=`cd $(dirname $0) && pwd`
SCRIPT_NAME=`basename $0`
SCRIPT=$ROOT_PATH/`basename $0`
cd ${ROOT_PATH}
````
1. set -e​​
​​作用​​：设置脚本遇到错误时立即退出
2. ROOT_PATH=\cd (dirname0) && pwd``​​
​​作用​​：获取脚本所在目录的​​绝对路径​​。
dirname $0：获取脚本的路径（$0 表示脚本自身路径）。
cd ... && pwd：切换到脚本所在目录并输出绝对路径。
3. SCRIPT_NAME=\basename $0``​​
​​作用​​：提取脚本文件名（不含路径）。
例如，若脚本名为 compile.sh，则 SCRIPT_NAME=compile.sh。
4. SCRIPT= $ROOT_PATH/'basename $0'
​​作用​​：拼接脚本的​​绝对路径​​（与 ROOT_PATH + SCRIPT_NAME等价）
5. cd ${ROOT_PATH}​​
​​作用​​：将当前工作目录切换到脚本所在目录。
---
````
m0D="${ROOT_PATH}/out/m0"
m1D="${ROOT_PATH}/out/m1"
m2D="${ROOT_PATH}/out/m2"
m3D="${ROOT_PATH}/out/m3"
m4D="${ROOT_PATH}/out/m4"
m5D="${ROOT_PATH}/out/m5"

mkdir -p ${m0D} ${m1D} ${m2D} ${m3D} ${m4D} ${m5D}
````
这为不同构建模块（m0 到 m5）在脚本所在目录的 out/ 子目录下创建独立的输出路径。
mkdir -p 命令​​
​​作用​​：批量创建多个目录（m0D 到 m5D)

```
g++ src/main.cpp -o ${m1D}/main.o -g -ggdb -O0 -std=c++17 -I./inc -Wall -march=native -c
g++ src/particle.cpp -o ${m1D}/particle.o -g -ggdb -O0 -std=c++17 -I./inc -Wall -march=native -c 
g++ src/v3.cpp -o ${m1D}/v3.o -g -ggdb -O0 -std=c++17 -I./inc -Wall -march=native -c
 ```
 g++ [源文件] -o [输出文件] [编译选项] -c

 -c：仅编译不链接，生成目标文件（.o）。
-g -ggdb：生成调试信息，支持 GDB 调试。
-O0：禁用优化（便于调试）。
-std=c++17：指定 C++17 标准。
-I./inc：添加头文件搜索路径（inc 目录下的头文件）。
-Wall：开启所有警告信息。
-march=native：针对当前 CPU 架构优化（可能降低可移植性）。
```
g++ ${m1D}/main.o ${m1D}/particle.o ${m1D}/v3.o -o ${m1D}/main
g++ src/main.cpp -o ${m4D}/main.o -g -ggdb -O0 -std=c++17 -I./inc -Wall -march=native -c
g++ src/particle.cpp -o ${m4D}/particle.o -g -ggdb -O0 -std=c++17 -I./inc -Wall -march=native -c
g++ src/v3.cpp -o ${m4D}/v3.o -g -ggdb -O0 -std=c++17 -I./inc -Wall -march=native -c
ar crv ${m4D}/libv3.a ${m4D}/v3.o
ar crv ${m4D}/libparticle.a ${m4D}/particle.o
ranlib ${m4D}/libv3.a
ranlib ${m4D}/libparticle.a
```
ar crv：将目标文件打包为静态库（.a）。
libv3.a：包含 v3.o 的静态库。
libparticle.a：包含 particle.o 的静态库。
ranlib：为静态库生成索引，加速链接时符号查找。
```
g++ ${m4D}/main.o -o ${m4D}/main -static -Wl,-L${m4D} -lparticle -lv3 
g++ ${m4D}/main.o -o ${m4D}/main_1 -Wl,-L${m4D} -lparticle -lv3
```
-static：强制静态链接所有库（即使存在动态库）。
-Wl,-L${m4D}：指定链接器搜索库文件的路径为 out/m4。
-lparticle：链接名为 libparticle.a 的静态库。
-lv3：链接名为 libv3.a 的静态库。

# sci 4 vtune
- VTune是性能分析工具，用于分析CPU、GPU、内存等。常见的使用场景包括热点分析、内存访问分析、多线程分析等。
- 注意vtune分析的得是可执行文件！！！二进制文件不可以！
1. 使用前先使用source /opt/intel/oneapi/setvars.sh来为vtune的使用配置环境。
2. 可以用vtune-server --help 来查看一些vtune相应指令。
3. vtune -collect hotspots ./matrix_cal_mpi 分析cpu热点（matrix_cal_mpi为要分析的文件名）
4. 启动服务（数据存储到当前目录）
vtune-server --data-directory .（有个.别漏了）
- 然后系统会生成了一个自签名TLS证书，路径为/home/tang/.intel/vtune/settings/certificates/middleware.crt。生成自签名证书是为了通过HTTPS安全地访问VTune的Web界面。
- 有一个网址，可以使用浏览器访问提供的URL来使用VTune的可视化分析界面。！！！
5. vtune -collect memory-access ./文件名!!
内存访问分析​
6. vtune -collect threading ./文件名 
线程与锁分析​，分析线程竞争、锁争用、并行效率。
7. vtune -collect gpu-hotspots
GPU 分析（需 OpenCL/Vulkan 应用），分析 GPU 内核执行时间、内存传输开销。
8.vtune -report html -r ./result -o report.html
-r：指定分析结果目录
-o：输出文件名（默认 report.html）。
9. vtune -results 
​查看已保存结果​​。
10. 结果
![sci4](https://i.imgur.com/zFTuLl9.png)
