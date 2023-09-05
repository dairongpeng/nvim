call plug#begin("~/.vim/plugged")
Plug 'fatih/vim-go', { 'do' : ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-rooter'
call plug#end()

nnoremap <SPACE> <Nop>
map <Space> <Leader>

" 通用
set autowrite " 自动保存
set number " 显示行号
set autoindent " 设置自动缩进
set confirm " 在处理未保存或只读文件时，弹出确认
set history=1000 " 设置历史记录步数
set tabstop=4 " 设置制表符为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格
set expandtab " vim自动将输入的制表符替换为缩进的空格数
autocmd BufWritePre *.go :silent! GoFmt " 保存文件时自动fmt go代码

" NerdTree
" 显示或隐藏目录
nnoremap <leader>nn :NERDTreeToggle<CR>
" 为某个文件或者文件夹加书签，D删除书签
nnoremap <leader>nb :NERDTreeFromBookmark<CR>
" 打开目录，并定位到当前文件
nnoremap <leader>nf :NERDTreeFind<CR>

" fzf and vim-rooter
" 当前项目内全局查找关键字
nnoremap <leader>f :RG<cr>
" 查看最近打开的文件和打开的缓冲区
nnoremap <leader>r :History<cr>
" 查看打开的缓冲区
nnoremap <leader>j :Buffers<cr>
" 当前项目内查找文件
nnoremap <leader>k :Files<cr>
" 当前项目下查找Tag
nnoremap <leader>l :Tags<cr>

" vim-go
" 双击鼠标左键，跳转到光标所在代码定义处
map <2-LeftMouse> :GoDef <CR>
" 鼠标右键，从代码定义跳转回上一个位置
map <RightMouse> :GoDefPop <CR>
" Ctrl+N 列出调用当前光标下标识符的代码位置
map <C-N> :GoCallers <CR>
" Ctrl+M 列出当前光标下标识符调用的代码位置
map <C-M> :GoCallees <CR>
" 鼠标滚轮向上滚动，会执行向上滚动，类似于按下Ctrl+Y
map <ScrollWheelUp> <C-Y>
" 鼠标滚轮向下滚动时，会执行向下滚动，类似于Ctrl+E
map <ScrollWheelDown> <C-E>
" 取消Ctrl键映射
unmap <CR>
" 按下Ctrl，会执行Go代码跳转，类似于双击鼠标左键
map <CR> :GoDef <CR>
" 按下Ctrl+I，会执行Go代码定义跳转为上一个位置，类似于鼠标右键
map <C-I> :GoDefPop <CR>
" 按下Shift+K时，会显示当前光标下标识符文档注释
map <S-K> :GoDoc<cr>
" 按下Shift+M时，会显示当前光标下标识符的详细信息
map <S-M> :GoInfo<cr>
" 按下Shift+T时，会跳转到当前光标下标识符的类型定义
map <S-T> :GoDefType<cr>
" 按下Shift+L时，会执行Go结构体标签（Tag）的添加操作
map <S-L> :GoAddTag<cr>
" 按下Shift+P时，会列出当前光标下接口（interface）的所有实现
map <S-P> :GoImplements<cr>
" 按下Shift+R时，会执行Go代码的重命名操作
map <S-R> :GoRename<cr>
" 按下Shift+F时，会执行填充Go结构体的操作
map <S-F> :GoFillStruct<cr>
" 按下Shift+C时，会列出当前光标下标识符的调用者
map <S-C> :GoCallers<cr>
" 按下Shift+H时，会启用/禁用相同标识符的突出显示
map <S-H> :GoSameIdsToggle<cr>

let g:fzf_preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'


