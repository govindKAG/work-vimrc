call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'flazz/vim-colorschemes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/ScrollColors'
Plug 'godlygeek/tabular'
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-peekaboo'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'junegunn/goyo.vim'
Plug 'bling/vim-bufferline'
Plug 'plasticboy/vim-markdown'
Plug 'tell-k/vim-autopep8'
Plug 'vim-scripts/AutoComplPop'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'tommcdo/vim-lion'
Plug 'jpalardy/vim-slime'
Plug 'powerman/vim-plugin-viewdoc'
Plug 'zirrostig/vim-schlepp'
Plug 'jmcantrell/vim-diffchanges'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'ryanoasis/vim-devicons'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"""""""LEADER"""""""
let mapleader=" "
""""""""""""""""""""

" Plugin specific settings

"ctrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlPLastMode'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

" vim-markdown-preview
let vim_markdown_preview_hotkey='<C-y>'

" vim-slime config
let g:slime_target = "tmux"

" vim-schlepp config
vmap <unique> <up>    <Plug>SchleppUp
vmap <unique> <down>  <Plug>SchleppDown
vmap <unique> <left>  <Plug>SchleppLeft
vmap <unique> <right> <Plug>SchleppRight

" colorschemes,  themes and airline config

set background =dark
set t_Co=256
set encoding=utf-8
colorscheme gruvbox
let g:airline_theme='ravenpower'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:Powerline_symbols='unicode'

"single letter mode indicator
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'c'  : 'C',
      \ 'i'  : 'I',
      \ 'ic' : 'I',
      \ 'ix' : 'I',
      \ 'n'  : 'KAG',
      \ 'ni' : 'N',
      \ 'no' : 'N',
      \ 'R'  : 'R',
      \ 'Rv' : 'R',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ 't'  : 'T',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ }

let g:airline_skip_empty_sections = 1
let g:airline#extensions#branch#enabled = 1

" key remappings

" sensible up and down
nnoremap j gj
nnoremap k gk

" maintain selection after changing indent level in visual mode
vnoremap < <gv
vnoremap > >gv

"cycle between the line numbering modes
nnoremap <silent> <F3> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" regular settings
set nocompatible
set nu
set ruler
set autoindent
set nowrap
syntax enable
set splitright
set splitbelow

set tabstop=4
set softtabstop=4
set expandtab
set showcmd
filetype indent on
set wildmenu
set wildmode=longest:full,full
set lazyredraw
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set mouse=a
set title
set laststatus=2
set pastetoggle=<F2>
set so=999
set nosol

" undo controls
set undofile
set undodir=~/.vim/undodir

" Window controls
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" leader shortcuts

"toggle nerdtree 'D'rawer
nnoremap <Leader>d :NERDTreeToggle<CR>
"sort imports
nnoremap <Leader>si vip:sort<CR>
"tab on = to allign =s
nnoremap <Leader>t vip:Tabularize /=<CR>
"show 80 column line guide
nnoremap <Leader>cc :let &cc = &cc == '' ? '80' : ''<CR>
"trigger vim-plug install
nnoremap <Leader>pi :PlugInstall<CR>
"reset cursor to the first char of the line
nnoremap <Leader><Leader> ^
"grab a block of text
nnoremap <Leader>g vip
"quick replace
nnoremap <Leader>r :%s/
"trigger vim-plug install
nnoremap <Leader>ff :DiffChangesPatchToggle<CR>
"stealth mode
nnoremap <Leader>sm :colorscheme 256_noir<CR>
"stealth off
nnoremap <Leader>so :colorscheme gruvbox<CR>

" autocommands and other shortcuts

"force markdown syntax highliting on .md files instead of modula2
autocmd BufNewFile,BufRead *.md set filetype=markdown

"run current python file 
nnoremap <buffer> <F9> :exec '!python.exe' shellescape(@%, 1)<cr>
"
"run current R file 
nnoremap <buffer> <F11> :exec '!Rscript.exe' shellescape(@%, 1)<cr>

"run current python file with command line arguments
nnoremap <buffer> <F10> :exec '!python.exe ' shellescape(@%, 1)

"use autopep8 for gq in python files
au FileType python setlocal formatprg=autopep8\ -

"remember cursor position when reopening
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
