" Use Vim defaults, fix backspace behavior, use system clipboard
set nocompatible backspace=2 clipboard^=unnamed,unnamedplus

set viminfo+=n~/.vim/viminfo dir=~/.vim/swaps undodir=~/.vim/undo undofile

set expandtab tabstop=2 shiftwidth=2 softtabstop=2 smartindent
autocmd FileType make setlocal noexpandtab

set hlsearch incsearch ignorecase smartcase

set nowrap hidden mouse+=a autochdir
set splitbelow splitright
set path+=** wildmenu 
set re=2

syntax on
set background=dark number relativenumber cursorline
colorscheme habamax
hi Normal ctermfg=NONE ctermbg=NONE
hi CursorLine ctermbg=NONE

inoremap <C-c> <ESC>
noremap x "_x
noremap X "_X

" For vim-commentary plugin
filetype plugin indent on
autocmd FileType c,cpp,cuda setlocal commentstring=//\ %s

" Netrw (vim file explorer) settings
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=20
let g:netrw_dirhistmax=0

set errorformat+=%A%\\s%#File\ \"%f\"\\,\ line\ %l\\,\ in%.%#

" Automatically open the quickfix or location list window after running commands like :make or :grep
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
