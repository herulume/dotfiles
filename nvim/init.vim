let mapleader ="\<Space>"

call plug#begin('~/.local/share/nvim/plugged')
" Theme
Plug 'ajmwagar/vim-deus'
" Project tree
Plug 'preservim/nerdtree'
" Rainbow ()
Plug 'luochen1990/rainbow'
" Comments
Plug 'tpope/vim-commentary'
" Haskell
Plug 'neovimhaskell/haskell-vim'
call plug#end()

""" General
set nocompatible "Not needed
colorscheme deus "Set theme
set background=dark "Tell vim what the background color looks like
syntax enable "Enable syntax
set clipboard=unnamed,unnamedplus "Clipboard
set encoding=utf8 "utf8 support
set t_Co=256 "Term colors
set number relativenumber "Relative line numbers
set autoread "Reload on external file changes
set backspace=indent,eol,start "Backspace behaviour
set visualbell "No bips
set hlsearch "Highlight search
set incsearch "Search with '/' and enable 'n' as next
set autoindent "Good auto indent
set smartindent "Smart indenting
set colorcolumn=80 "Vertical line
set list listchars=tab:»·,trail:· "Symbols to show
set nowrap "Display long lines as just one line
set ruler "Show the cursor position all the time

""" Tabs and spaces
set expandtab "Tabs to spaces
set shiftwidth=4 "Tab = 4 spaces
set smarttab "Smart tabs
set softtabstop=4 "Same value as shift width

""" Trim white space
autocmd BufWritePre * %s/\s\+$//e

""" Rainbow
let g:rainbow_active = 1

""" builtin fzf (:find)
set path+=**
set wildmenu

""" GO FAST
set lazyredraw
set nocursorline
set ttyfast

" You can't stop me
cmap w!! w !sudo tee %

" nerdtree
map <leader>n :NERDTreeToggle<CR>

" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" vim-commentary
map <leader>gc <Plug>Commentary
