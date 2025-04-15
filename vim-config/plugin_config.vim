" Theme
color vscode
set background=light

" NERDTree:
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowHidden = 1
let NERDTreeHijackNetrw = 1

" NERDCommenter:
let NERDDefaultNesting = 0
let NERDRemoveExtraSpaces = 1
let NERDSpaceDelims = 1

set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview

" neovim/nvim-lspconfig
lua << EOF
local lspconfig = require('lspconfig')
lspconfig.ruby_lsp.setup({
  init_options = {
    formatter = 'rubocop',
    linters = { 'rubocop' },
    ["Ruby LSP Rails"] = {
      enablePendingMigrationsPrompt = false,
    },
  },
})
EOF

" https://github.com/ruifm/gitlinker.nvim <leader>gy
lua << EOF
  require"gitlinker".setup()
EOF

