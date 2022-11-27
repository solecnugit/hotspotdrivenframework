# A Hotspot-Driven Semi-Automated Competitive Analysis Framework

为了识别一些高性能编译器内部采用的优化手段，我们提出了一个热点驱动的半自动的编译器关键优化识别框架。该框架首先通过性能分析工具`Linux perf`获取相同源代码不同编译器生成的binary的运行时间、热点分布等信息，然后通过选择算法选出影响不同编译器生成binary性能差异的关键热点函数；之后利用`DynamoRIO Client`只分析特定热点函数的指令分布特征。根据指令特征分布的差距进一步为后续的二进制分析缩小范围。上述步骤均可通过框架自动完成，根据指令特征进行二进制分析的过程需要手动识别。

## 安装依赖

- [DynamoRIO](https://github.com/DynamoRIO)
- [Linux perf](https://perf.wiki.kernel.org/index.php/Main_Page)
- [screen](https://linux.die.net/man/1/screen)
- [Cmake](https://cmake.org/files/)
- python3 (pandas/numpy)
  在运行Linux perf之前需要如下命令：
  ```js
  sudo sysctl -w kernel.perf_event_paranoid=-1
  ```

---

## 使用方法

### 利用docker镜像启动应用程序(可跳过)

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

### 编译被分析的可执行文件

```js
cd ./Samples && make
```

---

### 编译DynamoRIO Client

```js
cd Dynamorio_lib && mkdir build && cd build
export DYNAMORIO_DIR=path/to/dynamorio_build
cmake .. 
make
```

---

### 配置json文件

我们的框架通过json文件来设置程序运行过程中所需的全部参数，默认json均为config.json。参数作用具体描述如下：

- **paths** :半自动框架用到的路径集合
  
  - benchpath：被分析的可执行文件所在路径
  - dynamoriolibpath：自定义的DynamoRIO lib(client)所在路径
  - outpath：输出结果的路径（一级目录）
  - dynamoriopath：DynamoRIO所在路径
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
$ ./run-framework.sh
$ screen -ls 
    No Sockets found in /run/screen/..
$ ./output- report.sh
```

在命令行输入`./run-framework.sh`就可以运行自动化框架，当脚本运行完成后（`screen -ls`显示`No Sockets found in /run/screen/..`），输入`./output- report.sh`命令，可以在之前指定目录输出总结性报告`output_report.out`。这两个脚本中默认的json为config.json，更改脚本中的config_json变量，可以更改全局的配置文件。

---

## 输出结果
- **disassemble-data** :输出可执行文件的反汇编文件。
- **instrument-data** :按函数名称插桩获取到特定函数的指令特征,该文件夹下文件名称为application_function.csv/application_function_simd.csv
- **instrument-data-logical-address** :按逻辑地址插桩获取特定区间的指令特征,该文件夹下文件名称为application_range.csv/application_range_simd.csv
- **application1_identified_hotspots.json** :输出可执行文件1的“关键”热点函数。
- **application2_identified_hotspots.json** :输出可执行文件2的“关键”热点函数。
- **output_report.out** :输出总结性报告。