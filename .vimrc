set nocompatible              " be iMproved, required filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" *** Core Plugin *** "
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'

" *** Main Plugin *** "
Plugin 'scrooloose/nerdtree' "Nerdtree to manager file, folder...
Plugin 'Valloric/YouCompleteMe' "Auto suggest and complete code
"Plugin 'Lokaltog/vim-powerline' "Show something like tab in vim to show property of file open
Plugin 'rking/ag.vim' "Search in vim, need to install the_silver_searche : brew install ...
Plugin 'sjl/gundo.vim' "Mirror in vim : undo and redo in vim
Plugin 'Xuyuanp/nerdtree-git-plugin' "show diff from remote and local in git
Plugin 'vim-syntastic/syntastic' "Syntax check
Plugin 'itchyny/lightline.vim' "statusline/tabline for Vim



" *** Dev *** "
Plugin 'akz92/vim-ionic2'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim' "Support for Tsuquyomi
Plugin 'Quramy/tsuquyomi' "Typescript IDE
Plugin 'jiangmiao/auto-pairs' "Auto pair and make close character
Plugin 'mattn/emmet-vim' "fast to coding html & css
Plugin 'tpope/vim-fugitive' "git in vim"
Plugin 'scrooloose/nerdcommenter'

"************Tag bar***************
"Plugin 'majutsushi/tagbar'

"***************************
"Nerdtree for manager explore
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Put your non-Plugin stuff after this line
"
"*********Autoload on init******************
au VimEnter *  NERDTree

"*********Hot key******************
map <c-n> :NERDTreeToggle<CR>
"nmap <F8> :TagbarToggle<CR>

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

let NERDTreeQuitOnOpen=1 "Close nerdtree when open file"
"Open explain tre 
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" *** Common setting *** "
syntax on
syntax enable
set confirm "get a dialog when :q, :w, or :wq fails
set backspace=indent,eol,start " Enable delete over line breaks and automatically-inserted indentation"
set nobackup "no backup~ files
set encoding=utf8
set nu
colorscheme molokai

set tabstop=2
set shiftwidth=2
set expandtab

set splitright
set noswapfile


" Resizing a window split
nmap + :res +2<CR> " increase pane by 2 
nmap _ :res -2<CR> " decrease pane by 2
nmap > :vertical res +2<CR> " vertical increase pane by 2
nmap < :vertical res -2<CR> " vertical decrease pane by 2
"*********Setting for tag bar******************

"let g:tagbar_type_typescript = {
"  \ 'ctagstype': 'typescript',
"  \ 'kinds': [
"    \ 'c:classes',
"    \ 'n:modules',
"    \ 'f:functions',
"    \ 'v:variables',
"    \ 'v:varlambdas',
"    \ 'm:members',
"    \ 'i:interfaces',
"    \ 'e:enums',
"  \ ]
"\ }
"let g:tagbar_type_css = {
"\ 'ctagstype' : 'Css',
"    \ 'kinds'     : [
"        \ 'c:classes',
"        \ 's:selectors',
"        \ 'i:identities'
"    \ ]
"\ }

" *** CtrlP *** "
" Config for rking/ag: default will be ignore file inste : .gitignore, ... 
" So we can put special folder or file in external file: .agignore
" If you want global: put it in bash_profile
" refer:https://github.com/ggreer/the_silver_searcher/wiki/Advanced-Usage

" *** CtrlP *** "
let g:ag_working_path_mode="r" "Search from root of project
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|platforms\|release\|git' " ignore to search   
" *** Gundo *** "
nnoremap <F5> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_close_on_revert = 1
" *** Syntastic *** "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" ***Typescript vim *** "
"let g:syntastic_typescript_checkers = ['tslint', 'tsc'] "Enable tsling and tsc checker for typescript"
let g:syntastic_html_checkers = []  "Don't check .html files"
let g:syntastic_scss_checkers = ['sass_lint'] "Enable sass_lint checker for scss"
let g:typescript_compiler_binary = 'tsc'
let g:syntastic_quiet_messages ={
  \ "level": 'warnings',
  \ "file:p": ['scss'] }
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" *** Syntastic *** "
autocmd FileType typescript setlocal completeopt+=menu,preview
let g:tsuquyomi_completion_detail = 1

"let g:syntastic_check_on_open=1 "check files on open, not just save
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint'] " You shouldn't use 'tsc' checker.
" ***  Tsuquyomi *** "
nmap <F9> :TsuImport<CR>
nmap <F10> :TsuReferences<cr>
nmap <F11> :TsuDefinition<cr>

" *** emmet vim *** "
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss EmmetInstall " Enable just for html/css"
let g:user_emmet_leader_key = '<tab>'
"let g:user_emmet_prev_key = '<c-j>'
"let g:user_emmet_next_key = '<c-k>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" *** Lightline *** " 
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
" *** Search *** "
set hlsearch "Highlight all matched terms"
set incsearch "Incrementally highlight, as we type."
