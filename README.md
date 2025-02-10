# 大学物理实验（1.5学分） MATLAB 绘图代码

> [!WARNING]
> 代码和数据仅供学习参考，请勿直接抄袭！

## 仓库文件结构说明

1. 大部分代码都使用了 `discoverDegree` 函数（自己写的一个最低阶多项式拟合函数），运行脚本时需要将 `main.m` 和 `discoverDegree.m` 放在同一个文件夹内。
2. 一个实验一个文件夹，包含：
   - `main.m`：主程序
   - `.mat` 文件：数据（不是必要的，理论上<ins>**你应该使用自己的数据并填入上述主程序**</ins>！）
   - `.png` 或 `.pdf` 文件：示例输出结果
     
     > **Note**：由于部分代码已遗失，个别图片的绘制代码可能并没有包括在 `main.m` 中！  
     > ~~不过没掉的基本都是线性拟合的，所以问题也不大~~
     
3. `Default.m` 是默认模版（使用 `discoverDegree`），`LinearFit.m` 是线性拟合模版（可独立运行）

## 内容说明（有关代码 & 实验）

1. 在需要输入数据的地方，代码中已添加容易理解的注释和说明
2. 输出的文字内容（拟合方程式和 $R^2$ 值）在图片中的位置是根据**样本点的位置**和**横纵坐标**硬编码的，可能需要根据实际数据调整
3. 为了保证打印后线条清晰，`LineWidth` 建议至少为 `1.5`，可以自查一下
4. MATLAB图窗默认保存格式为 `.fig`，另存为 `.pdf` 文件会有上下白边（见密立根实验），暂时不知道如何处理

> [!TIP]
> 回顾时发现写的代码还是挺糟糕的，不够精简，可能唯一的优点就是生成的结果好看了（~~还真不如用Origin画~~）
>
> 欢迎指出可改进之处！也欢迎上传你使用该代码用于其他实验的文件！😉
