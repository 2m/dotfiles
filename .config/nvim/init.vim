call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'codeindulgence/vim-tig'

Plug 'derekwyatt/vim-scala'
Plug 'autozimu/LanguageClient-neovim', {'tag': 'binary-*-x86_64-unknown-linux-musl'}

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

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'idris-hackers/idris-vim'

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
   
let g:LanguageClient_autoStart = 0
let g:LanguageClient_serverCommands = {
    \ 'scala': ['coursier', 'launch', 'org.scalameta:metals_2.12:0.1.0-M1+131-42765d7e', '-M', 'scala.meta.metals.Main'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls']
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

" For vial-http
set hidden
filetype plugin on

au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au WinEnter,BufWinEnter __vial_* let w:airline_disabled=1
