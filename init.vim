if exists('g:vscode')
    " VSCode extension
  let mapleader = " "
else
  " ordinary Neovim
  lua require("plugins")
  lua require("_key_bindings")
  lua require("lsp")
  lua require("treesitter")
  lua require("completion")
  lua require("buffer")
  lua require("_formatter")
  lua require("_gitsigns")
  " lua require("_lualine")
  lua require("evil_lualine")
  " lua require("spaceline")
  " lua require("_feline")
  lua require("telescope-nvim")
  lua require("_tree")
  lua require("_gitlinker")
  lua require("_hover")
  lua require("_neogen")
  lua require("_neogit")
  lua require("_neotest")
  lua require("_todo_comments")
  lua require("_colorschemes")
  lua require("_which-key")
endif


" packer
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

" set clipboard+=unnamedplus
set expandtab
set smartindent
set linespace=2 shiftwidth=2 tabstop=2
set splitbelow splitright
" set number relativenumber
set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
  autocmd BufWritePre * lua vim.lsp.buf.format({async = true})
augroup END

set ruler
set hidden
set textwidth=100
set colorcolumn=99
set spelllang=en
" set noswapfile
" set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set noshowmode
set completeopt=menuone,noinsert,noselect
set ignorecase
set smartcase
set nowrap
set mouse=a
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set foldexpr='nvim_treesitter#foldexpr()'
set title
augroup dirchange
  autocmd!
  autocmd DirChanged * let &titlestring=v:event['cwd']
augroup END
" " set nohlsearch
set scrolloff=8
set shortmess+=c
set cursorline
set inccommand=nosplit
set fillchars=vert:│
set timeoutlen=500 ttimeoutlen=0
set updatetime=10
set laststatus=3
"set list listchars=tab:»\ ,trail:·,eol:¬,extends:>,precedes:<,nbsp:+

" Vim ruby
" set nocompatible      " We're running Vim, not Vi!
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


function! <SID>AddFrozenStringLiteralMagicComment()
  let l = line(".")
  let c = col(".")
  execute "norm gg"
  execute "norm O# frozen_string_literal: true"
  execute "norm o"
  call cursor(l+2, c)
endfunction

" -- auto cmds
autocmd TermOpen * setlocal nonu
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby
autocmd BufWritePost plugins.lua PackerCompile
autocmd FileType ruby map <leader>rfs :call <SID>AddFrozenStringLiteralMagicComment()<CR>
autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async = true})
" -- remaps
" let mapleader = " "
tnoremap <leader><Esc> <C-\><C-n>
nnoremap <C-T> <cmd>vnew term://zsh<CR>
nnoremap <C-X> <Cmd>split term://zsh<CR>
tnoremap <Esc> <C-\><C-n>

" Saving keystrokes when moving between splits
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>
nnoremap <silent> <C-h> <C-w><C-h>

" split vertically
noremap <C-s><C-v> <cmd>vsp<CR>
" split horizontally
noremap <C-s><C-h> <cmd> sp<CR>

"Telescope
nnoremap <leader>ff <cmd>Telescope<CR>
nnoremap <leader>f <cmd>Telescope find_files prompt_prefix=🔍<CR>
nnoremap <leader>fH <cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files prompt_prefix=🔍🔍<CR>
nnoremap <leader>fl <cmd>Telescope live_grep<CR>
nnoremap <leader>fg <cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>
nnoremap <leader>bb <cmd>Telescope buffers<CR>
nnoremap <leader>fb <cmd>Telescope file_browser<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <leader>fc <cmd>Telescope commands<CR>
nnoremap <leader>fq <cmd>Telescope quickfix<CR>
nnoremap <leader>ft <cmd>Telescope tags<CR>
nnoremap <leader>fa <cmd>Telescope grep_string<CR>
nnoremap <leader>fe <cmd>Telescope env<CR>
nnoremap <leader>gf <cmd>Telescope git_files<CR>
nnoremap <leader>gs <cmd>Telescope git_status<CR>
nnoremap <leader>gst <cmd>Telescope git_stash<CR>
nnoremap <leader>gl <cmd>Telescope git_commits<CR>
nnoremap <leader>glb <cmd>Telescope git_bcommits<CR>
nnoremap <leader>gb <cmd>Telescope git_branches<CR>
nnoremap <leader>gpr <cmd>Telescope gh pull_request<CR>
nnoremap <leader>gco <cmd>lua require('telescope').extensions.githubcoauthors.coauthors()<CR>

" bufferline
nnoremap <leader>q <cmd>bdelete<CR>
nnoremap <leader>Q <cmd>bdelete!<CR>
nnoremap <Tab> <cmd>BufferLineCycleNext<CR>
nnoremap <S-Tab> <cmd>BufferLineCyclePrev<CR>

" DiffView
" nnoremap <leader>df <cmd>DiffviewFileHistory<CR>
nnoremap <leader>dff <cmd>DiffviewFileHistory %<CR>
nnoremap <leader>dc <cmd>DiffviewClose<CR>

" update packages
noremap <C-u><S-u> <cmd>PackerSync<CR>

" format code
nnoremap <leader>mm gg=G<C-o><CR>

nnoremap <silent> <leader>tt :NvimTreeToggle<CR>
nnoremap <silent> <leader>tf :NvimTreeFindFile<CR>

" vim test
nnoremap <leader>t :TestFile<CR>
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>ta :TestSuite<CR>
let test#strategy = "neovim"
let test#ruby#rspec#executable = 'bundle exec rspec'

" SymbolsOutline plugin
nnoremap <leader>a <cmd>SymbolsOutline<CR>

" Swap horizontally splits
noremap <C-w><S-h> :windo wincmd H<CR>

" Swap vertically splits
noremap <C-w><S-k> :windo wincmd K<CR>

"subsitute the word under the cursor with
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

"search forward for word under the cursor with
nnoremap <leader>h /<C-r><C-w><CR>
"search backward for word under the cursor with
nnoremap <leader>hh ?<C-r><C-w><CR>

" save with leader W
nnoremap <leader>w :w<CR>

inoremap <C-q> <Esc>

" copy and save from the clipboard"
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+y$
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
