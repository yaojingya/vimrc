set nocompatible
" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'

Bundle 'winmanager'
Bundle 'bufexplorer.zip'
Bundle 'taglist.vim'

Bundle 'DoxygenToolkit.vim'
Bundle 'sjl/badwolf'
Bundle 'tomasr/molokai'

call vundle#end()
" Vundle

syntax on
filetype on
filetype plugin on
filetype indent on
set nobomb
set fileencodings=utf8
",ucs-bom,gbk,gb18030,cp936
set fileformat=unix
set encoding=utf8
set termencoding=utf8
set mouse=a
"set guifont=Arial\ monospaced\ for\ SAP\ 10
set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
set gfw=幼圆\ 10.5
set hlsearch
set incsearch
set showcmd
set history=50
set backspace=indent,eol,start
set noautochdir
set background=dark
"colorscheme molokai
colorscheme badwolf
set ruler
set number
set tabstop=4
set softtabstop=4
set sw=2
"只显示底部滚动条,不显示菜单
set guioptions-=b
set guioptions-=L
set guioptions-=r
set guioptions-=T
"不要换行
"set nowrap

"set autoindent
"set smartindent
set cindent shiftwidth=4

" set autochdir
let mapleader = ","

autocmd! bufread,bufnewfile *.qml set filetype=qml
autocmd! bufread,bufnewfile *.m set filetype=objc
autocmd! bufread,bufnewfile *.mm set filetype=objc

" TagList"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" BufExplorer"
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy='mru'
let g:bufExplorerSplitRight=0
let g:bufExplorerSplitVertical=1
let g:bufExplorerSplitVertSize = 30



highlight Pmenu    guibg=darkgrey  guifg=black 
highlight PmenuSel guibg=lightgrey guifg=black

autocmd BufWinEnter \[Buf\ List\] setl nonumber

" winManager setting"
let g:winManagerWindowLayout = "FileExplorer,BufExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0

set foldmethod=syntax
set foldlevel=100	" don't auto fold

" DoxygenTookkit
let g:DoxygenToolkit_briefTag_pre="@brief " 
let g:DoxygenToolkit_paramTag_pre="@param " 
let g:DoxygenToolkit_returnTag="@return " 
"let g:DoxygenToolkit_blockHeader="--------------------------------------------"
"let g:DoxygenToolkit_blockFooter="--------------------------------------------"
let g:DoxygenToolkit_authorName="maolin <maolin@shanlitech.com>" 
let g:DoxygenToolkit_licenseTag="Copyright(C)\<enter>HeBei ShanLi Tech Ltd.\<enter>" 
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:doxygen_enhanced_color=1

nmap <silent> <C-c>	<C-w>c
nmap <silent> <F9> :WMToggle<CR>
nmap <silent> <F2> :Dox<CR>
nmap <silent> <F4> :DoxAuthor<CR>
nmap <silent> <F12> :A<CR>

" 拷贝选中内容到系统剪切板
vmap <C-y> "+y
" 粘贴
nmap <C-p> "+p
imap <C-p> <ESC>"+pa
vmap <C-p> d"+p

" YouCompleteMe
set completeopt=longest,menu						"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif			"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0						"关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1		" 开启 YCM 基于标签引擎
let g:ycm_seed_identifiers_with_syntax=1			" 语法关键字补全
let g:ycm_min_num_of_chars_for_completion=2			" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0							" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_complete_in_comments = 1					"在注释输入中也能补全
let g:ycm_complete_in_strings = 1					"在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0		"注释和字符串中的文字也会被收入补全
let g:ycm_filepath_completion_use_working_dir = 1

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到申明定义处
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
nnoremap <leader>lo :lopen<CR>						"open locationlist
nnoremap <leader>lc :lclose<CR>						"close locationlist
inoremap <leader><leader> <C-x><C-o>

""""""""""syntastic""""""""""""
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting=1

let g:syntastic_error_symbol = 'x'
let g:syntastic_warning_symbol = '!'

"let g:syntastic_auto_loc_list = 2
"let g:syntastic_c_checkers=['make','splint']
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_no_include_search = 0
"let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libstdc++'
let g:syntastic_cpp_include_dirs = ['/usr/include/','/usr/local/include','/usr/include/glib-2.0']
