set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'vim-scripts/minibufexplorerpp'
Plugin 'vim-scripts/highlight.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'honza/vim-snippets'
Plugin 'flazz/vim-colorschemes'
Plugin 'mattn/emmet-vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'Rip-Rip/clang_complete'
Plugin 'kien/ctrlp.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
"Plugin 'zenorocha/dracula-theme'


call vundle#end()
filetype plugin indent on

set nu


" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set nocompatible
set clipboard=unnamedplus
set nobackup
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nu
set ts=4
set sw=4
set expandtab
set tabpagemax=50
set completeopt-=preview  " don't show preview window when performing complete
set whichwrap=<,>
set encoding=utf-8
set smarttab
set smartindent
set t_Co=256
set autoindent
set list
set listchars=eol:⇐,tab:⇒\  " use special character on eol and tab character

colorscheme railscasts
"colorscheme molokai

hi SpecialKey term=bold ctermfg=8 guifg=Blue 
hi NonText term=bold ctermfg=8 guifg=Blue



map Q gq

inoremap <C-U> <C-G>u<C-U>

if has('mouse')
  set mouse=a
endif


if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif


filetype plugin indent on

augroup vimrcEx
au!


autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ClangComplete


autocmd FileType java,jsp set noet ts=4 sw=4
autocmd FileType sql set noet ts=4 sw=4
autocmd FileType css,xml,python,yaml,javascript set et ts=4 sw=4
autocmd FileType scss,html,ruby set et ts=2 sw=2


"autocmd FileType text setlocal textwidth=100 et ts=2 sw=2


" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif



map <F12> :MiniBufExplorer<CR>
map <C-right> :bnext<CR>
map <C-left>  :bprevious<CR>
"map <C-f> :FufCoverageFile<CR>
map <F8> :NERDTreeToggle<CR>


inoremap <C-\> <C-x><C-O>

let g:NERDTreeIgnore=['\.pyc$', '\~$', '\.class$', '\.git$', '__init__.py$', '\.swp$', '\.o$']
let g:NERDTreeChDirMode=2



" let g:flake8_max_line_length=100
" let g:flake8_ignore="E121,E126,E127,E128,E501,W404"
"
"
"" clang complete settings
"let g:clang_auto_select=0
"let g:clang_complete_auto=1
"let g:clang_complete_copen=1
"let g:clang_user_options='-std=c++11'
"


"let g:jedi#completions_command = "<C-p>"
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#auto_initialization = 0
"let g:jedi#use_splits_not_buffers = "left"
"let g:jedi#popup_on_dot = 0
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = "<leader>d"
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#rename_command = "<leader>r"
"let g:jedi#show_call_signatures = "1"
"let g:jedi#completions_enabled = 0





let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir' : '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|class)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows


" read local config if exists
if filereadable(".vimrc")
    source .vimrc
endif

