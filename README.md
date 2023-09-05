## neovim ide write golang

### nvim配置
- rm -rf ~/.config/nvim
- cd ~/.config
- git clone -depth=1 https://github.com/dairongpeng/nvim.git


### nvim插件管理(git 子模块操作)
- 添加vim-go插件和NERDTree插件
```shell 
~ git submodule add https://github.com/fatih/vim-go.git pack/vendor/start/vim-go
~ git submodule add https://github.com/preservim/nerdtree.git pack/vendor/start/nerdtree
```

- 更新插件(以更新vim-go举例)
```shell
~ git submodule update --remote pack/vendor/start/vim-go
```

- 删除插件(以vim-go举例)
```shell
~ git rm -rf pack/vendor/start/vim-go
```

## 下载vim-go需要的二进制
键入`nvim test.go`, 进入Normal模式，执行:GoInstallBinaries，等待安装完成

## vim

### 安装vim8+
```shell
~ brew install vim
```

### 增加vim配置文件
vim配置文件在`~/.vimrc`中、vim的默认资源文件夹在`~/.vim`中。
```shell
~ touch ~/.vimrc
```

### 安装vim-plug
```shell
~ sh -c 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### 使用vim-plug管理插件
```text
" 安装的插件放到~/.vim/plugged内
call plug#begin("~/.vim/plugged")
Plug 'fatih/vim-go', { 'do' : ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'
" 装fzf可执行文件
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" fzf.vim依赖fzf，和ripgrep可执行文件。fzf上一步已经安装，ripgrep可以自行安装
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
call plug#end()
```

vim配置参考`vimrc`文件。
