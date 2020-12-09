set fillchars+=vert:\ 
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set incsearch
set hlsearch
set backspace=indent,eol,start
set number
set ls=2
set cursorline
syntax on
set nowrap
set nocompatible    " be iMproved, required
set noshowmode
filetype off
let script_dir = fnamemodify(expand('<sfile>'), ':h:h')
let &runtimepath = script_dir.','.&runtimepath.','.script_dir.'/after'
if !has('gui_running')
    set t_Co=256
endif
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
let g:supertab#SuperTabContextTextOmniPrecedence = ['&omnifunc']
Plugin 'davidhalter/jedi-vim'
"let g:jedi#auto_initialization = 1
"let g:jedi#force_py_version = 3.8
let g:jedi#completions_enabled = 1
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'frazrepo/vim-rainbow'
Plugin 'itchyny/lightline.vim' 
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'morhetz/gruvbox'
" Plugin 'git://github.com/python-mode/python-mode.git'
" All of your Plugins must be added before the following line
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'arielrossanigo/dir-configs-override.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install all' }
Plugin 'junegunn/fzf.vim'
Plugin 'fisadev/FixedTaskList.vim'
Plugin 'Shougo/context_filetype.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-surround'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'jeetsukumaran/vim-indentwise'
Plugin 'sheerun/vim-polyglot'
Plugin 'mileszs/ack.vim'
Plugin 'lilydjwg/colorizer'
Plugin 't9md/vim-choosewin'
" Plugin 'fisadev/vim-isort'
" Plugin 'valloric/MatchTagAlways'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-signify'
Plugin 'vim-scripts/YankRing.vim'
" Plugin 'neomake/neomake'
Plugin 'myusuf3/numbers.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'rosenfeld/conque-term'
Plugin 'vim-scripts/matchit.zip'
" save as sudo
Plugin 'xavierd/clang_complete'
ca w!! w !sudo tee "%"

 " tab navigation mappings
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>
 "
 " " when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3
 "
 " " clear search results
nnoremap <silent> // :noh<CR>
 "
 " " clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e
 "
 " " fix problems with uncommon shells (fish, xonsh) and plugins running
 " commands
 " " (neomake, ...)
set shell=/bin/zsh 
 "
 " " Ability to add python breakpoints
 " " (I use ipdb, but you can change it to whatever tool you use for
 " debugging)
au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>
 "
 " "
 " ============================================================================
 " " Plugins settings and mappings
 " " Edit them as you wish.
 "
 " " Tagbar -----------------------------
 "
 " " toggle tagbar display
map <F4> :TagbarToggle<CR>
 " autofocus on tagbar open
let g:tagbar_autofocus = 1
 "
 " " NERDTree -----------------------------
 "
 " " toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
 " " open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
 " " don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
 "
 " " Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
 "
 " " Fix directory colors
highlight! link NERDTreeFlags NERDTreeDir
 "
 " " Remove expandable arrow
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"
 "
 " " Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction
 
autocmd BufEnter * call NERDTreeRefresh()
 
 " Tasklist ------------------------------
 "
 " " show pending tasks list
map <F2> :TaskList<CR>
 "
 " " Neomake ------------------------------
 "
 " " Run linter on write
"autocmd! BufWritePost * Neomake
 "
 " " Check code as python3 by default
"let g:neomake#neomake_python_python_maker = neomake#makers#ft#python#python()
"let g:neomake#neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
"let g:neomake#neomake_python_python_maker.exe = 'python3 -m py_compile'
"let g:neomake#neomake_python_flake8_maker.exe = 'python3 -m flake8'
 "
 " " Disable error messages inside the buffer, next to the problematic line
"let g:neomake#neomake_virtualtext_current_error = 0
 "
 " " Fzf ------------------------------
 "
 " " file finder mapping
nmap ,e :Files<CR>
 " " tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
 " " the same, but with the word under the cursor pre filled
nmap ,wg :execute ":BTag " . expand('<cword>')<CR>
 " " tags (symbols) in all files finder mapping
nmap ,G :Tags<CR>
 " " the same, but with the word under the cursor pre filled
nmap ,wG :execute ":Tags " . expand('<cword>')<CR>
 " " general code finder in current file mapping
nmap ,f :BLines<CR>
 " " the same, but with the word under the cursor pre filled
nmap ,wf :execute ":BLines " . expand('<cword>')<CR>
 " " general code finder in all files mapping
nmap ,F :Lines<CR>
 " " the same, but with the word under the cursor pre filled
nmap ,wF :execute ":Lines " . expand('<cword>')<CR>
 " " commands finder mapping
nmap ,c :Commands<CR> " " " " "
" Ack.vim ------------------------------
"
" " mappings
nmap ,r :Ack 
nmap ,wr :execute ":Ack " . expand('<cword>')<CR>
"
" " Window Chooser ------------------------------
"
" " mapping
nmap  -  <Plug>(choosewin)
" " show big letters
let g:choosewin_overlay_enable = 1
"
" " Signify ------------------------------
"
" " this first setting decides in which order try to guess your current vcs
" " UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = ['git', 'hg']
" " mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" " nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
"
" " Autoclose ------------------------------
"
" " Fix to let ESC work as espected with Autoclose plugin
" " (without this, when showing an autocompletion window, ESC won't leave
" insert
" "  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}
" " Yankring -------------------------------
"
let g:yankring_history_dir = '~/.vim/dirs'

" Airline ------------------------------

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

call vundle#end()            " required
filetype plugin indent on    " required
