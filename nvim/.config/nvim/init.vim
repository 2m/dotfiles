call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'codeindulgence/vim-tig'
Plug 'derekwyatt/vim-scala'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
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
Plug 'w0rp/ale'
Plug 'idris-hackers/idris-vim'
Plug 'lambdalisue/suda.vim'

call plug#end()

let g:ctrlp_user_command = ['.git', 'cd %s; and git ls-files -co --exclude-standard']

let g:esearch#out#win#open = 'enew'

set background=dark

" These are the basic settings to get the font to work (required):
set guifont=Nerd\ Font\ Complete
set encoding=utf-8

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

let g:rainbow_active = 1 

nmap ,, :NERDTreeFind<CR>
nmap <C-w> :bd<CR>
   
let g:ale_linters = {'rust': ['rls', 'cargo'], 'scala': ['sbtserver']}
let g:ale_fixers = {'rust': ['rustfmt'], 'scala': ['scalafmt']}
let g:ale_completion_enabled = 1
let g:ale_rust_rls_toolchain = 'nightly'
let g:ale_rust_cargo_check_all_targets = 1
let g:ale_sign_column_always = 1
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '☓'
let g:ale_set_highlights = 0

nmap <silent> <S-F2> <Plug>(ale_previous_wrap)
nmap <silent> <F2> <Plug>(ale_next_wrap)
nmap <C-q> :ALEHover<CR>
noremap gd :ALEGoToDefinition<CR>

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
