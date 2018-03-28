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

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'idris-hackers/idris-vim'

call plug#end()

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

set background=dark

" These are the basic settings to get the font to work (required):
set guifont=Nerd\ Font\ Complete
set encoding=utf-8

let g:airline_powerline_fonts=1
let g:rainbow_active = 1 

nmap ,, :NERDTreeFind<CR>
   
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'scala': ['coursier', 'launch', 'lt.dvim.sssio:sssio_2.12:bb0365cf'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls']
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>