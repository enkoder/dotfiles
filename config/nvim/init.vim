syntax on

" Needs to be called before any plugin logic
call plug#begin('~/.config/nvim/plugged')

" enables syntax goodness
syntax enable

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
Plug 'vitalk/vim-simple-todo'
Plug 'wikitopian/hardmode'
Plug 'craigemery/vim-autotag'
Plug 'jmcantrell/vim-virtualenv'
Plug 'terryma/vim-multiple-cursors'
Plug 'fatih/vim-go'

call plug#end()

" Mmmmm zenburn
set background=dark
colo zenburn

"===== Options =====
set number
set autoread " detect when a file is changed

" add specific filetype settings
if has("autocmd")
    filetype on
    autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd Filetype go setlocal ts=2 sts=2 sw=2 expandtab

    " YCM
    autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>

    " insert debug statement w/ Ctrl + Shift + b
    autocmd FileType python noremap <buffer> <silent> <C-B> <ESC>oimport pdb; pdb.set_trace()<esc>
    autocmd FileType go noremap <buffer> <silent> <C-B> <ESC>o_ = "breakpoint"<esc>

endif

" default tab settings
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" allows buffers to be edited and hidden
set hidden

" highlight searched objects
set hlsearch

" moves cursor to the object found in search
set incsearch

" number of commands to save in history
set history=1000

" search will ignore case and allow for use of *
set ignorecase
set smartcase

" Keeps X lines offset while scrolling the file
set scrolloff=2

" Use relative numbering on the side
set rnu

" also uses the X clipboard when yanking text
set clipboard+=unnamedplus

" sets the ctags location
set tags=./tags;

" By default split screens to the right
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99

"===== key bindings =====
" no more shift required
nnoremap ; :

" leader as space bar is dope
"let mapleader="\<Space>"
map  <Space> <leader>

" remove whitespace
nnoremap <silent> <leader>w :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" ctags jumping forward and backwards
noremap <C-l> <C-]>
noremap <BS> <C-t>

"===== Line movement =====
" Ctrl up/down will now move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

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
noremap <A-!> <ESC>:tabmove 0<CR>
noremap <A-@> <ESC>:tabmove 1<CR>
noremap <A-#> <ESC>:tabmove 2<CR>
noremap <A-$> <ESC>:tabmove 3<CR>
noremap <A-%> <ESC>:tabmove 4<CR>
noremap <A-^> <ESC>:tabmove 5<CR>
noremap <A-&> <ESC>:tabmove 6<CR>
noremap <A-*> <ESC>:tabmove 7<CR>
noremap <A-t> <ESC>:tabnew<CR>
noremap <A-w> <ESC>:tabclose<CR>

"===== Window movement =====
" Using Alt as the meta key
" Similar mapping to Awesome
:nnoremap <A-h> <C-w>h
:nnoremap <A-l> <C-w>l
:nnoremap <A-Tab> <C-w>w
:nnoremap  :vne<CR>
:nnoremap <A-q> <C-w>c
:nnoremap <A-r> <C-w>r
:nnoremap <A-L> <C-w>5>
:nnoremap <A-H> <C-w>5<
:nnoremap <A-J> <C-w>5+
:nnoremap <A-K> <C-w>5-

"===== Open commands =====
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

"===== plugin options =====
nnoremap <silent> <F2> :TagbarToggle<CR>

" ctrl-p let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>p :CtrlPTag<cr>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" airline
let g:airline_theme='tomorrow'
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#format = 1
let g:airline#extensions = ['branch', 'virtualenv', 'bufferline']

" syntastic
nnoremap <leader>s :SyntasticCheck<CR>
nnoremap <leader>n :lnext<CR>
nnoremap <leader>b :lprevious<CR>
let g:syntastic_c_check_header = 1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_pylint_exec = 'flake8'
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_python_exec = '/usr/bin/python3'

" auto indents files
filetype indent plugin on

" NERDTree
" open and close nerdtree
noremap <leader>t :NERDTreeToggle<CR>

" YCM choose
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'objc' : ['->', '.'],
            \   'cpp,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \ }

" vim-virtualenv
let g:virtualenv_directory=$WORKON_HOME
