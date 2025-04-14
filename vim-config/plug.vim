call plug#begin()

" Theme
Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }
Plug 'Mofiqul/vscode.nvim', { 'as' : 'vscode' }

" General
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'telescope.nvim'

" Ruby
Plug 'thoughtbot/vim-rspec', {'for': 'ruby'}
Plug 'tpope/vim-endwise', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}

source ~/.vim-config/local-plug.vim

call plug#end()
