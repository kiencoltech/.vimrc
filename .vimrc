set nocompatible              " be iMproved, required filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" *** Core Plugin *** "
Plugin 'VundleVim/Vundle.vim' "PluginInstall
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim' " Search a file: Ctr + P

" *** Main Plugin *** "
Plugin 'scrooloose/nerdtree' "Nerdtree to manager file, folder... : Ctr + n-> hide or show
Plugin 'Valloric/YouCompleteMe' "Auto suggest and complete code
"Plugin 'Lokaltog/vim-powerline' "Show something like tab in vim to show property of file open
Plugin 'rking/ag.vim' "Search in vim, need to install the_silver_searche : brew install ... :Ag! 'search word'
Plugin 'sjl/gundo.vim' "Mirror in vim : undo and redo in vim : Fn + F5
Plugin 'Xuyuanp/nerdtree-git-plugin' "show diff from remote and local in git on nertree
Plugin 'vim-syntastic/syntastic' "Syntax check
Plugin 'itchyny/lightline.vim' "statusline/tabline for Vim



" *** Dev *** "
Plugin 'akz92/vim-ionic2'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim' "Support for Tsuquyomi
Plugin 'Quramy/tsuquyomi' "Typescript IDE
Plugin 'jiangmiao/auto-pairs' "Auto pair and make close character
Plugin 'mattn/emmet-vim' "fast to coding html & css
Plugin 'tpope/vim-fugitive' "git in vim
Plugin 'scrooloose/nerdcommenter' " \ + cc -> comment !! | + cu -> uncomment
Plugin 'yggdroot/indentline' "indent for vim, it work in mvim, not in terminal
Plugin 'Quramy/vim-js-pretty-template' "Plugin for templete in js file type
Plugin 'easymotion/vim-easymotion' "Move every where fast: Space + w -> set index in below !! Space + k -> index first charactor up !! Space + J
Plugin 'airblade/vim-gitgutter' "Show diff of git and working version: Gdiff !! Gstatus

"************Tag bar***************
Plugin 'majutsushi/tagbar'

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
" Ctr + N to show or hide Nerdtree
map <c-n> :NERDTreeToggle<CR>
" Ctr + F8 to show all declare and function
nmap <F8> :TagbarToggle<CR>

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
set encoding=utf-8
set updatetime=250
set nu
colorscheme molokai

set tabstop=2
set shiftwidth=2
set expandtab

set splitright
set noswapfile

autocmd Filetype html,scss,js,* match Error /\s\+$/ "*** Whitespace ***"
" Install for vim-js-pretty-templete
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces

" auto complete
filetype plugin on
" Enable autocompletion
set omnifunc=syntaxcomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags "auto complete for html
autocmd FileType css set omnifunc=csscomplete#CompleteCSS "auto complete for css
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS "auto complete for javascript
autocmd FileType python set omnifunc=pythoncomplete#Complete "auto complete for python

" Resizing a window split
nmap + :res +7<CR> " increase pane by 2
nmap _ :res -7<CR> " decrease pane by 2
nmap > :vertical res +7<CR> " vertical increase pane by 2
nmap < :vertical res -7<CR> " vertical decrease pane by 2
"*********Setting for tag bar******************

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

" *** rking/ag *** "
" Config for rking/ag: default will be ignore file inste : .gitignore, ... 
" So we can put special folder or file in external file: .agignore
" If you want global: put it in bash_profile
" refer:https://github.com/ggreer/the_silver_searcher/wiki/Advanced-Usage
" *** NERDcommenter *** "
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }
" *** CtrlP *** "
let g:ag_working_path_mode="r" "Search from root of project
let g:ag_highlight=1
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
"let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint'] " You shouldn't use 'tsc' checker.
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
" ***  Tsuquyomi *** "
" Click Fn + F9 to import
nmap <F9> :TsuImport<CR>
"Click Fn + F10 to References
nmap <F10> :TsuReferences<cr>
"Click Fn + F11 to Define
nmap <F11> :TsuDefinition<cr>

" *** EasyMotion ***"
map <Space>w <Plug>(easymotion-w)
map <Space>f <Plug>(easymotion-f)
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)
"let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Turn on case insensitive feature
"let g:EasyMotion_smartcase = 1

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" *** emmet vim *** "
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss EmmetInstall " Enable just for html/css"
let g:user_emmet_leader_key = '<tab>' " type : Tab + comma to auto fill everything
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
