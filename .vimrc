set encoding=utf-8
set backspace=2
" 定义快捷键的前缀，即 <Leader>
let mapleader=" "

filetype on  " 开启文件类型侦测
filetype plugin on  " 根据侦测到的不同类型加载对应的插件

" 定义快捷键在结对符之间跳转
nmap <Leader>M %

autocmd BufWritePost $MYVIMRC source $MYVIMRC   " 让配置变更立即生效

set incsearch   " 开启实时搜索功能
set ignorecase  " 搜索时大小写不敏感
set nocompatible    " 关闭兼容模式
set wildmenu    " vim 自身命令行模式智能补全

syntax enable   " 开启语法高亮功能
syntax on   " 允许用指定语法高亮配色方案替换默认方案
filetype indent on  " 自适应不同语言的智能缩进

" set expandtab   " 将制表符扩展为空格
set tabstop=4   " 设置编辑时制表符占用空格数
set shiftwidth=4    " 设置格式化时制表符占用空格数
set softtabstop=4   " 让 vim 把连续数量的空格视为一个制表符

set gcr=a:block-blinkon0    " 禁止光标闪烁

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2

set ruler   " 显示光标当前位置
set number  " 开启行号显示

" 高亮显示当前行/列
"set cursorline
"set cursorcolumn

set hlsearch    " 高亮显示搜索结果

" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 10.5

set nowrap  " 禁止折行

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" vundle 环境设置
filetype off
call plug#begin('~/.vim/bundle')
" Plugin 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
" Plugin 'vim-scripts/phd'
Plug 'Lokaltog/vim-powerline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'derekwyatt/vim-fswitch'
" Plugin 'kshenoy/vim-signature'
" Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plug 'majutsushi/tagbar'
" Plugin 'vim-scripts/indexer.tar.gz'
" Plugin 'vim-scripts/DfrankUtil'
" Plugin 'vim-scripts/vimprj'
" Plugin 'dyng/ctrlsf.vim'
" Plugin 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
" Plugin 'vim-scripts/DrawIt'  绘图
" Plugin 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
" Plugin 'derekwyatt/vim-protodef'
Plug 'scrooloose/nerdtree'
Plug 'fholgado/minibufexpl.vim'
" Plugin 'gcmt/wildfire.vim'
" Plugin 'sjl/gundo.vim'
Plug 'easymotion/vim-easymotion'
" Plugin 'suan/vim-instant-markdown'
" Plugin 'lilydjwg/fcitx.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/echofunc'
Plug 'Yggdroot/indentLine'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'multilobyte/gtags-cscope'
call plug#end()

filetype plugin indent on

" 配色方案
"set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme phd

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'derekwyatt/vim-fswitch'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
" let g:UltiSnipsSnippetDirectories=["mysnippets"]
" let g:UltiSnipsExpandTrigger="<leader><tab>"
" let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
" let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'Valloric/YouCompleteMe'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_complete_in_comments=1				" 补全功能在注释中同样有效
let g:ycm_confirm_extra_conf=0					" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_collect_identifiers_from_tags_files=0	" 开启 YCM 标签补全引擎

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>

set completeopt-=preview						" 补全内容不以分割子窗口形式出现，只显示补全列表
let g:ycm_min_num_of_chars_for_completion=1		" 从第一个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0						" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1		" 语法关键字补全
let g:ycm_semantic_triggers =  { 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'], 'cs,lua,javascript': ['re!\w{2}'], }
" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'git@github.com:ludovicchabant/vim-gutentags.git'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.git']

let g:gutentags_modules = ['ctags', 'gtags_cscope']
"let g:gutentags_modules = ['gtags_cscope']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--exclude=docs', '--exclude=_build', '--exclude=*.py', '--exclude=tools', '--exclude=test_data']
let g:gutentags_ctags_extra_args += ['/usr/include/arm-linux-gnueabihf']

let g:gutentags_auto_add_gtags_cscope = 0
"let g:gutentags_plus_switch = 1

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
		silent! call mkdir(s:vim_tags, 'p')
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'Yggdroot/indentLine'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indentLine_char = 'c'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"竖线对齐 for tab
set list lcs=tab:\┊\ 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'scrooloose/nerdtree'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用 NERDTree 插件查看工程文件。
nmap <F3> :NERDTreeToggle<CR>
let NERDTreeWinSize=30					" 设置 NERDTree 子窗口宽度
let NERDTreeWinPos="left"				" 设置 NERDTree 子窗口位置
let NERDTreeShowHidden=1				" 显示隐藏文件
let NERDTreeMinimalUI=1					" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeAutoDeleteBuffer=1			" 删除文件时自动删除文件对应 buffer

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'fholgado/minibufexpl.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>

" buffer 切换快捷键
map <C-l> :MBEbn<cr>
map <C-h> :MBEbp<cr>

" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 设置快捷键实现一键编译及运行
" nmap <F7><CR>:cd build/<CR> :!rm -rf main<CR> :!cmake CMakeLists.txt<CR>:make<CR><CR> :cw<CR> :cd ..<CR>
" nmap <F5><CR>:cd build/<CR>:!rm -rf main<CR>:!cmake CMakeLists.txt<CR>:make<CR><CR>:cw<CR>:cd ..<CR>:!build/main<CR>

" 调用 gundo 树
" nnoremap <Leader>ud :GundoToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'majutsushi/tagbar'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=30
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Or, you could use neovim's floating text feature.
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
" To use a custom highlight for the float window,
" change Pmenu to your highlight group
highlight link EchoDocFloat Pmenu
set cmdheight=2
