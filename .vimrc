set nocompatible
filetype plugin indent on
syntax on

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'thoughtbot/vim-rspec'
Bundle 'vim-ruby/vim-ruby'
Bundle 'elixir-lang/vim-elixir'
Bundle 'tpope/vim-fireplace'
Bundle 'bling/vim-airline'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'skalnik/vim-vroom'
Bundle 't9md/vim-chef'

let g:airline_theme='luna'
let g:airline_powerline_fonts=1

let g:vroom_map_keys=0
let g:vroom_use_colors=1

" Undofile - This allows you to use undos after exiting and restarting
" This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Highlight trailing whitespace with red
let c_space_errors=1
match ErrorMsg /\s\+$\| \+\ze\t/

" Show trailing whitespace and spaces before a tab
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

set background=dark
colorscheme solarized

let g:buftabs_in_statusline=1
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

set autoindent
set backspace=indent,eol,start
set completeopt=menu,longest,preview
set copyindent
set cuc cul
set cursorline
set encoding=utf-8
set expandtab
set fileformats=unix,dos,mac
set guioptions="agimrLt"
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lbr
set mouse=""
set nobackup
set noerrorbells
set nostartofline
set noswapfile
set nu
set number
set paste
set preserveindent
set ruler
set scrolloff=3
set shiftround
set shiftwidth=2
set shortmess=atI
set showcmd
set showmatch
set showtabline=2
set smartcase
set smartindent
set softtabstop=2
set t_Co=256
set t_ut=
set tabstop=2
set tabstop=2
set tags=tags;/
set visualbell t_vb=
set wildignore+=*.jpg,*.jpeg,*.png,*.xpm,*.gif,*.bmp
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=*.swp,*~,._*
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/tmp/*,*/log/*,*.log,*/coverage/*
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
set wildmode=list:longest,list:full

" Language specific
autocmd FileType javascript setlocal  sw=2 sts=2 et
autocmd FileType ruby       setlocal  ts=2 sts=2 sw=2
autocmd FileType python     setlocal  ts=4 sw=4 sts=4 et

" Remaping osx bullshit
map <ESC>[5D <C-Left>
map <ESC>[5C <C-Right>
map! <ESC>[5D <C-left>
map! <ESC>[5C <C-Right>
