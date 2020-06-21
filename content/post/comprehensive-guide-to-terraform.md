---
title: "Terraform 综合指南"
date: 2020-06-18T13:32:59+08:00
draft: false
categories: ["翻译练习"]
series: ["Terraform 综合指南"]
---

原文链接：[https://blog.gruntwork.io/a-comprehensive-guide-to-terraform-b3d32832baca](https://blog.gruntwork.io/a-comprehensive-guide-to-terraform-b3d32832baca)

---

从今天开始，我们会发布一系列的博客来介绍我们在实际场景中如何使用 `Terraform` 来定义和管理我们的“基础架构即代码”(`infrastructure-as-code`)。
如果你之前没有使用过 `Terraform`，`Terraform` 是一款开源工具，能够让你以一种简单、声明式的程序语言来定义你在多种云服务商（譬如，AWS，Azure，Google Cloud，Digital Ocean 等）上的基础架构并通过一些简单的命令行操作管理和部署他们。

在 [Gruntwork](http://www.gruntwork.io/)，我们使用 `Terraform` 作为我们 [基础架构即服务工具库](https://gruntwork.io/infrastructure-as-code-library/) 中的主要工具之一。该工具库收集了支持 AWS，GCP 的超过 300,000 行可复用、经过实践检验、具备商业支持的工业级代码并已经在数百家公司的线上环境使用。在这篇介绍文章中，我们将会讨论为什么我们认为每一家软件公司都需要实践基础架构即代码。在本系列剩下的文章中，我们也会涉及以下主题：

1. [为什么我们使用 `Terraform` 而不是 `Chef`, `Puppet`, `Ansible`, `SaltStack` 或者 `CloudFormation`]()
2. [`Terraform` 介绍]()
3. [如何管理 `Terraform` 状态]()
4. [如何使用 `Terraform Modules` 创建可复用的基础架构]()
5. [`Terraform` tips & tricks: 循环，`if` 语句和陷阱]()
6. [像一个团队一样使用 `Terraform`]()

因此，让我们开始讨论为什么每一家软件公司都需要使用代码来定义他们的基础架构。

## 为什么使用代码定义基础架构？

很久很久以前，在一个很远很远的数据中心，一群被被称为系统管理员的强大人类手动部署系统架构。每一台服务器，每一条路由表配置，每一个数据库配置以及每一个负载均衡器都是由手工创建并维护。这是一个黑暗和充满恐惧的时代：害怕宕机，害怕突然搞错配置文件，害怕缓慢并脆弱的部署，同时也害怕系统管理员转向黑暗面时会发生的事（星战梗）。好消息是，感谢 `DevOps` 联盟的反叛，我们现在有了一个更好的方式来做这些事情：基础架构即代码（IAC）。

不同于在一个 `Web UI` 上点来点去，或者 `SSH` 到一台服务器上然后手动执行命令，IAC 背后的思想是写代码来定义、配置和管理你的基础架构。这带来一系列的好处：

1. 你可以自动化你整个的配置和部署过程，让它变得比任何手动过程更快和更可靠。
2. 你可以在源文件中展示你系统架构的状态，而不是让它保存在系统管理员的脑子中，这样所有人都可以阅读。
3. 你可以使用版本管理工具管理那些文件。这意味着你的系统架构的完整变更历史都在提交记录里保存下来了。你可以使用这些记录来 debug，如果有需要，也可以随时回退到任何历史版本。
4. 你可以通过 `code review` 和自动化测试验证你的每一个系统架构变更。
5. 你可以创建(或直接 [购买](https://gruntwork.io/infrastructure-as-code-library/))一组可复用的、文档齐全的经过实践检验的系统架构代码来让你的系统架构更容易扩展和演进。

使用 IAC 的另一个非常重要且经常被忽略的原因是：它让开发者更开心。部署代码是一件重复和乏味的工作。机器可以快速和可靠地执行这些任务，但人做的很慢并容易出错。此外，开发者很容易对这类任务感到厌烦。因为这类工作没有创造力，没有挑战，也没有认同感。你可能在数个月内完美地部署代码，但没有人会注意到，直到你某一天搞砸了。

这造成了充满压力和不愉快的环境。IAC 提供了一个更好的选择来让计算机来做他们最擅长的事（自动化），同时让开发者做他们擅长的事（编码）。

## 为什么是 `Terraform`

有很多种方式来做 IAC，从最简单的全程手写脚本到使用可管理的服务如 Puppet Enterprise. 为什么我们选择了 `Terraform` 作为我们的 IAC 工具？要找到答案，请转到我们的系列的第 1 部分：[为什么我们使用 `Terraform` 而不是 `Chef`, `Puppet`, `Ansible`, `SaltStack` 或者 `CloudFormation`]()

有关本系列博客文章的扩展版本，请参阅《[Terraform: Up & Running](https://www.amazon.com/Terraform-Running-Writing-Infrastructure-Code/dp/1492046906)》（该书第二版已发布）。如果你的公司在 `Terraform`， `DevOps` 的实践或者 `AWS` 需要帮助，欢迎与我们 [GruntWork](http://www.gruntwork.io/?ref=gruntwork-blog-terraform-comprehensive) 联系。
