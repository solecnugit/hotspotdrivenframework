# A Hotspot-Driven Semi-Automated Competitive Analysis Framework

为了识别一些高性能编译器内部采用的优化手段，我们提出了一个热点驱动的半自动的编译器关键优化识别框架。该框架首先通过性能分析工具`Linux perf`获取相同源代码不同编译器生成的binary的运行时间、热点分布等信息，然后通过选择算法选出影响不同编译器生成binary性能差异的关键热点函数；之后利用`DynamoRIO Client`只分析特定热点函数的指令分布特征。根据指令特征分布的差距进一步为后续的二进制分析缩小范围。上述步骤均可通过框架自动完成，根据指令特征进行二进制分析的过程需要手动识别。

## 安装依赖

- [DynamoRIO](https://github.com/DynamoRIO)
- [Linux perf](https://perf.wiki.kernel.org/index.php/Main_Page)
- [screen](https://linux.die.net/man/1/screen)
- [Cmake](https://cmake.org/files/)
- python3 (pandas/numpy)
- DynamoRIO对glibc2.35+的支持存在一定问题，因此要选择glibc2.34及以下的linux操作系统。
- 在运行Linux perf之前需要如下命令：
  ```js
  sudo sysctl -w kernel.perf_event_paranoid=-1
  ```
---

## 基本使用方法

### 利用docker镜像启动应用程序

查看内核版本
```js
uname -a
>Linux taishan-200 5.15.0-41-generic #44-Ubuntu SMP Thu Jun 23 11:20:13 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux
```

将Dockerfile-ubuntu-20.04中的第19行替换为指定的内核版本，例如：
```js
linux-tools-*\ ->  linux-tools-5.15.0-41-generic\
```

构建docker镜像

```js
make build
```
运行docker镜像

```js
make run
```

下载并解压DynamoRIO

```js
make tools
```

### 尝试工具基本用法

```js
cd ./Samples && make
```

---

### 编译DynamoRIO Client

---

### 配置json文件

我们的框架通过json文件来设置程序运行过程中所需的全部参数，参数作用具体描述如下：

- **paths** :半自动框架用到的路径集合
  
  - benchpath：被分析的可执行文件所在路径
  - dynamoriolibpath：自定义的DynamoRIO lib(client)所在路径,在X64平台上为Dynamorio_lib/X64，AArch64平台上为Dynamorio_lib/AArch64
  - outpath：输出结果的路径（一级目录）
  - dynamoriopath：DynamoRIO所在路径，执行完make tools之后，框架自动配置的路径为DynamoRIO
- **Application**
  
  - application1：可执行文件1的名称
  - application2：可执行文件2的名称
  - run_command1：可执行文件1的运行命令
  - run_command2：可执行文件2的运行命令
- **subfile**：输出结果的具体文件夹名称（二级目录）
- **hotspot_selection_threshold**：设置关键热点选择算法的阈值(Threshold)。top10热点函数占总开销的threshold%以上时，选择开销总和占程序开销Threshold%的函数作为关键热点函数。top10热点函数占总开销的Threshold%以下时，选择开销大于top10热点函数平均开销的函数作为关键热点函数。
- **runmode**：运行模式
  
  - function_name：针对函数名进行插桩（半自动分析模式）
  - logical_address：针对逻辑地址插桩（手动分析模式）
- **logical_address**：在半自动分析模式下，直接根据热点函数的名称进行插桩即可，在后续的汇编分析过程中，可能会涉及到更细粒度的分析，因此需要针对逻辑地址进行插桩。以下内容是逻辑地址插桩的配置。
  
  - application1：可执行文件1对逻辑地址插桩的配置。
    - instrumentation：是否对可执行文件1插桩
    - start：起始地址
    - end：终止地址
  - application2：可执行文件2对逻辑地址插桩的配置。
    - instrumentation：是否对可执行文件2进行插桩
    - start：起始地址
    - end：终止地址

---

### 运行

```js
$ ./run-framework.sh config.json
```

在命令行输入`./run-framework.sh xxx.json`就可以运行自动化框架，当脚本运行完成后有关结果就会输出到对应目录。更改命令行中的json文件名称，可以更改全局的配置文件。

如果要复现论文中的结果，则分别采用配置好的json文件config_exchange.json和config_omnetpp.json文件。

---

## 输出结果
- **disassemble-data** :输出可执行文件的反汇编文件。
- **instrument-data** :按函数名称插桩获取到特定函数的指令特征,该文件夹下文件名称为application_function.csv
- **instrument-data-logical-address** :按逻辑地址插桩获取特定区间的指令特征,该文件夹下文件名称为application_range.csv
- **application1_identified_hotspots.json** :输出可执行文件1的“关键”热点函数。
- **application2_identified_hotspots.json** :输出可执行文件2的“关键”热点函数。
- **report.out** :输出总结性报告。