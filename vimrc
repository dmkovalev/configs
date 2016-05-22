set nocompatible              " be iMproved, required
filetype off                  " required

" PLUGINS with configuration {{{
" Vundle {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" }}}
" Look plugins {{{
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'oblitum/rainbow'

" }}}
" Completion and snippets {{{
Plugin 'dansomething/vim-eclim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'

" }}}
" External tools {{{
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'tfnico/vim-gradle'
" }}}
" Operations with files and code {{{
Plugin 'sjl/gundo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-rooter.git'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/nerdcommenter'
" }}}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Configuration variables {{{
let g:airline#extensions#tabline#enabled = 1
let g:rainbow_active = 1
let g:EclimCompletionMethod = 'omnifunc'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Ignore these directories
set wildignore+=*/build/**
" disable caching
let g:ctrlp_use_caching=0
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
"}}} 

" }}} 
" White characters {{{
set modelines=0
"tabstop {{{ - количество пробелов, которыми символ табуляции отображается в тексте. 
"Оказывает влияние как на уже существующие табуляции, так и на новые. В случае 
"изменения значения, «на лету» применяется к тексту.}}}
set tabstop=4
" softtabstop {{{ - количество пробелов, которыми символ табуляции отображается
" при добавлении.
" Несмотря на то, что при нажатии на Tab вы получите ожидаемый результат
" (добавляется новый символ табуляции), фактически в отступе могут
" использоваться как табуляция так и пробелы. Например, при установленных
" tabstop равной 8 и softtabstop равной 4, троекратное нажатие Tab приведет к
" добавлению отступа шириной 12 пробелов, однако сформирован он будет из
" одного символа табуляции и 4 пробелов.}}}
set softtabstop=4
" {{{
" по умолчанию используется для регулирование ширины отступов в пробелах,
" добавляемых командами >> и <<. Если значение опции не равно tabstop, как и в
" случае с softtabstop, отступ может состоять как из символов табуляций так и
" из пробелов. При включении опции — smarttab, оказывает дополнительное
" влияние.}}}
set shiftwidth=4
" {{{
"в случае включения этой опции, нажатие Tab в начале строки (если быть точнее,
"до первого непробельного символа в строке) приведет к добавлению отступа,
"ширина которого соответствует shiftwidth (независимо от значений в tabstop и
"softtabstop). Нажатие на Backspace удалит отступ, а не только один символ,
"что очень полезно при включенной expandtab. Напомню: опция оказывает влияние
"только на отступы в начале строки, в остальных местах используются значения
"из tabstop и softtabstop.}}}
set smarttab
"{{{
" в режиме вставки заменяет символ табуляции на соответствующее количество
" пробелов. Так же влияет на отступы, добавляемые командами >> и <<.}}}
set expandtab
" {{{
" делает то же, что и autoindent плюс автоматически выставляет отступы в
" «нужных» местах. В частности, отступ ставится после строки, которая
" заканчивается символом {, перед строкой, которая заканчивается символом },
" удаляется перед символом #, если он следует первым в строке и т.д.
" (подробнее help 'smartindent').}}}
set smartindent
"------------------handle long lines correctly------------"
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
" }}}
" Folding {{{
set foldlevelstart=0
set foldmethod=syntax
" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za
" " Make zO recursively open whatever top level fold we're in, no matter where
" cursor happens to be.
nnoremap zO zCzO
" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz
" }}}
" Settings {{{
syntax on
au FileType vim setlocal foldmethod=marker
set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set list
set listchars=tab:▸\ ,eol:¬
set t_Co=256
" set t_Co=16
" set background=dark
colorscheme molokai
let g:molokai_original=1
let g:rehash256 = 1
" }}}
" Navigation & UI {{{
let mapleader = "," "map leader command to ,
" remove the usage of arrows
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" remap mvmnt keys to normal behaviour
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap ; :
" splitted windows navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" clear search matching
nnoremap <leader><space> :noh<cr>
" ???
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" launch Ack
nnoremap <leader>a :Ack
" ???
nnoremap <leader>v V`]
" open new vsplit and move there
nnoremap <leader>w <C-w>v<C-w>l
" open .vimrc file
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>ez <C-w><C-v><C-l>:e ~/.zshrc<cr>
nnoremap <leader>sc :SyntasticCheck<CR>
nnoremap <leader>si :SyntasticInfo<CR>
nnoremap <leader>sr :SyntasticReset<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>
map <F4> :w<CR> :compiler gradle<CR> :make test<CR>:cw 4<CR>
" Easy buffer navigation
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>
" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <leader>yo "*y
" Paste content from OS's clipboard
nnoremap <leader>po "*p
" Yank from current cursor position to end of line
map Y y$
" Source current line
vnoremap <leader>L y:execute @@<cr>
" Source visual selection
nnoremap <leader>L ^vg_y:execute @@<cr>
" Fast saving and closing current buffer without closing windows displaying the buffer
nmap <leader>wq :wq<cr>
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" Use <leader>t to open ctrlp
let g:ctrlp_map = '<leader>t'
" save while losing focus
au FocusLost * :wa
" }}}
" Search options {{{
"search regex amendment
nnoremap ? ?\v
nnoremap ? ?\v
vnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
"}}} 
