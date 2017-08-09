
#1. git flow概述

&emsp;&emsp;git是一个分布式的版本管理系统，开源、广泛的使用群体、灵活的分支管理、离线版本管理等特性吸引着成千上万的使用者源源不断的加入到使用git的群体之中。人们在使用git的时候，发现git虽然有一个灵活的分支管理机制，但是如果使用不恰当也会导致分支管理的混乱，进而导致很多问题。在长期的使用过程中，人们^1 总结出了一套行之有效的使用git的通用工作模式，我们将它称为git flow，下图则是git flow的形象化的展示。

 > 1.这时主要指[Vincent Driessen](https://github.com/nvie)提出的git分支管理模型(Vincent Driessen's branching model)。Vincent Driessen的博文[A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)详细讲述了Vincent Driessen git分支模型的原理。

![git flow](/assets/image/20170809095057.gif)

&emsp;&emsp;简单来说, 他将 branch 分成2个主要分支和3个临时的辅助分支:

+ 主要分支

 - master: 永远处在即将发布(production-ready)状态
 - develop: 最新的开发状态
+ 辅助分支

 - feature: 开发新功能的分支, 基于 develop, 完成后 merge 回 develop
 - release: 准备要发布版本的分支, 用来修复 bug. 基于 develop, 完成后 merge 回 develop 和 master
 - hotfix: 修复 master 上的问题, 等不及 release 版本就必须马上上线. 基于 master, 完成后 merge 回 master 和 develop


&emsp;&emsp;上述模型，实施起来对应如下一系列git命令：

1.1、创建功能分支

开始新功能开发之前，需要创建新的功能分支myfeature:

```
$ git checkout -b myfeature develop
Switched to a new branch "myfeature"

```

1.2、功能开发完成后合并到develop

```
$ git checkout develop
Switched to branch 'develop'
$ git merge --no-ff myfeature
Updating ea1b82a..05e9557
(Summary of changes)
$ git branch -d myfeature
Deleted branch myfeature (was 05e9557).
$ git push origin develop
```


&emsp;&emsp;git-flow并不是要替代 Git，它仅仅是非常聪明有效地把标准的 Git 命令用脚本组合了起来。严格来讲，你并不需要安装什么特别的东西就可以使用 git-flow 工作流程。你只需要了解，哪些工作流程是由哪些单独的任务所组成的，并且附带上正确的参数，以及在一个正确的顺序下简单执行那些对应的 Git 命令就可以了。当然，如果你使用 git-flow 脚本就会更加方便了，你就不需要把这些命令和顺序都记在脑子里。

 >* [使用GIT FLOW管理开发流程](http://stormzhang.com/git/2014/01/29/git-flow/)

#2. git flow出现的初衷是什么？

 >* [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/) 

 >* [Using git-flow to automate your git branching workflow](https://jeffkreeftmeijer.com/2010/why-arent-you-using-git-flow/)


#3. 项目中怎么使用git flow？

 >* [Installing git-flow](https://github.com/nvie/gitflow/wiki/Installation)