set nocompatible
filetype plugin indent on
syntax on

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'christoomey/vim-tmux-navigator'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'thoughtbot/vim-rspec'
Bundle 'flazz/vim-colorschemes'
Bundle 'alunny/pegjs-vim'
Bundle 'ervandew/supertab'
Bundle 'int3/vim-extradite'
Bundle 'chriskempson/base16-vim'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'mileszs/ack.vim'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'elixir-lang/vim-elixir'
Bundle 'kikijump/tslime.vim'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'bling/vim-airline'
Bundle 'roman/golden-ratio'
Bundle 'suan/vim-instant-markdown'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

let g:airline_theme='luna'
let g:airline_powerline_fonts=1

let g:vroom_map_keys=0
let g:vroom_use_colors=1
Bundle 'skalnik/vim-vroom'

let g:molokai_original=1
let g:rehash256=1

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

set t_ti= t_te=

set showcmd
let mapleader = ","

set encoding=utf-8
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

set laststatus=2

set guioptions="agimrLt"
set mouse=""

set t_Co=256
set background=dark
colorscheme molokai
set cursorline
set cuc cul
set number
set ruler

" Use Powerline
"let g:Powerline_symbols="fancy"
"python from powerline.bindings.vim import source_plugin; source_plugin()

" Font
"set guifont="Terminus\ 9"

" Show trailing whitespace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

" Support github flavored markdown automatically
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
  au BufReadPost *.md,*.markdown setlocal tw=80
augroup END

augroup erlang
  au!
  au BufNewFile,BufRead *.erl setlocal tabstop=4
  au BufNewFile,BufRead *.erl setlocal shiftwidth=4
  au BufNewFile,BufRead *.erl setlocal softtabstop=4
augroup END

augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()

  au BufReadPost *.thor set syntax=ruby
  au BufReadPost *.ts set syntax=typescript

  " ftdetect isn't being pulled in from the vim-slim plugin for some reason
  autocmd BufNewFile,BufRead *.slim set filetype=slim

  autocmd BufNewFile,BufRead *.coffee set filetype=coffee

  " ftdetect isn't being pulled in from vim-elixir for some reason
  au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
  au FileType elixir setl sw=2 sts=2 et iskeyword+=!,?

  " ftdetect for Arduino
  au BufRead,BufNewFile *.pde set filetype=arduino
  au BufRead,BufNewFile *.ino set filetype=arduino
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open the alternate file
map ,, <C-^>

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" Ack bits
map <leader>a :Ack! -ai 

" Remove highlights
nmap <Leader><CR> :nohlsearch<cr>

" Run this file with rake
map <leader>t :VroomRunTestFile<cr>
map <leader>T :VroomRunNearestTest<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIR OF CURRENT FILE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start scrolling 3 lines before the border
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=3

"""""""""""""""""""""""""""""
" Easier split navigation
"""""""""""""""""""""""""""""
map <C-J> <C-W>j<C-W>_:GoldenRatioResize<CR>
map <C-K> <C-W>k<C-W>_:GoldenRatioResize<CR>
map <C-H> <C-W>h<C-W>_:GoldenRatioResize<CR>
map <C-L> <C-W>l<C-W>_:GoldenRatioResize<CR>
map <C-Space> :GoldenRatioResize<CR>

""""""""""""""""""""""""""""""""""""""""""
" Custom split opening / closing behaviour
""""""""""""""""""""""""""""""""""""""""""
set splitbelow
map <C-N> :vsp .<CR>
map <C-C> :q<CR>






syntax on
filetype plugin indent on

set fileformats=unix,dos,mac    " support all three newline formats
set noerrorbells                " don't whine
set visualbell t_vb=  
set shortmess=atI
set ignorecase                  " set case insensitivity
set smartcase
set nostartofline
set completeopt=menu,longest,preview 
set showmatch 
set shiftround                  " always round indents to multiple of shiftwidth
set copyindent 
set preserveindent 
set nu
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set lbr

noremap <C-h> :bprev<CR>
noremap <C-l> :bnext<CR> 

set laststatus=2
let g:buftabs_in_statusline=1
set paste
map <C-d> caw

set nobackup
set noswapfile

set wildignore=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.jpg,*.jpeg,*.png,*.xpm,*.gif,*.bmp
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/*,*/log/*,*.log,*/coverage/*
set wildignore+=*.swp,*~,._*

set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

autocmd FileType javascript setlocal  sw=2 sts=2 et
autocmd FileType ruby       setlocal  ts=2 sts=2 sw=2
autocmd FileType python     setlocal  ts=8 sw=4 sts=4 et
set showtabline=2
set hidden

"autocmd vimenter * NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_new_tab=1
let g:nerdtree_tabs_autoclose=1
set tags=tags;/

map  <C-a> :tabn<CR>
map  <C-s> :tabp<CR>
map  <C-f> :tabnew<CR>

nmap <silent> <C-D> :NERDTreeTabsToggle<CR>
