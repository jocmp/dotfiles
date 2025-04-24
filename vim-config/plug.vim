call plug#begin()

" Theme
Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }
Plug 'Mofiqul/vscode.nvim', { 'as' : 'vscode' }

" General
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'neovim/nvim-lspconfig'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'

Plug 'jparise/vim-graphql'

" Search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ruifm/gitlinker.nvim'

" Ruby
Plug 'thoughtbot/vim-rspec', {'for': 'ruby'}
Plug 'tpope/vim-endwise', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}

source ~/.config/nvim/local-plug.vim

call plug#end()
