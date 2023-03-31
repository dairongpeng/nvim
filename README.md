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
