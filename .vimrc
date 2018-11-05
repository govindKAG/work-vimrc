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

Plug 'ryanoasis/vim-devicons'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"""""""LEADER"""""""
let mapleader=" "
""""""""""""""""""""

" Plugin specific settings

"ctrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'

" vim-markdown-preview
let vim_markdown_preview_hotkey='<C-y>'

" colorschemes,  themes and airline config

set background =dark
set t_Co=256
set encoding=utf-8
colorscheme gruvbox
let g:airline_theme='deus'
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
      \ 'n'  : 'N',
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

" key remappings
nnoremap j gj
nnoremap k gk

" regular settings
set nocompatible
set nu
set ruler
set autoindent
set nowrap
syntax enable

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

" Window controls
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" leader shortcuts

"open nerdtree 'D'rawer
nnoremap <Leader>d :NERDTree<CR>

" sort imports
nnoremap <Leader>si vip:sort<CR>

" autocommands

"force markdown syntax highliting on .md files instead of modula2
autocmd BufNewFile,BufRead *.md set filetype=markdown
