" Specify a directory for plugins " - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
"Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'ap/vim-css-color'
Plug 'terryma/vim-multiple-cursors'
Plug 'posva/vim-vue'
Plug 'valloric/youcompleteme'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'philrunninger/nerdtree-buffer-ops'
Plug 'philrunninger/nerdtree-visual-selection'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'sirver/ultisnips'
Plug 'junegunn/gv.vim'
Plug 'thaerkh/vim-workspace'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'mhinz/vim-signify'
Plug 'thinca/vim-quickrun'
Plug 'moll/vim-node'
Plug 'kshenoy/vim-signature'
Plug 'andrewradev/splitjoin.vim'
Plug 'luochen1990/rainbow'
"Plug 'vim-scripts/YankRing.vim'
Plug 'tyru/open-browser.vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-vinegar'
Plug 'mhinz/vim-startify'
Plug 'yegappan/grep'
Plug 'shougo/deol.nvim'
Plug 'valloric/matchtagalways'
Plug 'dyng/ctrlsf.vim'
Plug 'majutsushi/tagbar'
Plug 'ternjs/tern_for_vim'
" Initialize plugin sytem
call plug#end()

"ctrlsf plugin:
"rainbow plugin:
let g:ctrlsf_auto_close = {
      \ "normal" : 0,
      \ "compact": 0
      \}
let g:ctrlsf_auto_focus = {
      \ "at": "start"
      \ }
let g:ctrlsf_auto_preview = 1
let g:ctrlsf_default_root = 'project' "cwd | project
let g:ctrlsf_default_view_mode = 'compact' "normal | compact
let g:ctrlsf_extra_root_markers = ['.git', 'package.json', '.gitignore']
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_position = 'left' "left | right | top | bottom
let g:ctrlsf_winsize = '30%'

"rainbow plugin:
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

"signify plugin: " default updatetime 4000ms is not good for async update
set updatetime=100

"ack plugin: use ag(The Silver Searcher) with this
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"don't want to jump to the first result automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

"vim-workspace plugin: Autosave
let g:workspace_autosave_always = 1
"save all your session files in a single directory outside of your workspace
"let g:workspace_session_directory = $HOME . '\.vim\sessions\'

"easymotion plugin: Integration with incsearch.vim
"haya14busa/incsearch.vim
"haya14busa/incsearch-fuzzy.vim
"haya14busa/incsearch-easymotion.vim
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and sometimes want to move cursor with
" EasyMotion.

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
"n-character search motion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"hjkl motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
"Smartcase & Smartsign
let g:EasyMotion_smartcase = 1

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"vim-gitgutter plugin: recommend configuring vim-gitgutter with the full path to your git executable
let g:gitgutter_git_executable = 'C:\Program Files\Git\bin\git.exe'

"syntastic plugin: Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"nerdtree-git-plugin: How to config custom symbols?
"Use this variable to change symbols.
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'Modified',
                \ 'Staged'    :'Staged',
                \ 'Untracked' :'Untracked',
                \ 'Renamed'   :'Renamed',
                \ 'Unmerged'  :'Unmerged',
                \ 'Deleted'   :'Deleted',
                \ 'Dirty'     :'Dirty',
                \ 'Ignored'   :'Ignored',
                \ 'Clean'     :'Clean',
                \ 'Unknown'   :'Unknown',
                \ }


"Keep 50 commands and 50 search patterns in the history.  Use another number if
"you want to remember fewer or more lines.
set history=50

"This makes Vim use the indent of the previous line for a newly created line.
"Thus there is the same amount of white space before the new line.  For example
"when pressing <Enter> in Insert mode, and when using the "o" command to open a
"new line.
set autoindent

"This specifies where in Insert mode the <BS> is allowed to delete the
"character in front of the cursor.  The three items, separated by commas, tell
"Vim to delete the white space at the start of the line, a line break and the
"character before where Insert mode started.
set backspace=indent,eol,start

set wildmenu
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
set nocompatible
"runtime macros/matchit.vim

let mapleader=","
map <leader>c :NERDTreeToggle<CR>
map <leader>l :NERDTreeFind<CR>

set shiftwidth=4 softtabstop=4 expandtab
set number

"自动切换目录
set autochdir

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

"set default shell for vim
set shell=$ProgramW6432/Git/bin/bash
