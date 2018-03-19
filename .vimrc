set mouse=a
"跟随输入搜索时定位
set incsearch
"Save on buffer switch
set autowrite
"匹配tag标签
"set nocompatible
"runtime macros/matchit.vim

let mapleader=","
map <leader>c :NERDTreeToggle<CR>
map <leader>l :NERDTreeFind<CR>

set shiftwidth=4 softtabstop=4 expandtab
set number

"自动切换目录
set autochdir

autocmd StdinReadPre * let s:std_in=1
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

"make session
map <leader>ms :mksession! ~/.vim/vim_session <CR>
"resote session
map <leader>rs :source ~/.vim/vim_session <CR>

"emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue,less EmmetInstall

set wildmode=longest,list
