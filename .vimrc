" plugins
call plug#begin()
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'thoughtbot/vim-rspec'
"Plug 'sainnhe/edge'
"Plug 'jdsimcoe/abstract.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()


" NERDTree config
" autocmd vimenter * NERDTree
nnoremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeChDirMode=1
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
"" COLORS and Fonts
" Sahne/edge colorthene
" important!!
set termguicolors
" for dark version
"set background=dark

" for light version
" set background=light

" the configuration options should be placed before `colorscheme edge`
" let g:edge_style = 'default'
" let g:edge_disable_italic_comment = 1

" colorscheme onedark options
let g:onedark_hide_endofbuffer=1

syntax on
colorscheme onedark
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline\:h14
set number

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set relativenumber
set encoding=utf-8 nobomb
scriptencoding utf-8
set binary
set noeol
set clipboard=unnamedplus
"" powerline
set rtp+=/usr/local/lib/python3.6/site-packages/powerline/bindings/vim

set autoindent
set showcmd
set cursorline
set colorcolumn=100
filetype indent on
set wildmenu
set lazyredraw
set showmatch       " highlight matching [{()}]
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
set foldenable      " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" fold based on indent level
set foldmethod=indent
" map fold to space + z + a
nnoremap <space> za
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

let g:vim_markdown_conceal = 2
set conceallevel=2

" remove trailing spaces automatically
autocmd BufWritePre * %s/\s\+$//e

autocmd VimResized * wincmd =

nnoremap <C-Left> gt<CR>
nnoremap <C-Right> gT<CR>

let g:rspec_runner = "os_x_iterm"

" easy navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>