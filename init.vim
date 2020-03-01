"sd vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | nested source $MYVIMRC
endif

" startup for vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'dracula/vim'
" Vim HardTime
Plug 'takac/vim-hardtime'

" helpers
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'luochen1990/rainbow'

call plug#end()

"""""""
colorscheme dracula
set clipboard=unnamed,unnamedplus                " enable clipboard
set encoding=utf8                                " enable utf8 support
set number relativenumber
set autoread " reload on external file changes
set backspace=indent,eol,start                   " backspace behaviour
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set ruler
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
syntax on 

let mapleader="\<space>"
let maplocalleader=','

nnoremap <Leader>f :NERDTreeToggle<CR>
noremap <localleader>f :NERDTreeFind<CR>


"themes and colors
set colorcolumn=80

" fzf.vim
let g:fzf_buffers_jump = 1
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" GO FAST
set lazyredraw                                   " enable lazyredraw
set nocursorline                                 " disable cursorline
set ttyfast                                      " enable fast terminal connection
