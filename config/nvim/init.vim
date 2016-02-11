syntax on

call plug#begin('~/.config/nvim/plugged')

syntax enable
set background=dark

"===== Plugins =====
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'ntpeters/vim-better-whitespace'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-misc'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'blueshirts/darcula'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'Valloric/YouCompleteMe'
Plug 'powerline/fonts'
Plug 'mhinz/vim-startify'
Plug 'vitalk/vim-simple-todo'
Plug 'wikitopian/hardmode'

call plug#end()
colo zenburn
" colo darcula
" colo solarized

"===== Options =====
set number
set autoread " detect when a file is changed
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set hlsearch
set incsearch
set history=1000
set ignorecase
set smartcase
set scrolloff=2
set cpoptions+=$
set rnu
set clipboard+=unnamedplus
set tags=./tags;

"===== key bindings =====
" no more shift required
nnoremap ; :

" leader as space bar is dope
"let mapleader="\<Space>"
map  <Space> <leader>

" remove whitespace
noremap <leader>w :%s/\s\+$//e<CR>

" ctags jumping forward and backwards
noremap <A-l> <C-]>
noremap <A-h> :po<CR>

" insert pdb statement
map <silent> <C-B> <ESC>oimport pdb; pdb.set_trace()<esc>

" alt up/down will now move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"======= TABS =========
noremap <A-1> <ESC>:tabn 1<CR>
noremap <A-2> <ESC>:tabn 2<CR>
noremap <A-3> <ESC>:tabn 3<CR>
noremap <A-4> <ESC>:tabn 4<CR>
noremap <A-5> <ESC>:tabn 5<CR>
noremap <A-6> <ESC>:tabn 6<CR>
noremap <A-7> <ESC>:tabn 7<CR>
noremap <A-8> <ESC>:tabn 8<CR>
noremap <A-9> <ESC>:tablast<CR>
noremap <C-t> <ESC>:tabnew<CR>

"===== plugin options =====
" startify
let g:startify_session_dir = '~/.nvim-session'
let g:startify_files_number = 10

" bookmarks for often used  files
let g:startify_bookmarks = [ {'v': '~/.config/nvim/init.vim'}, {'z': '~/.zshrc'}, {'t': '~/Todo.txt'}]
let g:startify_list_order = [
   \ ['Sessions'],
   \ 'sessions',
   \ ['Most Recent Files'],
   \ 'files',
   \ ['Most Recent Dirs'],
   \ 'dir',
   \ ['Bookmarks'],
   \ 'bookmarks',
   \ ]

autocmd VimEnter *
   \   if !argc()
   \ |   Startify
   \ |   NERDTree
   \ |   wincmd w
   \ | endif

nnoremap <silent> <F2> :TagbarToggle<CR>

" ctrl-p let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>p :CtrlPTag<cr>
let g:ctrlp_working_path_mode = 'ra'

" airline
let g:airline_theme='zenburn'
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" syntastic
nnoremap <leader>s :SyntasticCheck<CR>
nnoremap <leader>n :lnext<CR>
nnoremap <leader>b :lprevious<CR>
nnoremap <leader>e :Errors<CR>
let g:syntastic_c_check_header = 1
let g:syntastic_python_checkers=['pylint']
let g:syntastic_python_pylint_exec = 'pylint'
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" auto indents files
filetype indent plugin on

" NERDTree
" open and close nerdtree
noremap <leader>t :NERDTreeToggle<CR>

" YCM choose
autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>


