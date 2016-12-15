set nocompatible
syntax on

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

filetype off
filetype plugin indent on

Bundle 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Bundle 'tpope/vim-fireplace'
Bundle 'mxw/vim-jsx'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'wincent/command-t'
Bundle 'Yggdroot/indentLine'

let g:airline_theme='luna'
let g:airline_powerline_fonts=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

let g:vroom_map_keys=0
let g:vroom_use_colors=1

" allows use undos after exiting and restarting
" uses .vim-undo first, then ~/.vim/undo
if exists("+undofile")
	if isdirectory($HOME . '/.vim/undo') == 0
		:silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
	endif
	set undodir=./.vim-undo//
	set undodir+=~/.vim/undo//
	set undofile
endif

" highlight trailing whitespace with red
let c_space_errors=1
match ErrorMsg /\s\+$\| \+\ze\t/

" show trailing whitespace and spaces before a tab
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termtrans=1
let g:buftabs_in_statusline=1

" mark 80+ columns
let &colorcolumn=join(range(81,999),",")

colorscheme solarized

set autoindent
set backspace=indent,eol,start
set completeopt=menu,longest,preview
set copyindent
set cul
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
set mouse=a
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
set term=xterm-256color
set showtabline=2
set smartcase
set smartindent
set softtabstop=2
set t_Co=256
set t_ut=
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
set wildignore+=*.o,*.obj,**/.git/*,**/.svn/*,**/node_modules/**,node_modules/**,.git/*,svn/*
set wildmode=longest,list,full
set autochdir
set wildmenu
set relativenumber
set number
set splitbelow
set splitright

let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'
let g:jsx_ext_required = 0
let g:lasttab = 1
let g:indentLine_char = '┆'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * wincmd p

au TabLeave * let g:lasttab = tabpagenr()
au VimEnter * if &diff | execute 'windo set wrap' | endif
au InsertEnter * hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
au InsertLeave * hi TabLineFill ctermfg=0 ctermbg=0

" language specific whitespace
autocmd FileType javascript setlocal	sw=2 sts=2 et
autocmd FileType ruby				setlocal	ts=2 sts=2 sw=2
autocmd FileType python			setlocal	ts=4 sw=4 sts=4 et

" jump to the last position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" remaping osx bullshit
map <ESC>[5D <C-Left>
map <ESC>[5C <C-Right>
map! <ESC>[5D <C-left>
map! <ESC>[5C <C-Right>

" vertical split color and looks
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE

" remove ~ from blank lines
hi NonText ctermfg=black guifg=black

" reindent, retab and save
map <leader>w mzgg=G`z<bar>;retab!<bar>;w<cr>
map <leader>wq mzgg=G`z<bar>;retab!<bar>;w<bar>;q<cr>

" create splits
map <Leader>- ;sp<CR>
map <Leader>\| ;vsp<CR>

" navigate splits
nnoremap <leader><Right> <C-w>l
nnoremap <leader><Left> <C-w>h

" navigate tabs
map <Leader>[ <Esc>;tabp<CR>
map <Leader>] <Esc>;tabn<CR>

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" what is this
nnoremap ; :
