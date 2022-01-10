call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"" 
"" Plugin configurations
"" 
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

syntax enable
set expandtab
set number
set showcmd
set wildmenu
set showmatch
set hlsearch
set incsearch
set foldenable