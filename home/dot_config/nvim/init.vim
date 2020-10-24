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
Plug 'benmills/vimux'
Plug 'tpope/vim-unimpaired'
Plug 'idris-hackers/idris-vim'
Plug 'lambdalisue/suda.vim'
Plug 'mcchrish/nnn.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

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
