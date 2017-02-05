syntax on
"set background=dark
"colorscheme solarized

"if has("autocmd")
"  filetype plugin indent on
"endif


let Tlist_Ctags_Cmd='/usr/local/bin/ctags' 
set hidden
set autoindent
set shiftwidth=4
set nu
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
let &termencoding=&encoding
set tabstop=4
set expandtab
set noerrorbells
set showmatch
set autochdir
set mouse=a
set nocompatible
set ruler
set ic
set clipboard+=unnamed
set wildmenu
set wildmode=longest:full
set ignorecase
set incsearch
set tags+=./tags
set tags+=/Users/Matt/Projects/whattoask副本/tags
filetype off
filetype plugin on
vmap "+y :w !pbcopy<CR><CR> 
nmap "+p :r !pbpaste<CR><CR>

"au BufEnter /home/my/proj1/* setlocal tags+=/home/my/proj1/tags
set nobackup
"set writebackup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'The-NERD-tree'
Bundle 'snipMate'
Bundle 'taglist.vim'
Bundle 'Valloric/YouCompleteMe'
":BundleList - list configured bundles  
":BundleInstall(!) - install(update) bundles  
":BundleSearch(!) foo - search(or refresh cache first) for foo  
":BundleClean(!) - 删除插件首先要在.vimrc中注释掉插件相应的行，再运行该命令  
"filetype plugin indent on    " required!
"autocmd FileType cpp set omnifunc=cppcomplete#Complete

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set nocp
let Tlist_Exit_OnlyWindow=1  
let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1 
set wildignore=*.o,*.obj,*.bak,*.exe
set path+=./
set path+=/usr/include
"set runtimepath+="/home/matt/.vim/bundle/UltiSnips/
"let g:UltiSnipsUsePythonVersion = 2
"let g:UltiSnipsJumpForwardTrigger="<c-j>"  
"let g:UltiSnipsJumpBackwardTrigger="<c-k>" 
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-tab>"
"let g:UltiSnipsSnippetDir="/home/matt/.vim/bundle/UltiSnips/UltiSnips"

nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_key_list_select_completion = []
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2
" set the max list in the popup menu. increase the speed
let g:neocomplcache_max_list=40
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
	let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
let g:neocomplcache_auto_completion_start_length=1
" ignore letter case
let g:neocomplcache_enable_ignore_case=1
let g:neocomplcache_enable_auto_select = 1
set completeopt=longest,menu
let g:neocomplcache_enable_quick_match = 1
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"inoremap <expr><C-m> <C-x><C-u>
au BufWinLeave * mkview
au BufWinEnter * loadview


"set foldenable                  " enable folding
"set foldcolumn=2                " add a fold column
set foldmethod=indent           " detect triple-{ style fold markers
set foldlevelstart=99           " start out with everything folded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold 
set foldclose=all		
function! UpdateTagsFile()
silent !ctags -R --c++-kinds=+p --fields=+ianS --extra=+q
endfunction
"定义CompileRun函数，用来调用进行编译和运行
func CompileRun()
exec "w"
""C程序
if &filetype == 'c'
exec "!gcc -Wall % -g -o %<"
exec "!./%<"
"c++程序
elseif &filetype == 'cpp'
exec "!g++ -Wall % -g -o %<"
exec "!./%<"
""Java程序
elseif &filetype == 'java'
exec "!javac %"
exec "!java %<"
elseif &filetype == 'python'
exec "!python %<.py"
elseif &filetype == 'scm'
exec "!racket %<.scm"
endif
endfunc
"结束定义CompileRun
""定义Run函数
func Run()
if &filetype == 'c' || &filetype == 'cpp'
exec "!./%<.exe"
elseif &filetype == 'java'
exec "!./java %<"
endif
endfunc
"定义Debug函数，用来调试程序
func Debug()
exec "w"
""C程序
if &filetype == 'c'
exec "!gcc % -g -o %<"
exec "!lldb -tui -quiet %<"
elseif &filetype == 'cpp'
exec "!g++ % -g -o %<"
exec "!lldb -tui -quiet %<"
"Java程序
elseif &filetype == 'java'
exec "!jdb -tui -quiet%<"
elseif &filetype =='python'
exec "!pdb %<.py"
elseif &filetype == 'scm'
exec "!drracket %<.scm"
endif
endfunc

func SpecialDebug()
exec "!gdb -tui -quiet Index"
endfunc
""结束定义Debug
"设置程序的运行和调试的快捷键F5和Ctrl-F5
map <F5> :call CompileRun()<CR>
map <F6> :call Run()<CR>
map <F9> :call Debug()<CR> 
map <F12>:call UpdateTagsFile()<CR>
map <c-F5> : call BaseIndexCompile2()<CR>
map <c-F9> : call SpecialDebug()<CR>
map <C-F6> : call BaseIndexCompile()<CR>



