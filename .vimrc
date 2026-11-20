" Minimal Vim configuration.

" Vim's recommended defaults (syntax, filetype detection, incsearch, mouse...),
" which are not loaded automatically once a .vimrc exists
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Colors: GitHub Dark Dimmed (same as VS Code) when the terminal supports
" truecolor, otherwise the terminal's 16 ANSI colors
set background=dark
if $COLORTERM =~# 'truecolor\|24bit'
  set termguicolors
  silent! colorscheme github_dark_dimmed
else
  set notermguicolors
  colorscheme default
endif

set number
set hlsearch
set ignorecase smartcase
set expandtab shiftwidth=2 softtabstop=2
set autoindent
set hidden
set clipboard=unnamed
set noswapfile
set undofile undodir=~/.vim/undo//
silent! call mkdir(expand('~/.vim/undo'), 'p')

" Clear search highlighting along with the usual screen redraw
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
