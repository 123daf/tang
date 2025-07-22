# NCCL深度解析笔记

## 一、NCCL的核心价值
### 1. 解决通信瓶颈
- **多GPU训练痛点**：梯度同步（如AllReduce）占大量时间
- **GPU直连技术**：
  - 使用NVLink/GPUDirect RDMA绕过CPU
  - 实现GPU显存直接互访（带宽提升5-10倍）
  - 对比传统MPI：GPU→CPU→网络→CPU→GPU拷贝

### 2. 硬件感知优化
- 自动检测硬件拓扑（NVLink/PCIe/InfiniBand）
- 智能选择最优通信路径：
  - 同节点GPU：优先走NVLink（300GB/s）
  - 跨节点通信：走RDMA网络

## 二、5大核心通信操作

| 操作        | 作用                          | 应用场景                |
|-------------|-------------------------------|------------------------|
| AllReduce   | 所有GPU数据求和后广播结果      | 梯度同步（主流场景）    |
| Broadcast   | 主GPU广播数据到所有GPU        | 初始化模型参数          |
| Reduce      | 所有GPU数据求和，结果存到主GPU | 汇总训练损失值          |
| AllGather   | 收集所有GPU数据拼接成大张量    | 分布式推理结果聚合      |
| ReduceScatter| 先求和再分片到各GPU           | 混合并行训练            |

**关键区别**：
- `AllReduce = Reduce + Broadcast`
- `ReduceScatter = Reduce + Scatter`

---

## 三、核心编程模式

### 🚀 模式一：单进程控制单GPU
```
