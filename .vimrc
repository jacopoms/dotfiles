" plugins
call plug#begin()
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
"Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'thoughtbot/vim-rspec'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'jparise/vim-graphql'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rhubarb'
Plug 'ludovicchabant/vim-gutentags'
Plug 'rainerborene/vim-reek'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'tomasr/molokai'
"Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'rakr/vim-one'
"Plug 'patstockwell/vim-monokai-tasty'
"Plug 'KeitaNakamura/neodark.vim'
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
end
call plug#end()


" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
call deoplete#custom#option('smart_case', v:true)

" NERDTree config
" autocmd vimenter * NERDTree
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

nnoremap <Leader>n :tabnew<CR>

nnoremap <Tab> <C-I>
nnoremap <S-Tab> <C-O>

" Prefer Neovim terminal insert mode to normal mode.
autocmd BufEnter term://* startinsert

" map \ f to search for files
nnoremap <Leader>f :Files<CR>


"" COLORS and Fonts
" important!!
set termguicolors
"let g:vim_monokai_tasty_italic = 1
set background=dark
colorscheme one

let g:airline_theme = 'light'
"let g:airline_powerline_fonts = 1
let g:rehash256 = 1
"let g:neodark#background = '#070b0e' "'#202020'
"let g:neodark#use_256color = 0
"let g:neodark#solid_vertsplit = 1
let g:one_allow_italics = 1

" ALE setting the linters
" Set specific linters
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop']
\}

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
" only show linter errors in the airline
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
" Disable ALE auto highlights
let g:ale_set_highlights = 1

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

syntax on
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline\:h14
set number

set tabstop=2
set softtabstop=0
set shiftwidth=2
set autoindent
set expandtab
set smarttab
set relativenumber
set encoding=utf-8 nobomb
scriptencoding utf-8
set binary
"set noeol
set clipboard=unnamedplus
"" powerline
set rtp+=/usr/local/lib/python3.6/site-packages/powerline/bindings/vim

set showcmd
set cursorline
set colorcolumn=100
filetype indent on
set wildmenu
set lazyredraw
set showmatch       " highlight matching [{()}]
set list
" Highlight searches
set incsearch hlsearch
" Ignore case of searches
set ignorecase smartcase
" Highlight dynamically as pattern is typed
"set incsearch
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

" RSpec.vim mappings
"let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!bundle exec rspec --color {spec}"
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>e :call RunNearestSpec()<CR>
map <Leader>q :call RunLastSpec()<CR>
map <Leader>w :call RunAllSpecs()<CR>


" easy navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"substitute the word under the cursor with
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
"search for word under the cursor with
nnoremap <Leader>d /<C-r><C-w>

" map Ack to \a
noremap <Leader>z :Ack! <cword><CR>
vnoremap <Leader>z y:Ack! <C-r>=fnameescape(@")<CR><CR>

noremap <leader>p :vsp<CR>
noremap <leader>o :sp<CR>
" SYNTATIC SETTINGS
"SET STATUSLINE+=%#WARNINGMSG#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" ctags settings
"
"let g:gutentags_trace = 0
set tags=tags
set statusline+=%{gutentags#statusline()}