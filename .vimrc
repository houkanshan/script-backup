
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
Bundle "mattn/zencoding-vim"
Bundle 'Shougo/neocomplcache'
"Bundle "ervandew/supertab"
Bundle "scrooloose/nerdtree"
Bundle "serverhorror/javascript.vim"
Bundle "jsbeautify"
Bundle "vim-coffee-script"
Bundle "Markdown"

filetype plugin indent on


map ½ $
imap ½ $
vmap ½ $
cmap ½ $

fun! MySys()
      return "unix"
endfun

set runtimepath+=$VIMRUNTIME
set runtimepath+=~/.vim
set runtimepath+=~/.vim/bundle/ctrlp.vim
set runtimepath+=~/.vim/bundle/vim-powerline
"pathogen
call pathogen#infect()


let mapleader = ","
let g:mapleader = ","

colorscheme molokai
let g:molokai_original = 0
set t_Co=256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set 7 line to the curors - when moving vertical..
set nu
set so=7
set wildmenu "tuen on wild menu
set ruler "Always show current position
set cmdheight=1 "commandbar height
" set hid "changer buffer-without saving

"set backspace config
set backspace=eol,start,indent
"set whichwarp+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink


" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set expandtab  "将tab换成空格
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai
set si
set wrap

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2
"
"Git branch
"function! GitBranch()
    "try
        "let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
    "catch
        "return ''
    "endtry

    "if branch != ''
        "return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
    "en

    "return ''
"endfunction
""
"function! CurDir()
    "return substitute(getcwd(), '/Users/amir/', "~/", "g")
"endfunction
""
"function! HasPaste()
    "if &paste
        "return 'PASTE MODE  '
    "en
    "return ''
"endfunction

"" Format the statusline
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%{GitBranch()}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around and tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
map <space> /

"Smart way to move btw. window
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"Moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i

autocmd! bufwritepost *.vimrc source ~\.vimrc  "自动保存,
autocmd GUIEnter * simalt ~x "启动最大化

""zenCode按键
"supertab has map it 
map <c-e> <c-y>,
"iunmap <c-n>
imap <c-e> <c-y>,
"inoremap <c-e> <plug>
"imap <esc><c-e> <c-y>,<kEnter>a

"set NERDTree
nmap <F5> :NERDTreeToggle<cr>

"设置字典 ~/.vim/dict/javascript.dict是字典文件的路径
autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict
autocmd FileType html set dictionary=~/.vim/dict/javascript.dict


"mouse
set mouse=c

"hight light cur line and rol
set cursorline
set cursorcolumn
set cc=81


"增加中文分词
set iskeyword += "，。、“”"

"长行移
nmap k gk
nmap j gj

"for ctrlp
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

"for vim-powerline
"let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'full'

"" neocomple
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
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_skipinputtime = '0.5'
let g:neocomplcache_max_list = 20
let g:neocomplcache_enable_fuzzy_completion = 1

"" for .less
""let g:neocomplcache_filename_include_exts.css =['', 'less']
if !(exists('g:neocomplcache_same_filetype_lists'))
   let g:neocomplcache_same_filetype_lists = {}
endif
let g:neocomplcache_same_filetype_lists.less = 'css'


"" omni completion
" Enable omni completion.
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
