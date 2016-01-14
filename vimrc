"set nocompatible
" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'

Bundle 'winmanager'
Bundle 'bufexplorer.zip'
Bundle 'taglist.vim'
Bundle 'scrooloose/nerdtree'

Bundle 'DoxygenToolkit.vim'
Bundle 'sjl/badwolf'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim.git'
Bundle 'suan/vim-instant-markdown'
"it always have some problem,what the way
"Bundle 'fholgado/minibufexpl.vim'

"Bundle 'jaredly/vim-debug'
"Bundle 'jaredly/pydbgp'



call vundle#end()
" Vundle

syntax on
set nocompatible
filetype on
filetype plugin on
filetype indent on
set nobomb
set fileencodings=utf8,ucs-bom,gbk,gb18030,cp936
set fileformat=unix
set encoding=utf8
set termencoding=utf8
set mouse=a
"set guifont=Arial\ monospaced\ for\ SAP\ 10
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
set guifont=Dejavu\ Sans\ Mono\ for\ Powerline\ Regular\ 10
set gfw=幼圆\ 10.5
set hlsearch
set incsearch
set showcmd
set history=50
set backspace=indent,eol,start
set noautochdir
set background=light
"colorscheme molokai
"colorscheme badwolf
colorscheme solarized
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
"set smartindent:
set cindent shiftwidth=4

" set autochdir
let mapleader = ","

autocmd! bufread,bufnewfile *.qml set filetype=qml
autocmd! bufread,bufnewfile *.m set filetype=objc
autocmd! bufread,bufnewfile *.mm set filetype=objc

" Go to last file(s) if invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
au BufReadPost * if line("`\"") > 1 && line("`\"") <= line("$") | exe "normal! g`\"" | endif
" for simplicity, "  au BufReadPost * exe "normal! g`\"", is Okay.
endif


" TagList"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
" set tags filepath
if filereadable("tags")
	set tags=tags
	" else add database pointed to by enviroment
elseif $TAGS_DB != ""  
		set tags=$TAGS_DB
endif

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

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

"NERDTree设置"
let g:NERDTree_title="[NERDTree]"
function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
  
function! NERDTree_IsValid()  
    return 1  
endfunction 

"let NERDTreeChDirMode=2         "选中root即设置为当前目录
let NERDTreeShowBookmarks=1      "显示书签
"let NERDTreeMinimalUI=1         "不显示帮助面板
let NERDTreeDirArrows=0          "目录箭头 1 显示箭头  0传统+-|号
let NERDTreeMouseMode=2          "可以使用鼠标打开文件
let NERDTreeChDirMode=2          "选中root即设置为当前目录

" winManager setting"
"nerdtree设置必须在前面，否则会报错
"这个版本的Winmanager好像有个小bug，你在打开Winmanager界面时，会同时打开一个空的文件。这会影响后续使用，所以我们要在打开Winmanager时关掉这个空文件。在~/.vim/plugin目录下的winmanager.vim文件中找到以下函数定义并在第5行下添加第6行的内容：
function! <SID>ToggleWindowsManager()  
   if IsWinManagerVisible()  
      call s:CloseWindowsManager()  
   else  
      call s:StartWindowsManager()  
      exe 'q'  
   end  
endfunction
"
let g:winManagerWindowLayout = "NERDTree,BufExplorer|TagList"
"let g:winManagerWindowLayout = "NERDTree|TagList"
let g:winManagerWidth = 30
let g:AutoOpenWinManager=0 "设为1则在进入vim时自动打开winmanager

set foldmethod=syntax
set foldlevel=100	" don't auto fold

" DoxygenTookkit
let g:DoxygenToolkit_briefTag_pre="@brief " 
let g:DoxygenToolkit_paramTag_pre="@param " 
let g:DoxygenToolkit_returnTag="@return " 
"let g:DoxygenToolkit_blockHeader="--------------------------------------------"
"let g:DoxygenToolkit_blockFooter="--------------------------------------------"
let g:DoxygenToolkit_authorName="yaojingya <yaojingya@shanlitech.com>" 
let g:DoxygenToolkit_licenseTag="Copyright(C)\<enter>HeBei ShanLi Tech Ltd.\<enter>" 
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:doxygen_enhanced_color=1

nmap <silent> <C-c>	<C-w>c
nmap <silent> <F9> :WMToggle<CR>
nmap <silent> <F2> :Dox<CR>
nmap <silent> <F4> :DoxAuthor<CR>
nmap <silent> <F12> :A<CR>
nmap <silent> <F8> :MBEOpen<CR>

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
let g:ycm_show_diagnostics_ui = 0	"enable syntastic'checkers for c、cpp

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到申明定义处
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
nnoremap <leader>lo :lopen<CR>						"open locationlist
nnoremap <leader>lc :lclose<CR>						"close locationlist
inoremap <leader><leader> <C-x><C-o>


"""""""""""clang_check"""""""""function! ClangCheckImpl(cmd)
function! ClangCheckImpl(cmd)
  if &autowrite | wall | endif
  echo "Running " . a:cmd . " ..."
  let l:output = system(a:cmd)
  cexpr l:output
  cwindow
  let w:quickfix_title = a:cmd
  if v:shell_error != 0
    cc
  endif
  let g:clang_check_last_cmd = a:cmd
endfunction

function! ClangCheck()
  let l:filename = expand('%')
  if l:filename =~ '\.\(cpp\|cxx\|cc\|c\)$'
    call ClangCheckImpl("clang-check " . l:filename)
  elseif exists("g:clang_check_last_cmd")
    call ClangCheckImpl(g:clang_check_last_cmd)
  else
    echo "Can't detect file's compilation arguments and no previous clang-check invocation!"
  endif
endfunction

nmap <silent> <F6> :call ClangCheck()<CR><CR>


""""""""""syntastic""""""""""""
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_cpp_checkers=["clang_check"]
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list = 1

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

let g:syntastic_python_pylint_quiet_messages = { "level" : "Warnings" }

set laststatus=2
set t_Co=256
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
"let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
"let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
"let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
"let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme="molokai"


"cscope
if has("cscope")
	set cscopequickfix=s-,c-,d-,i-,t-,e-	 
	nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>  

    "使用’ctrl – 空格’，然后查找时就会使vim水平分隔窗口，结果显示在新的窗口中
    "nmap <C-Space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    "nmap <C-Space>i :scs find i <C-R>=expand("<cfile>")<CR><CR>
    "nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>
    "两次按下’ctrl – 空格’，然后查找时就会竖直分隔窗口而不是水平分隔
	"nmap <C-Space><C-Space>s :vert cs find s <C-R>=expand("<cword>")<CR><CR>
	"nmap <C-Space><C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space><C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space><C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space><C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-Space><C-Space>i :vert scs find i <C-R>=expand("<cfile>")<CR><CR>
    "nmap <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
	"

	set cspc=1	"只是显示文件名 0/默认=全部路径
	set cst "tag命令同时查找cscope
	set csto=1	"cscope数据库优先
	set nocsverb	
	"add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
		"else add database pointed to by enviroment
	elseif $CSCOPE_DB != ""  
		cs add $CSCOPE_DB
	endif
	set csverb
endif

"quickfix
nmap <C-n> :cnext<CR>
nmap <C-p> :cprev<CR> 
"当使用quickfix窗口后，原先的tag stack和Ctrl-t键会失效。为弥补这不足，可以将Ctrl-t重新地定义
nmap <C-t> :colder<CR>:cc<CR>      

"vim make command
"nmap <F5> :make<CR>  


"minibufexpl.vim
"let g:miniBufExplMapWindowNavVim = 1   
"let g:miniBufExplMapWindowNavArrows = 1   
"let g:miniBufExplMapCTabSwitchBufs = 1   
"let g:miniBufExplModSelTarget = 1  
"let g:miniBufExplMoreThanOne=0  
"noremap <leader>n :bn<CR>
"noremap <leader>N :bp<CR>

"python
au BufRead *.py map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>

"vim-debug
"map <F5> :Dbg over<CR> 
"map <F6> :Dbg into<CR> 
"map <F7> :Dbg out<CR> 
"map <F8> :Dbg here<CR> 
"map <F9> :Dbg break<CR> 
"map <F10> :Dbg watch<CR> 
"map <F11> :Dbg down<CR> 
"map <F12> :Dbg up<CR> 
