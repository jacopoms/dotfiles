"Autoinstall VimPlug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Remap leader key to ,
let g:mapleader=','

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Show hidden files in NERDtree
let NERDTreeShowHidden=1

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
"autocmd vimenter * NERDTree
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>tf :NERDTreeFind<CR>

" Closes NERDTree when it is the only window left open
augroup CloseNERDTreeIfOnlyBuffer
	autocmd!
	autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
" remapping the coors for the preview
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
  "\ 'bg':      ['bg', 'Normal'],
  "\ 'hl':      ['fg', 'Comment'],
  "\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  "\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  "\ 'hl+':     ['fg', 'Statement'],
  "\ 'info':    ['fg', 'PreProc'],
  "\ 'border':  ['fg', 'Ignore'],
  "\ 'prompt':  ['fg', 'Conditional'],
  "\ 'pointer': ['fg', 'Exception'],
  "\ 'marker':  ['fg', 'Keyword'],
  "\ 'spinner': ['fg', 'Label'],
  "\ 'header':  ['fg', 'Comment'] }

" Plug 'liuchengxu/vim-clap'
" let g:clap_provider_grep_delay = 0
" let g:clap_provider_grep_blink = [0, 0]
" let g:clap_provider_grep_enable_icon = 0
" nnoremap <Leader>f :Clap files<CR>
" nnoremap <Leader>b :Clap buffers<CR>

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
Plug 'phanviet/vim-monokai-pro'
Plug 'mhartington/oceanic-next'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'cormacrelf/vim-colors-github'
"let g:quantum_black = 1
Plug 'patstockwell/vim-monokai-tasty'
" Airline plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'monokai_tasty'
"let g:airline_powerline_fonts = 1
let g:rehash256 = 1
"let g:one_allow_italics = 1
let g:github_colors_soft = 1
let g:github_colors_block_diffmark = 0



" Highligh yanks
Plug 'machakann/vim-highlightedyank'

" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }
" future extensions: coc-yank, coc-sql, coc-terminal, coc-docker

let g:coc_global_extensions = ['coc-solargraph', 'coc-pairs']
let g:LanguageClient_serverCommands = {
			\ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
			\ }

nmap <F5> <Plug>(lcn-menu)
"nnoremap <silent> H :call LanguageClient#textDocument_hover()<CR>
nmap <silent>H <Plug>(lcn-hover)
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nmap <silent> gd <Plug>(lcn-definition)
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nmap <silent> <F2> <Plug>(lcn-rename)
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Search for input.
nnoremap <silent><space>a :CocSearch

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
"set statusline+=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
autocmd User CocGitStatusChange {command}

" Add more text object to operate(|, [, {, etc)
Plug 'wellle/targets.vim'

" Undo tree visualization
Plug 'mbbill/undotree'
nnoremap <Leader>u :UndotreeToggle<CR>

" Linter
"Plug 'dense-analysis/ale'

" Git
Plug 'tpope/vim-fugitive'

" Ack plugin

Plug 'mileszs/ack.vim'

" map Ack to \z
noremap <Leader>z :Ack! <cword><CR>
vnoremap <Leader>z y:Ack! <C-r>=fnameescape(@")<CR><CR>


Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'Yggdroot/indentLine'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-surround'
Plug 'jparise/vim-graphql'
Plug 'rstacruz/vim-closer'
Plug 'thoughtbot/vim-rspec'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'lukhio/vim-mapping-conflicts'
" RSpec.vim mappings
"let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!bundle exec rspec --color {spec}"
map <Leader>r :call RunCurrentSpecFile()<CR>
map <Leader>e :call RunNearestSpec()<CR>
map <Leader>q :call RunLastSpec()<CR>
map <Leader>w :call RunAllSpecs()<CR>

call plug#end()

" Tab properties
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab

" Turn on line numbers
set number

" Ignore case on patterns unless specified
set ignorecase
set smartcase

" Turn on syntax
syntax on

" Turn on dark brackground and true color
set background=dark
set termguicolors

" Set up quantum as colorscheme in silent mode due to fresh installs
"let g:vim_monokai_tasty_italic = 1 " allow italics, set this before the colorscheme
colorscheme monokai " onedark/monokai_pro/github/vim-monokai-tasty/OceanicNext/quantum

" Enable esc to normal mode inside terminal mode with the exception of fzf

augroup EscToNormalModeOnTerminalUnlessFZF
	autocmd!
	autocmd TermOpen * if !exists("b:fzf") | tnoremap <buffer> <Esc> <C-\><C-n> | endif
augroup END

" Enable highlighting and previewing substitutions
set inccommand=split

" Saving keystrokes when moving between splits
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

"substitute the word under the cursor with
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
"search for word under the cursor with
nnoremap <Leader>d /<C-r><C-w>

" split vertically
noremap <leader>p :vsp<CR>
" split horizontally
noremap <leader>o :sp<CR>

" new tab
nnoremap <Leader>n :tabnew<CR>

" Auto indent the whole file
map <F7> gg=G<C-o><C-o>


set title
set autoindent
set norelativenumber
set encoding=utf-8 nobomb
scriptencoding utf-8
set binary
set noeol
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
"let g:gutentags_trace = 0
set tags=tags
set statusline+=%{gutentags#statusline()}