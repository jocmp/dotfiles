" Theme
color gruvbox
set background=light

" NERDTree:
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowHidden = 1
let NERDTreeHijackNetrw = 1

" RubyAndRails:
" Highlight ruby operators
let ruby_operators = 1

" NERDCommenter:
let NERDDefaultNesting = 0
let NERDRemoveExtraSpaces = 1
let NERDSpaceDelims = 1

" FZF
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" Let ack/vim use ag for search
let g:ackprg = 'ag --nogroup --nocolor --column'

" GO
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:deoplete#enable_at_startup = 1

set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview

" Ale + TS
au FileType typescript nmap <C-]> :ALEGoToDefinition<CR>
au FileType typescript.tsx nmap <C-]> :ALEGoToDefinition<CR>

" Ale
au FileType typescript let g:ale_completion_enabled = 1 " Ale autocomplete (just TS)
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight ALEError ctermbg=none cterm=none
highlight ALEWarning ctermbg=none cterm=none
