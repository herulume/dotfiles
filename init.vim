"sd vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | nested source $MYVIMRC
endif

" startup for vim-plug
call plug#begin('~/.local/share/nvim/plugged')


" Vim HardTime
Plug 'takac/vim-hardtime'

" syntax
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['cpp', 'c']}
Plug 'rust-lang/rust.vim', {'for': ['rust']}

" helpers
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'luochen1990/rainbow'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
"languages
Plug 'nbouscal/vim-stylish-haskell'
Plug 'neovimhaskell/haskell-vim'
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-commentary'

" theme
Plug 'dracula/vim'
Plug 'segeljakt/vim-silicon'

call plug#end()

"""""""
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos
set bomb
set binary
set autoread              " read when a file is changed from the outside
" Fix backspace indent
set backspace=indent,eol,start
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab             " convert any tab to spaces
set smarttab
" Indentation
set autoindent            " always set autoindenting on
set copyindent            " copy the previous indentation on autoindenting
set spelllang=en
"" Enable hidden buffers
set hidden
set splitright
set hlsearch              " highlights the term you search for
set incsearch
set ignorecase
set smartcase             " when searching try to be smart about cases
set nobackup
set noswapfile


let mapleader="\<space>"
let maplocalleader=','

noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <M-h> <C-w>H
nnoremap <M-j> <C-w>J
nnoremap <M-k> <C-w>K
nnoremap <M-l> <C-w>L
noremap <Leader>r :call Rename()<CR>
nnoremap <Leader>e :Files<cr>
nnoremap <Tab> :Buffers<cr>
noremap <Leader>f :NERDTreeToggle<CR>
noremap <localleader>f :NERDTreeFind<CR>

if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif


noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+<CR>

"themes and colors
syntax on
filetype plugin indent on

if (has("termguicolors"))
 set termguicolors
endif

set wrap
set ruler
set title                 " change the terminal's title
set showmode              " always show what mode we're currently editing in
set number relativenumber " set hybrid line numbers
set showmatch             " set show matching parenthesis
set colorcolumn=80

set cursorline            " underline the current line, for quick orientation
"set cursorcolumn
"
" Highlight whitespaces
set list
set listchars=""
set listchars+=tab:>-
set listchars+=trail:•
set listchars+=nbsp:•


" Theme
syntax enable
hi Normal guibg=NONE ctermbg=NONE
colors dracula

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
"let g:hardtime_default_on = 1

" fzf.vim
let g:fzf_buffers_jump = 1

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
""" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""" deoplete
set runtimepath+=~/.local/shared/nvim/plugged/deoplete.nvim/
let g:deoplete#enable_at_startup = 1

""" airline
let g:airline#extensions#tabline#enabled = 1

"" ruby"
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

""" cpp
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1


"""haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_indent_disable = 1

" OPTIONAL: Make the update time shorter, so the type info will trigger faster.
set updatetime=1000
let g:ale_linters = {'haskell': ['hlint', 'ghc']}
let g:ale_haskell_ghc_options = '-fno-code -v0 -isrc'

" meh
function! Rename()
  let current = expand('%')
  let new_file = input('New name: ', current)
  if new_file != current && new_file != ''
    exec ':saveas ' . new_file
    exec ':silent !rm ' . current
    redraw!
  endif
endfunction
