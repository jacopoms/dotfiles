" plugins
call plug#begin()
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'thoughtbot/vim-rspec'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'terryma/vim-multiple-cursors'
"Plug 'tomasr/molokai'
"Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'rakr/vim-one'
"Plug 'patstockwell/vim-monokai-tasty'
"Plug 'KeitaNakamura/neodark.vim'
call plug#end()


" NERDTree config
" autocmd vimenter * NERDTree
nmap <Leader>t :CocCommand explorer<CR>
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

let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1
let g:rehash256 = 1
let g:one_allow_italics = 1

syntax on
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline\:h14
set number
set title
set autoindent
set relativenumber
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

" map Ack to \z
noremap <Leader>z :Ack! <cword><CR>
vnoremap <Leader>z y:Ack! <C-r>=fnameescape(@")<CR><CR>

" split vertically
noremap <leader>p :vsp<CR>
" split horizontally
noremap <leader>o :sp<CR>
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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

" Formatting selected code.
xmap <leader>ft  <Plug>(coc-format-selected)
nmap <leader>ft  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline+=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
autocmd User CocGitStatusChange {command}
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" tabs to 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" ctags settings
"
"let g:gutentags_trace = 0
set tags=tags
set statusline+=%{gutentags#statusline()}