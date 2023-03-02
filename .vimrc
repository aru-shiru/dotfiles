"---------------Plugins---------------"
call plug#begin(expand('~/.vim/plugged'))

Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-surround'

call plug#end()





" set nord as colorscheme
colorscheme nord

" map <leader> to comma
let mapleader=' '

" turn on syntax highlighting
syntax on

" show line number
set number

" use relative number
set relativenumber

" set default split placement
set splitbelow
set splitright

" always show what mode we're currently editing in
set showmode

" highlight search result
set hlsearch

" search as you type
set incsearch

" disable annoying bell sound
set noerrorbells visualbell t_vb=

" automatically write file when switching
set autowriteall

" do not continue comment
set formatoptions-=cro

" set our desired autocomplete matching
set complete=.,w,b,u

" a tab is 4 spaces
set tabstop=4

" use spaces instead of tab
set expandtab

" use 4 spaces for tabs in insert mode
set softtabstop=4

" use 4 spaces for indentation in normal mode
set shiftwidth=4





"---------Mappings----------"
" maket it easier to edit vim config
map <leader>s :source ~/.vimrc<CR>
map <leader>ev :e ~/.vimrc<CR>

" Remove search highlight
nmap <Esc> :nohlsearch<CR>

"easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" close buffer
nmap <leader>w :bd<CR>
nmap <C-o> :bnext<CR>
nmap <C-i> :bprev<CR>

" type jj in insert mode to switch to normal mode
imap jj <Esc>





"---------Plugin-Configuration---------"
