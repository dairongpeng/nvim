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

let g:indentLine_enabled=0

" golang configure ====> start
let g:go_highlight_methods = 1                 
let g:go_highlight_operators = 1    
let g:go_highlight_build_constraints = 1    
let g:go_fmt_autosave = 1
let g:go_version_warning = 1    
let g:go_autodetect_gopath = 1    
let g:go_highlight_types = 1    
let g:go_highlight_fields = 1    
let g:go_highlight_functions = 1    
let g:go_highlight_function_calls = 1                                             
let g:go_highlight_extra_types = 1                                                               
let g:go_highlight_generate_tags = 1    
let g:go_def_mode = 'gopls'
let g:go_gopls_enabled = 1
let g:go_guru_enabled = 1
let g:go_fmt_experimental = 1    
let g:go_def_mapping_enabled = 1    
let g:go_build_tags = '-v'    
let g:go_fmt_command = "goimports"                       
let g:go_list_type = "quickfix"    
let g:go_def_mapping_enable = 1

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
