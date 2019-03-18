---
layout: post
title: 学生论文分享第一期
icon: star-o
---

分享内容：  
1.乔子越：《图表示学习》(AAAI 2019 Tutorial)   
2.赵子豪：《关系归纳偏好，深度学习，图网络》（DeepMind论文)  

---	
## 1.《图表示学习》

- [引言](#引言)
- [主要内容](#主要内容) 
- [结语](#结语) 
- [参考文献](#参考文献) 

### 引言
本次汇报主要内容是图神经网络。介绍了图与深度学习的结合，图神经网络的基本框架和变种。    

图是一种数据结构，它对一组对象（节点）及其关系（边）进行建模。近年来，由于图结构的强大表现力，用机器学习方法分析图的研究越来越受到重视。图神经网络（GNN）是一类基于深度学习的处理图域信息的方法。由于其较好的性能和可解释性，GNN 最近已成为一种广泛应用的图分析方法。   

### 主要内容
关于图神经网络的研究，目前基本都是集中在邻节点信息的传播和聚合这个核心要点上，简单的说就是某个图节点的性质主要由其邻节点的性质影响，这个其实就是学习图的结构化特性。一般来说，一个图节点的特征主要包含：图节点自身的特征（如节点标签、描述等）、图节点与其它节点之间的关联特征（也就是这里的结构化特征）。而图神经网络的主要思想就是学习CNN获取空间特征的方法，来获取空间结构化特征。  

![](/img/presentation/2019-02-25/GNN1.png)  

对于结构化特征的学习，主要涉及到图结构中的三要素：节点、边、子图，三者的特征相互影响。节点的特征影响边特征、子图的全局特征，同样，边特征也影响节点特征以及全局子图特征。GraphNet的核心就是把这三者看成是模型的三个基础模块，通过传播和聚合两种方式进行组合，形成整体的模型，所以它的特征就是：图输入，图输出，模型只是通过传播和聚合改变了节点、边以及子图的特征。  

简单来说，目前大多数的图神经网络实际上是一种对图网络中的节点进行深度非线性的编码，是的节点的表征向量最终分布在一个连续的表征空间中，根据不同的应用场景和问题定义不同的损失函数，进而对图神经网络进行训练。  

本次分享所展示Tutorial里边，介绍了一些目前经典的模型，其中有： Graph Convolutional Networks，GraphSAGE，Gated Graph Neural Networks，Graph Attention Networks，以及Subgraph and graph embeddings，另外还有例如图对抗生成网络、动态图神经网络没有做更多的展示，更为详细的图神经网络的各种变体如下图所示[1]： 

![](/img/presentation/2019-02-25/GNN2.png)    

### 结语
在结构化场景中，GNN 被广泛应用在社交网络、推荐系统、物理系统、化学分子预测、知识图谱等领域。文章中主要介绍了其在物理、化学、生物和知识图谱中的部分应用。同时GNN可以在图像和文本等非结构领域中应用。 

但目前GNN领域仍然有一些不足之处，主要有以下几个方面：

1. **浅层结构**。经验上使用更多参数的神经网络能够得到更好的实验效果，然而堆叠多层的 GNN 却会产生 over-smoothing 的问题。具体来说，堆叠层数越多，节点考虑的邻居个数也会越多，导致最终所有节点的表示会趋向于一致。

2. **动态图**。目前大部分方法关注于在静态图上的处理，对于如何处理节点信息和边信息随着时间步动态变化的图仍是一个开放问题。

3. **非结构化场景**。虽然很多工作应用于非结构化的场景（比如文本），然而并没有通用的方法用于处理非结构化的数据。

4. **扩展性**。虽然已经有一些方法尝试解决这个问题，将图神经网络的方法应用于大规模数据上仍然是一个开放性问题。


---
## 2.《关系归纳偏好，深度学习，图网络》
### 《Relational inductive biases, deep learning, and graph networks[2]》论文内容概括
机器学习界有三个主要学派，符号主义（Symbolicism）、连接主义（Connectionism）、行为主义（Actionism）。

符号主义的起源，注重研究知识表达和逻辑推理。经过几十年的研究，目前这一学派的主要成果，一个是贝叶斯因果网络，另一个是知识图谱。

在本篇论文里，作者探讨了如何在深度学习结构（比如全连接层、卷积层和递归层）中，使用关系归纳偏置（relational inductive biases），促进对实体、对关系，以及对组成它们的规则进行学习。
他们提出了一个新的AI模块——图网络（graph network），是对以前各种对图进行操作的神经网络方法的推广和扩展。图网络具有强大的关系归纳偏置，为操纵结构化知识和生成结构化行为提供了一个直接的界面。
作者还讨论了图网络如何支持关系推理和组合泛化，为更复杂、可解释和灵活的推理模式打下基础。

![image](https://github.com/Airzihao/MDPicturePool/raw/master/Paper/relational_network2.png)

本论文提出的图网络（GN）框架定义了一类对图结构表征进行关系推理的函数。

![image](https://github.com/Airzihao/MDPicturePool/raw/master/Paper/relational_network1.png)

该 GN 框架泛化并扩展了多种图神经网络、MPNN 和 NLNN 方法（Scarselli 等，2009a; Gilmer 等，2017; Wang 等，2018c），并支持从简单的构建模块建立复杂的架构。注意，这里避免了在「图网络」中使用「神经」术语，以反映它可以用函数而不是神经网络来实现，虽然在这里关注的是神经网络实现。

![image](https://github.com/Airzihao/MDPicturePool/raw/master/Paper/relational_network3.png)

---
## 参考文献
- [1] Zhou J, Cui G, Zhang Z, et al. Graph Neural Networks: A Review of Methods and Applications[J]. arXiv preprint arXiv:1812.08434, 2018.  
- [2] Battaglia P W, Hamrick J B, Bapst V, et al. Relational inductive biases, deep learning, and graph networks[J]. arXiv preprint arXiv:1806.01261, 2018.

---
## 附件
[grah representaion learning.rar](/img/presentation/2019-02-25/grah representaion learning.rar)  (AAAI 2019 Tutorial)     
[Graph Network.pptx](/img/presentation/2019-02-25/2019.02.25Graph Network.pptx)