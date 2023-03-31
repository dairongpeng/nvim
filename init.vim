" common configure
"set noswapfile
set mouse=a " 激活鼠标使用
set wrap " 自动换行
set sw=4 " 设置软宽度
set gdefault " 行内替换
set showmatch " 高亮显示括号匹配    
set expandtab " 使用空格来替换 Tab
set tabstop=4 " 设置 Tab 长度为 4 空格    
set shiftwidth=4 " 设置自动缩进长度为 4 空格    
set autoindent " 继承前一行的缩进方式，适用于多行注释" 
set autowrite " 自动保存
set nocompatible " 关闭 vi 兼容模式
set history=1000 " 设置历史记录步数
set confirm " 在处理未保存或只读文件时，弹出确认

" 搜索逐字符高亮
set hlsearch
set incsearch

" 从不备份
set nobackup
set noswapfile

" 禁用 Vim-indentline 插件，它会在文本编辑器中为每一行添加缩进线。
let g:indentLine_enabled=0

" golang configure ====> start
" 启用高亮显示 Golang 中的方法（method）
let g:go_highlight_methods = 1
" 启用高亮显示 Golang 中的运算符。
let g:go_highlight_operators = 1
" 启用高亮显示 Golang 中的构建约束（build constraints）。
let g:go_highlight_build_constraints = 1
" 每次保存文件时自动使用 go fmt 命令格式化代码。
let g:go_fmt_autosave = 1
" 当使用过时的 Golang 版本时，给出警告提示。
let g:go_version_warning = 1
" 自动检测当前的 GOPATH 路径。
let g:go_autodetect_gopath = 1
" 启用高亮显示 Golang 中的类型（type）。
let g:go_highlight_types = 1
" 启用高亮显示 Golang 中的字段（field）。
let g:go_highlight_fields = 1
" 启用高亮显示 Golang 中的函数（function）。
let g:go_highlight_functions = 1
" 启用高亮显示 Golang 中的函数调用（function call）。
let g:go_highlight_function_calls = 1
" 启用高亮显示 Golang 中的额外类型（extra type）。
let g:go_highlight_extra_types = 1
" 启用自动生成 tags 文件。
let g:go_highlight_generate_tags = 1
" 使用 Golang 的 LSP 实现 gopls 作为导航定义的工具。
let g:go_def_mode = 'gopls'
" 启用 Golang 的 LSP 实现 gopls。
let g:go_gopls_enabled = 1
" 启用 Golang 的代码分析工具 guru。
let g:go_guru_enabled = 1
" 启用 Golang 的实验性格式化代码命令。
let g:go_fmt_experimental = 1
" 启用 Golang 的导航定义映射（mapping）
let g:go_def_mapping_enabled = 1
" 指定在构建 Golang 项目时使用的 tags。
let g:go_build_tags = '-v'
" 指定使用的格式化命令为 goimports。
let g:go_fmt_command = "goimports"
" 指定在执行 :GoList 命令时使用的列表类型
let g:go_list_type = "quickfix"

" ============================Begin Golang===================================
" 设置 Leader 键为英文逗号
let mapleader = ","

" 移动到行首、行尾
nnoremap <leader>a 0
nnoremap <leader>e $
vnoremap <leader>a 0
vnoremap <leader>e $

" 在新窗口中打开当前文件
nnoremap <leader>v :vsp <CR>
nnoremap <leader>s :sp <CR>

" 快速切换到最近的缓冲区
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>6 :b6<CR>
nnoremap <leader>7 :b7<CR>
nnoremap <leader>8 :b8<CR>
nnoremap <leader>9 :b9<CR>

" 复制、剪切、粘贴
vnoremap <leader>y "+y
vnoremap <leader>x "+x
nnoremap <leader>p "+p

" 启用行号，同时设置一个快捷键来开关行号
set number
nnoremap <leader>sn :set number!<CR>

" 编译、运行当前文件
nnoremap <leader>b :GoBuild<CR>
nnoremap <leader>r :GoRun<CR>

" 快速跳转到定义、引用、实现
nnoremap <leader>gd :GoDef<CR>
nnoremap <leader>gr :GoReferrers<CR>
nnoremap <leader>gi :GoImplementations<CR>

" 重命名标识符
nnoremap <leader>rn :GoRename<CR>

" 显示函数签名、函数定义
nnoremap <leader>k :GoDoc<CR>
nnoremap <leader>K :GoDefDoc<CR>

" 自动格式化、静态检查、生成接口文档
nnoremap <leader>f :GoFmt<CR>
nnoremap <leader>l :GoLint<CR>
nnoremap <leader>i :GoGenerate<CR>

" 跳转到下一个/上一个错误或警告
nnoremap <leader>en :lnext<CR>
nnoremap <leader>ep :lprev<CR>

" 显示当前函数的覆盖率
nnoremap <leader>c :GoCoverage<CR>

" 列出所有的符号
nnoremap <leader>ls :GoSymbols<CR>

" 生成并打开文档
nnoremap <leader>god :GoDocBrowser<CR>

" 将当前文件导出为HTML格式
nnoremap <leader>goe :GoExport<CR>

" 启动/关闭交互式命令行
nnoremap <leader>gc :GoConsole<CR>
nnoremap <leader>gC :GoCloseConsole<CR>

" 显示、隐藏当前函数的测试文件
nnoremap <leader>tu :GoTestFunc<CR>
nnoremap <leader>tU :GoTestFuncs<CR>

" 运行测试
nnoremap <leader>tt :GoTest<CR>
nnoremap <leader>t. :GoTestFuncCurrent<CR>

" 跳转到测试文件或当前函数的测试
nnoremap <leader>tn :GoTestNavigate<CR>

" 显示、隐藏当前函数的基准测试
nnoremap <leader>tb :GoBenchFunc<CR>
nnoremap <leader>tB :GoBenchFuncs<CR>

" 运行基准测试
nnoremap <leader>tx :GoBench<CR>

" 使用 gotags 生成 tags 文件
nnoremap <leader>tg :GoGenerateTags<CR>

" 在 quickfix 窗口中显示所有的错误或警告
nnoremap <leader>qf :GoQuickFix<CR>

" 启用 Vim-go 的代码提醒功能
let g:go_completion_enabled = 1
" 设置自动提示的延迟时间（单位为毫秒）
let g:go_completion_auto_delay = 100
" 设置代码提示的样式
let g:go_auto_type_info = 1
" 设置代码提示弹出窗口的位置为光标下方
let g:go_auto_popup_pos = 'popup'
" 设置代码提示弹出窗口的最大高度
let g:go_auto_popup_max_height = 30
" 设置代码提示弹出窗口的最大宽度
let g:go_auto_popup_max_width = 80

" 自动补全、代码补全
" let g:go_auto_type_info = 1
" let g:go_auto_sameids = 1
" let g:go_auto_type_info_truncate = 500
" let g:go_auto_type_info_delay = 100
" let g:go_auto_type_info_maxwidth = 100
" let g:go_auto_type_info_maxheight = 50
" let g:go_auto_type_info_position = 'botright'
" let g:go_auto_type_info_map_key = '<C-t>'
" let g:go_auto_type_info_auto_open = 1
" let g:go_auto_type_info_auto_close = 1
" let g:go_auto_type_info_show_tab = 1
" let g:go_auto_type_info_tab_width = 30
" let g:go_auto_type_info_tab_color = 'Black'
" let g:go_auto_type_info_highlight_color = 'Yellow'
" ==============================End Golang===================================


" ============================Begin NerdTree=================================
" 打开/关闭 NERDTree 窗口
nnoremap <leader>n :NERDTreeToggle<CR>
" 打开 NERDTree 窗口，并将光标移动到当前文件所在的节点
nnoremap <leader>nf :NERDTreeFind<CR>
" 在 NERDTree 窗口中打开文件
nnoremap <leader>no :NERDTreeFind<CR>
" 在 NERDTree 窗口中刷新当前目录
nnoremap <leader>nr :NERDTreeRefreshRoot<CR>
" 在 NERDTree 窗口中上下移动光标
nnoremap <C-j> :NERDTreeFocus<CR><C-w>j
nnoremap <C-k> :NERDTreeFocus<CR><C-w>k
" 在 NERDTree 窗口中打开文件时自动关闭 NERDTree 窗口
let g:NERDTreeAutoClose = 1
" ===========================END NerdTree===================================


" 双击鼠标左键可以跳转到光标下符号的定义处。
map <2-LeftMouse> :GoDef <CR>
" 鼠标右键可以回退到上一个光标所在位置。
map <RightMouse> :GoDefPop <CR>
" 按下 Ctrl+N 可以查找调用当前函数的函数列表。
map <C-N> :GoCallers <CR>
" 按下 Ctrl+M 可以查找当前函数调用的函数列表。
map <C-M> :GoCallees <CR>
" 使用鼠标滚轮向上滚动时可以向上滚动文本。
map <ScrollWheelUp> <C-Y>
" 使用鼠标滚轮向下滚动时可以向下滚动文本。
map <ScrollWheelDown> <C-E>
" 取消回车键的默认映射。
unmap <CR>
" 按下回车键可以跳转到光标下符号的定义处。
map <CR> :GoDef <CR>
" 按下 Ctrl+I 可以回退到上一个光标所在位置。
map <C-I> :GoDefPop <CR>
" 按下 Shift+K 可以查看光标下符号的文档。
map <S-K> :GoDoc<cr>
" 按下 Shift+M 可以查看光标下符号的类型信息。
map <S-M> :GoInfo<cr>
" 按下 Shift+T 可以查看光标下符号的类型定义。
map <S-T> :GoDefType<cr>
" 按下 Shift+L 可以给结构体添加标签。
map <S-L> :GoAddTag<cr>
" 按下 Shift+P 可以查找实现当前接口的类型列表。
map <S-P> :GoImplements<cr>
" 按下 Shift+R 可以重命名光标下符号。
map <S-R> :GoRename<cr>
" 按下 Shift+F 可以根据结构体类型自动填充默认值。
map <S-F> :GoFillStruct<cr>
" 按下 Shift+C 可以查找当前函数调用的函数列表。
map <S-C> :GoCallers<cr>
" 按下 Shift+H 可以切换相同符号的高亮显示。
map <S-H> :GoSameIdsToggle<cr>

" 定义自动命令组, 名称为go
augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  " 当打开或读取一个Go语言文件时
  " 将缩进设置为4空格，而不是制表符
  " 输入时，移动或缩进4空格
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoDef but opens in a vertical split
  " 当打开或创建go文件时
  " 按下Leader,默认是反斜杠\和v时
  " 将会使用go-def-vertical插件打开go文件中光标所在的函数定义
  " 并在垂直分割窗口中显示
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  " 按下Leader, 默认是反斜杠\和s
  " 会使用go-def-split插件打开go文件光标所在的函数定义
  " 并在垂直分割窗口中展示
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  " 表示在go文件中定义自定义命令A
  " 该命令可以在源代码和测试代码之间快速切换
  " 并且在‘同一窗口’中编辑文件
  " -bang 表示可以使用感叹号标记（例如:A!）来强制进行更改。
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  " 表示在go文件中定义了一个自定义命令AV
  " 该命令可以在源代码和测试代码之间进行快速切换
  " 并在‘垂直窗口’中编辑文件
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  " 定义AS
  " 该命令同上
  " 在‘水平窗口’中编辑文件
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  " 定义AT
  " 该命令同上
  " 新的标签页中编辑文件
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
" vim自定义函数
" 用于自动编译或测试go文件
" 函数中：首先使用 expand('%') 获取当前编辑的文件名
" 并使用正则表达式检查文件名以确定它是一个源代码文件或测试文件
" 如果是源代码文件，则调用 go#cmd#Build(0) 编译该文件
" 如果是测试文件，则调用 go#test#Test(0, 1) 运行测试。
" 这个函数可以通过自定义的映射或命令来触发，以快速编译或测试当前编辑的文件。
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
" golang configure ====> end
