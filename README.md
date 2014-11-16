VIM配置分享 -- 快速上手
===================

同事们在我的诱导下，逐渐开始有人使用VIM作为开发的代码编辑器了。虽说最优的VIM配置一定是根据自己的使用习惯，自己逐步搭建起来的，但为了一帮之前都没怎么接触过Linux系统的人方便上手，将自己使用的VIM配置整理了下，上载到了github平台上。

----------

插件列表
-------------

- vundle 
插件管理器。
- YouCompleteMe 
VIM迄今最强大的自动补全神器，就是第一次安装比较耗时。
- syntastic
编写代码时实时在左侧显示编译错误或警告提示。
- vim-airline
漂亮的底部信息条，与powerline相比比较轻量级。
- vim-fugitive
使airline能够显示当前项目git branch的插件
- winmanager
窗口管理
- bufexplorer
打开的文件(buffer)管理插件
- taglist
配合winmanager显示tag list，方便阅读代码。
- a.vim
一个特别简单的插件，但一直在使用，仅提供一个功能：在头文件和源文件间切换。
- DoxygenToolkit.vim
doxygen的vim助手插件。
- badwolf
配色主题。
- molokai
配色主题。



安装
-------------
得益于github提供的代码托管空间和vundle这个基于git的插件管理器，安装工作变得非常便捷。
首先请备份原有.vim插件目录，并确保安装了exuberant-ctags和python，然后在控制台输入下面的指令：

> git clone https://github.com/maolin-cdzl/vimrc.git ~/.vim
> cd ~/.vim
> ./install.sh

OK，安装完毕！由于需要下载较多的git库和编译YouCompleteMe自动补全插件，视网速和电脑配置，install过程可能需要几分钟到十几分钟。

另外，为了在控制台下使用VIM时，避免airline底部信息栏显示乱码，请在install安装完毕后在控制台菜单中将控制台字体修改为之前自动安装的以**for Powerline**命名结尾打过补丁的字体。

使用说明
-----------

**VIM中的"leader键"设置为了右逗号。**

- <kbd>,be</kbd> 在当前窗口显示打开的文件列表，并浏览切换。
<kbd> ,bs</kbd> 横向切分窗口，并在新窗口中打开文件列表。
 <kbd>,bv</kbd> 纵向切分窗口，并在新窗口中打开文件列表
- <kbd>ctrl+w</kbd> 后跟 h/j/k/l 向当前窗口的左/下/上/右窗口移动焦点。
<kbd>ctrl+c</kbd> 关闭当前窗口
- <kbd>F9</kbd> 打开/关闭 “浏览窗口”。左上是文件浏览器，当焦点在该窗口时，<kbd>enter</kbd>进入目录或打开文件，<kbd>-</kbd>（减号）切到上级目录，左下是tag列表。
- <kbd>F12</kbd> 在头文件和源文件之间切换
- <kbd>F2</kbd> 为当前焦点代码添加doxy兼容风格的注释
<kbd>F4</kbd> 为当前文件添加注释文件头，请修改下vimrc中的`g:DoxygenToolkit_authorName`，否则自动填充的是我的名字。


