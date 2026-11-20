" Minimal Vim configuration.

" Vim's recommended defaults (syntax, filetype detection, incsearch, mouse...),
" which are not loaded automatically once a .vimrc exists
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Colors: use the terminal's 16 ANSI colors so Vim follows the iTerm2 palette
set notermguicolors
set background=dark
colorscheme default

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
