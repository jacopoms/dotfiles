lua require("plugins")
lua require("treesitter")
lua require("completion")
lua require("buffer")
lua require("lsp")
lua require("comment")
lua require("_gitsigns")
lua require("_lualine")
lua require("telescope-nvim")
lua require("_tokyonight")

" packer
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end


set clipboard+=unnamedplus
set expandtab
set smartindent
set linespace=2 shiftwidth=2 softtabstop=2 tabstop=2
set splitbelow splitright
set number relativenumber
set hidden
set textwidth=100
set colorcolumn=99
set spelllang=en
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set noshowmode
set completeopt=menuone,noinsert,noselect
set ignorecase smartcase
set nowrap
set mouse=a
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2"set guicursor=
set nohlsearch
set scrolloff=8
set shortmess+=c
set cursorline
set inccommand=nosplit
set fillchars=vert:│
set timeoutlen=500 ttimeoutlen=0
set updatetime=10
"set list listchars=tab:»\ ,trail:·,eol:¬,extends:>,precedes:<,nbsp:+

"Color Theme Settings
set termguicolors
" let g:onedark_style = deep
"colorscheme onedark
" let g:tokyonight_style = day
" colorscheme tokyonight

" nvim-tree
let g:nvim_tree_side = "left"
let g:nvim_tree_auto_close = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_disable_netrw = 0
let g:nvim_tree_follow = 1

" Vim ruby
set nocompatible      " We're running Vim, not Vi!
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" -- auto cmds
autocmd TermOpen * setlocal nonu
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby
autocmd BufWritePost plugins.lua PackerCompile

" -- remaps
let mapleader = " "
tnoremap <leader><Esc> <C-\><C-n>
nnoremap <C-T> <cmd>vnew term://zsh<CR>
nnoremap <C-X> <Cmd>split term://zsh \| resize 18<CR>
tnoremap <Esc> <C-\><C-n>

" Saving keystrokes when moving between splits
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>
nnoremap <silent> <C-h> <C-w><C-h>


" split vertically
noremap <C-s><C-v> :vsp<CR>
" split horizontally
noremap <C-s><C-h> :sp<CR>


"Telescope
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
nnoremap <leader>fq <cmd>Telescope quickfix<CR>
nnoremap <Leader>ft <cmd>Telescope tags<CR>
nnoremap <Leader>fa <cmd>Telescope grep_string<CR>
nnoremap <Leader>gf <cmd>Telescope git_files<CR>
nnoremap <Leader>gs <cmd>Telescope git_status<CR>
nnoremap <Leader>gst <cmd>Telescope git_stash<CR>
nnoremap <Leader>gl <cmd>Telescope git_commits<CR>
nnoremap <Leader>glb <cmd>Telescope git_bcommits<CR>
nnoremap <Leader>gb <cmd>Telescope git_branches<CR>

" bufferline
nnoremap <leader>q <cmd>bdelete<CR>
nnoremap <Tab> <cmd>BufferLineCycleNext<CR>
nnoremap <S-Tab> <cmd>BufferLineCyclePrev<CR>

nnoremap <silent> <leader>tt :NvimTreeToggle<CR>
nnoremap <silent> <leader>tf :NvimTreeFindFile<CR>

" nvim-compe
" inoremap <silent><expr> <CR> compe#confirm("<CR>")
" inoremap <silent><expr> <Tab> v:lua.tab_complete('<CR>')<CR>
" inoremap <silent><expr> <S-Tab> v:lua.s_tab_complete('<CR>')<CR>
" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR> compe#confirm('<CR>')
" inoremap <silent><expr> <C-e> compe#close('<C-e>')
" inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })
" TODO add more git related remaps from other plugins here
nnoremap <expr> ]c <cmd>lua require("gitsigns").next_hunk()<CR>
nnoremap <expr> [c <cmd>lua require("gitsigns").prev_hunk()<CR>

" lsp
nnoremap <leader>l <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
" nnoremap <leader>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
" nnoremap <leader>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <leader>D <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap \d <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>m <cmd>lua vim.lsp.buf.formatting()<CR>
"tokyonight
" nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap \cs <cmd>lua require("_tokyonight").toggle()<CR>

"formatting
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0

" vim test
nnoremap <leader>t :TestFile<CR>

" Swap horizontally splits
noremap <C-w><S-h> :windo wincmd H<CR>
" Swap vertically splits
noremap <C-w><S-k> :windo wincmd K<CR>

"substitute the word under the cursor with
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
"search for word under the cursor with
nnoremap <Leader>d /<C-r><C-w>
