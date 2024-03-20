" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'NLKNguyen/papercolor-theme'
Plug 'tribela/vim-transparent'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-surround'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ervandew/supertab',
Plug 'folke/which-key.nvim',

" Plug 'ehamberg/vim-cute-python'
" Plug 'LawrencePeng/vim-cute-cpp'

Plug 'wfxr/minimap.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

colorscheme catppuccin-latte
let g:airline_theme = 'catppuccin'

set number numberwidth=4
set relativenumber

set title
set ruler
set autoindent
set cursorline
set showmatch
set list listchars=tab:»\ ,trail:·
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab

set ignorecase
set smartcase

let g:airline_powerline_fonts = 1 "airline

let g:minimap_width = 10 "minimap
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

" nnoremap <SPACE> <Nop>
let mapleader=" "

nmap <leader>n :NERDTreeToggle<CR>

lua require('init')

