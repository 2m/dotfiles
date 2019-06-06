call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'codeindulgence/vim-tig'
Plug 'derekwyatt/vim-scala'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'eugen0329/vim-esearch'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'urbainvaes/vim-remembrall'
Plug 'baverman/vial'
Plug 'baverman/vial-http'
Plug 'benmills/vimux'
Plug 'tpope/vim-unimpaired'
Plug 'idris-hackers/idris-vim'
Plug 'lambdalisue/suda.vim'
Plug 'mcchrish/nnn.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

call plug#end()

let g:ctrlp_user_command = ['.git', 'cd %s; and git ls-files -co --exclude-standard']

let g:esearch = {
  \ 'adapter':          'ag',
  \ 'backend':          'nvim',
  \ 'out':              'win',
  \ 'batch_size':       1000,
  \ 'use':              ['visual', 'hlsearch', 'last'],
  \ 'default_mappings': 1,
  \}
let g:esearch#out#win#open = 'enew'

set background=dark

" These are the basic settings to get the font to work (required):
set guifont=Nerd\ Font\ Complete
set encoding=utf-8

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

let g:rainbow_active = 1 

nmap <C-w> :bd<CR>

" jsonc comments highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" for coc
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Some server have issues with backup files, see #649
set nobackup
set nowritebackup
" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" For vial-http
set hidden
filetype plugin on

au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au WinEnter,BufWinEnter __vial_* let w:airline_disabled=1

" for vimdiff
nnoremap <silent> <leader>dp V:diffput<cr>
nnoremap <silent> <leader>dg V:diffget<cr>
nnoremap <silent> <leader>df :call DiffToggle()<CR>
nmap <silent> <leader>du :wincmd w<cr>:normal u<cr>:wincmd w<cr>

" workaround for wayland screen flickering when browsing directory
let g:clipboard = {
  \   'name': 'myClipboard',
  \   'copy': {
  \      '+': 'tmux load-buffer -',
  \      '*': 'tmux load-buffer -',
  \    },
  \   'paste': {
  \      '+': 'tmux save-buffer -',
  \      '*': 'tmux save-buffer -',
  \   },
  \   'cache_enabled': 1,
  \ }
