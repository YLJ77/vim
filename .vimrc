"设置字体
set guifont=Fixedsys:h16
"设置编码
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,latin1

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

"AutoComplPop插件添加scss、less文件css自动完成
let g:acp_behavior = {
  \   'scss': [
  \     {
  \       'command' : "\<c-x>\<c-f>",
  \       'meets'   : 'acp#meetsForFile',
  \       'repeat'  : 1,
  \     },
  \     {
  \       'command' : "\<c-x>\<c-o>",
  \       'meets'   : 'acp#meetsForCssOmni',
  \       'repeat'  : 0,
  \     },
  \   ],
  \   'less': [
  \     {
  \       'command' : "\<c-x>\<c-f>",
  \       'meets'   : 'acp#meetsForFile',
  \       'repeat'  : 1,
  \     },
  \     {
  \       'command' : "\<c-x>\<c-o>",
  \       'meets'   : 'acp#meetsForCssOmni',
  \       'repeat'  : 0,
  \     },
  \   ],
  \ }
"vim-emmet添加php文件支持
let g:user_emmet_settings = {
  \  'php' : {
  \    'extends' : 'html',
  \    'filters' : 'c',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \}

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

