set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'thoughtbot/vim-rspec'
"Bundle 'tpope/vim-rails.git'
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'git://git.wincent.com/command-t.git'

syntax on
filetype plugin indent on

set fileformats=unix,dos,mac    " support all three newline formats
set viminfo=                    " don't use or save viminfo files
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

autocmd FileType javascript setlocal sw=2 sts=2 et
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
set showtabline=2
set hidden

" Vagrantfile
"au BufNewFile,BufRead [vV]agrantfile        set filetype=ruby
"au BufNewFile,BufRead *.ru        set filetype=ruby

"noremap <C-h> :bprev<CR>
"noremap <C-l> :bnext<CR>

"map <ESC>[H <Home>
"map <ESC>[F <End>
"imap <ESC>[H <C-O><Home>
"imap <ESC>[F <C-O><End>
"cmap <ESC>[H <Home>
"cmap <ESC>[F <End>

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
