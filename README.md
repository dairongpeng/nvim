## neovim ide write golang

### nvim配置
- 在`~/.config/nvim/`下执行`git init`
- 执行`mkdir -p pack/vendor/start`

### nvim插件管理(git 子模块操作)
- 添加一个插件
```shell
~ git submodule add https://github.com/fatih/vim-go.git pack/vendor/start/vim-go
```

- 更新插件
```shell
~ git submodule update --remote pack/vendor/start/vim-go
```

- 卸载插件
```shell
git rm -rf pack/vendor/start/vim-go
```

## 下载vim-go需要的二进制
键入`nvim test.go`, 进入Normal模式，执行:GoInstallBinaries，等待安装完成
