---
title: "从zsh迁移到fish了"
date: 2015-03-20T23:59:04+08:00
draft: false
---

自从知道 fish 之后，就一直很眼红 fish 的补全和高亮功能。
之前也有过一次短暂迁移的经历，配置好了基本的 fish 和 oh-my-fish 环境，然后就放弃了。。。
理由是，fish 不兼容 bash，现有的一些脚本没法用。而且用的 VIM 插件中有依赖 posix shell 的，
换了 fish 导致插件不可用（虽然当晚就找到解决方案并解决了。。。解决方案见文末。。。

记录一下这次迁移中遇到的一些状况好了。

首先，fish 要装 2.x 版（之前装的，怎么装忘了，大概就是 brew install 一下），oh-my-fish
直接上[github 仓库](https://github.com/bpinto/oh-my-fish)复制、粘贴一下就好。
我用的主题是`zish`，挺好的！

然后就是插件的配置了。
我用到的插件有

```bash
brew git balias theme percol python autojump
```

说明  
`balias`是 alias 的增强版，实现了 alias 命令的自动补全。  
`theme`是浏览和变更主题
用的，方便随时看厌主题了换一个。  
`percol`是查询命令行历史用的（就是其他 shell 都有的`ctrl+r`功能，原生是不带的。。。然后还要在命令行把[percol](https://github.com/mooz/percol)装上）。  
`python`提供了一些常用的 Python 快捷键（开一个临时 HTTP 服务什么的，暂时还没用上）。  
`autojump`就是在 bash 版的 autojump 上包了一层。

为什么要用 autojump 而不是看起来更加厉害的[z](https://github.com/rupa/z)，是因为 z 在下列目录结构下的操作方式超出了我智商的上限，无能为力了。

```bash
path/hello
path/hello/llo
```

因为两个目录拥有一样的前缀，所以前者权重始终大于后者，这个没有问题。
但是。。。

说好的`z llo llo`不好使，在`path/hello`下用`z llo`始终停留在同一目录下。。。
更不用说实际的目录结构是`path/hello/hello/llo`了。。。
而 autojump 就做的好多了。在`path/hello`下敲`j llo`就会跳转到下一级`hello`去。

fish 环境下 python 的 virtualenvwrapper 不可用，替代品是[virtualfish](https://github.com/adambrenecki/virtualfish/)，clone 下来把配置贴到`config.fish`里就好了。  
要说坑的话，就是在把当前 env 状态加到 prompt 中的时候，修改并保存了`fish_prompt`函数，但其实 zish 主题的这个函数还有一个 helper 函数用来判断当前目录的 git 状态，
用自带提供的 funcsave 就会漏掉这个函数，导致每加载一次配置就报一次错。。。

oh-my-fish 没有 git 相关的别名设置，我从 oh-my-zsh 的设置中抄了几个简单常用的，带变量名展开啊命令行展开啊之类的“高级”别名因为语法不兼容，暂时没时间去修。
因此，bash 版自动给 iterm2 的 tab 设置颜色的脚本也没有迁移过来，惨惨惨。

结尾：  
上文中提到的 VIM 插件的问题，其实只要在`.vimrc`中添加一行`set shell=/bin/bash`之类的语句指定 VIM 环境中的 shell 就好了。

最后，这次短暂折腾中遇到、想到但还没解决的问题有：

1. TODO git 相关别名设置还不完整，有些怨念
2. TODO vim 的 StripWhitespace 设置有问题，写函数处理失败，对 vimscript 理解不能
3. DONE 给 jekyll 换了一个解析器，感觉好多了
