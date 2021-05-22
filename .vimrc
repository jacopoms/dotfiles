"Autoinstall VimPlug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Remap leader key to space
let g:mapleader=' '
nnoremap <SPACE> <Nop>
call plug#begin('~/.local/share/nvim/plugged')

Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
nnoremap <leader>et :NvimTreeToggle<CR>
nnoremap <leader>er :NvimTreeRefresh<CR>
nnoremap <leader>ef :NvimTreeFindFile<CR>
nnoremap <leader>ec :NvimTreeClose<CR>

Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


Plug 'preservim/nerdcommenter'
nmap <Leader>/  <Plug>NERDCommenterToggle

" Telescope Plugin
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Find files using Telescope command-line sugar.
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tl <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>ht <cmd>Telescope help_tags<cr>
nnoremap <leader>tg <cmd>Telescope git_files<cr>

" Dashboard Plugin
Plug 'glepnir/dashboard-nvim'
let g:dashboard_default_executive = 'telescope'

nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

let g:dashboard_custom_header = [
			\'               ▄▄██████████▄▄             ',
			\'               ▀▀▀   ██   ▀▀▀             ',
			\'       ▄██▄   ▄▄████████████▄▄   ▄██▄     ',
			\'     ▄███▀  ▄████▀▀▀    ▀▀▀████▄  ▀███▄   ',
			\'    ████▄ ▄███▀              ▀███▄ ▄████  ',
			\'   ███▀█████▀▄████▄      ▄████▄▀█████▀███ ',
			\'   ██▀  ███▀ ██████      ██████ ▀███  ▀██ ',
			\'    ▀  ▄██▀  ▀████▀  ▄▄  ▀████▀  ▀██▄  ▀  ',
			\'       ███           ▀▀           ███     ',
			\'       ██████████████████████████████     ',
			\'   ▄█  ▀██  ███   ██    ██   ███  ██▀  █▄ ',
			\'   ███  ███ ███   ██    ██   ███▄███  ███ ',
			\'   ▀██▄████████   ██    ██   ████████▄██▀ ',
			\'    ▀███▀ ▀████   ██    ██   ████▀ ▀███▀  ',
			\'     ▀███▄  ▀███████    ███████▀  ▄███▀   ',
			\'       ▀███    ▀▀██████████▀▀▀   ███▀     ',
			\'         ▀    ▄▄▄    ██    ▄▄▄    ▀       ',
			\'               ▀████████████▀             ',
			\]

" Formatting plugins
Plug 'tpope/vim-endwise'
Plug 'ntpeters/vim-better-whitespace'
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0

" TextEdit might fail if hidden is not set.
set hidden
" === vim-better-whitespace === "
"   <leader>y - Automatically remove trailing whitespace
nmap <leader>y :StripWhitespace<CR>

Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'justinmk/vim-sneak'
" Uses label mode to jump between searches
let g:sneak#label = 1

" Installing colorscheme with dark mode enabled
"Plug 'phanviet/vim-monokai-pro'
"Plug 'mhartington/oceanic-next'
"Plug 'tyrannicaltoucan/vim-quantum'
"Plug 'cormacrelf/vim-colors-github'
"let g:quantum_black = 1
"Plug 'altercation/vim-colors-solarized'
"Plug 'patstockwell/vim-monokai-tasty'
"Plug 'KeitaNakamura/neodark.vim'
"let g:neodark#background = '#242424'
""let g:neodark#use_256color = 0
"let g:neodark#terminal_transparent = 1
"let g:neodark#solid_vertsplit = 1
"let g:neodark#use_custom_terminal_theme = 1
" Plug 'liuchengxu/space-vim-theme'
"luafile ~/.config/nvim/lua/galaxy.lua

Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'glepnir/oceanic-material'
Plug 'glepnir/spaceline.vim'
"Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'ryanoasis/vim-devicons'

let g:spaceline_seperate_style = 'slant'
let g:spaceline_colorscheme = 'space'
let g:space_vim_transp_bg = 0
let g:spaceline_diagnostic_tool = 'nvim_lsp'
let g:spaceline_diff_tool = 'git-gutter'
let g:rehash256 = 1
" Highligh yanks
Plug 'machakann/vim-highlightedyank'

"let g:ale_sign_error = '●'
"let g:ale_sign_warning = '.'

" LSP and  Code Completion

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Completion
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


function! s:check_back_space() abort "{{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
" Tabnine plugin
"Plug 'codota/tabnine-vim'

" Code Snippets
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

"let g:completion_enable_snippet = 'UltiSnips'

" Add more text object to operate(|, [, {, etc)
Plug 'wellle/targets.vim'

" Undo tree visualization
Plug 'mbbill/undotree'
nnoremap <Leader>u :UndotreeToggle<CR>

" Git - Github
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

Plug 'terryma/vim-multiple-cursors'

" Ruby specific settings
Plug 'vim-ruby/vim-ruby'
set nocompatible      " We're running Vim, not Vi!
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'rainerborene/vim-reek'
let g:reek_line_limit = 1000

Plug 'Yggdroot/indentLine'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-surround'
Plug 'jparise/vim-graphql'
Plug 'rstacruz/vim-closer'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'lukhio/vim-mapping-conflicts'
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'

" testing
Plug 'vim-test/vim-test'
nnoremap <C-t> :TestFile<CR>

" Elixir configuration
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
let g:mix_format_on_save = 1
call plug#end()

" Solargraph
"
luafile ~/.config/nvim/lua/lsp.lua

" Tab properties
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab

" Turn on line numbers
set number norelativenumber

" Ignore case on patterns unless specified
set ignorecase
set smartcase

" Turn on syntax
syntax on

" Turn on dark/light brackground and true color
set background=dark
set termguicolors
set t_Co=256  " make use of 256 terminal colors only for summerfruit256
" Set up quantum as colorscheme in silent mode due to fresh installs
"let g:vim_monokai_tasty_italic = 1 " allow italics, set this before the colorscheme
colorscheme oceanic_material "onedark/Papercolor/neodark

" Enable esc to normal mode inside terminal mode with the exception of fzf

augroup EscToNormalModeOnTerminalUnlessFZF
	autocmd!
	autocmd TermOpen * if !exists("b:fzf") | tnoremap <buffer> <Esc> <C-\><C-n> | endif
augroup END

" Enable highlighting and previewing substitutions
set inccommand=split

"substitute the word under the cursor with
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
"search for word under the cursor with
nnoremap <Leader>d /<C-r><C-w>

" Saving keystrokes when moving between splits
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>


" split vertically
noremap <C-s><C-v> :vsp<CR>
" split horizontally
noremap <C-s><C-h> :sp<CR>

" new tab
nnoremap <C-s><C-n> :tabnew<CR>

" Auto indent the whole file
map <F7> gg=G<C-o><C-o>


set title
set autoindent
set encoding=utf-8 nobomb
scriptencoding utf-8
set binary
set noeol
set clipboard=unnamedplus
"" powerline
"set rtp+=/usr/local/lib/python3.6/site-packages/powerline/bindings/vim
set mouse=a
set showcmd
set cursorline
set colorcolumn=100
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

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

let g:vim_markdown_conceal = 0
set conceallevel=0

" remove trailing spaces automatically
autocmd BufWritePre * %s/\s\+$//e

autocmd VimResized * wincmd =

nnoremap <silent> <C-Left> gt<CR>
nnoremap <silent> <C-Right> gT<CR>
" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>


" Swap horizontally splits
noremap <C-w><C-h> :windo wincmd H<CR>
" Swap vertically splits
noremap <C-w><C-k> :windo wincmd K<CR>

" Run a alt command from a given path to return the test file.
function! AltCommand(path, vim_command)
	let l:alternate = system("alt " . a:path)
	if empty(l:alternate)
		echo "No alternate file for " . a:path . " exists!"
	else
		exec a:vim_command . " " . l:alternate
	endif
endfunction

" Find the alternate file for the current path and open it
nnoremap <silent> <Leader>. :w<CR>:call AltCommand(expand('%'), ':e')<CR>

" Set grep to use ripgrep with smart case
set grepprg=rg\ --smart-case\ --vimgrep

" Strips any kind of carriage when copy/pasting. Ex: ^M
if !empty($WAYLAND_DISPLAY)
	let g:clipboard = {
				\   'name': 'wayland-strip-carriage',
				\   'copy': {
				\      '+': 'wl-copy --foreground --type text/plain',
				\      '*': 'wl-copy --foreground --type text/plain --primary',
				\    },
				\   'paste': {
				\      '+': {-> systemlist('wl-paste --no-newline | tr -d "\r"')},
				\      '*': {-> systemlist('wl-paste --no-newline --primary | tr -d "\r"')},
				\   },
				\   'cache_enabled': 1,
				\ }
endif

" ctags settings
"
let g:gutentags_trace = 0
set tags+=tags
set statusline=%{gutentags#statusline()}