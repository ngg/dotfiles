" Hostname for host specific configuration
let s:hostname = substitute(system('hostname'), '\n', '', '')

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tomtom/tcomment_vim'
Plug 'gregsexton/gitv'
Plug 'Shougo/neomru.vim'
Plug 'dkprice/vim-easygrep'
Plug 'altercation/vim-colors-solarized'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --clangd-completer --cs-completer --rust-completer --system-boost --system-libclang --ninja', 'for': ['c', 'cpp', 'cs', 'python', 'objc', 'objcpp', 'rust']}
Plug 'mbbill/undotree'
Plug 'derekwyatt/vim-fswitch'
Plug 'kris89/vim-multiple-cursors'
" Plug 'SirVer/ultisnips'
Plug 'wikitopian/hardmode'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Chiel92/vim-autoformat'
Plug 'Valloric/ListToggle'
Plug 'uarun/vim-protobuf'
Plug 'ngg/vim-gn'
Plug 'rust-lang/rust.vim'
Plug 'airblade/vim-gitgutter'
Plug 'qwertologe/nextval.vim'
Plug 'elzr/vim-json'
Plug 'Yggdroot/indentLine'
Plug 'PProvost/vim-ps1'
Plug 'lyuts/vim-rtags'
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
if (s:hostname =~ "bp1-dsklin")
	Plug 'git@bitbucket.org:tresorit/vimtresorit.git'
endif
call plug#end()

set nomodeline
set history=1000
set undolevels=1000
set so=7
set hid
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set ttyfast
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set number

set t_Co=256
set mouse=a

set tabstop=4
set softtabstop=0
set noexpandtab
set shiftwidth=4

set smarttab
set autoindent
set smartindent
set pastetoggle=<F3>

set cursorline
set wildmenu
set title

set diffopt+=vertical
set exrc
set secure

set nobackup
set writebackup
set noswapfile

set pyxversion=3

scriptencoding utf-8
set encoding=utf-8

" Refresh modified files
set autoread
set updatetime=1000
autocmd CursorHold,CursorHoldI,WinEnter,BufWinEnter * silent! checktime

" Share X windows clipboard
if has('unnamedplus')
	set clipboard=unnamedplus
endif

" Override gentoo vimrc
let g:leave_my_textwidth_alone = 1

" Save as root
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

" fzf
let g:fzf_command_prefix = 'Fzf'
nnoremap <silent> <leader>;f :FzfFiles<cr>
nnoremap <silent> <leader>;F :FzfHistory<cr>
nnoremap <silent> <leader>;g :FzfGFiles<cr>
nnoremap <silent> <leader>;G :FzfGFiles?<cr>
nnoremap <silent> <leader>;b :FzfBuffers<cr>
nnoremap <silent> <leader>;t :FzfBTags<cr>
nnoremap <silent> <leader>;T :FzfTags<cr>
nnoremap <silent> <leader>;<leader> :FzfAg<cr>
nmap <silent> <C-p> <leader>;f
nmap <silent> <C-t> <leader>;t"

" gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 5000
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hr <Plug>(GitGutterRevertHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)

" nextval
nmap <silent> + <Plug>nextvalInc
nmap <silent> - <Plug>nextvalDec

" EasyGrep
let g:EasyGrepCommand=1
nnoremap <leader>/ :Grep<space>

" UltiSnip
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" VimTresorit
noremap <silent> <F3> :Autoformat<CR>
noremap <silent> <leader>ff :Autoformat<CR>
noremap <silent> <leader>ft :ToggleAutoFormatCode<CR>
nnoremap <silent> <leader>mc :ToggleMakeCompiler<CR>
nnoremap <silent> <leader>md :ToggleMakeDebug<CR>
nnoremap <silent> <leader>mt :ToggleMakeTests<CR>
nnoremap <silent> <leader>mi :PrintMakeInformation<CR>
nnoremap <leader>bc :CreateOutDir<space>
nnoremap <silent> <leader>be :Gn args<CR>
nnoremap <silent> <leader>bo :GnOut<CR>
nnoremap <silent> <leader>bt :GnTarget<CR>
nnoremap <silent> <leader>bf :exec ":Make -j5 " . g:GetBuildFileParams(@%)<CR>
nnoremap <silent> <leader>bp :exec ":Make! -j5 " . g:GetBuildProjectParams(@%)<CR>
nnoremap <silent> <leader>bpk :exec ":Make! -j5 -k0 " . g:GetBuildProjectParams(@%)<CR>
nnoremap <silent> <leader>ba :exec ":Make! -j5 " . g:GetBuildAllParams(@%)<CR>
nnoremap <silent> <leader>bak :exec ":Make! -j5 -k0 " . g:GetBuildAllParams(@%)<CR>

" good for airline
set laststatus=2
set noshowmode
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline_powerline_fonts=1

" EasyMotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
omap t <Plug>(easymotion-t)
omap / <Plug>(easymotion-tn)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
"map / <Plug>(easymotion-sn)
"map n <Plug>(easymotion-next)
"map N <Plug>(easymotion-prev)

" YCM
let g:ycm_extra_conf_globlist = ['~/git/*', '~/.vim/ycm_extra_conf.py', '/mnt/data/ngg/*', '!~/*']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_error_symbol = 'E>'
let g:ycm_warning_symbol = 'W>'
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_rust_src_path = '/home/ngglocal/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:ycm_use_clangd = 1
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")
nnoremap <silent> <leader>g :YcmCompleter GoTo<CR>

" ListToggle
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 15

" indentLine
let g:indentLine_color_term = 0

" Better regex syntax
nnoremap / /\v
vnoremap / /\v
cnoremap s/ s/\v

" Faster Escape
inoremap jj <ESC>

" In normal mode, we use : much more often than ; so lets swap them.
" WARNING: this will cause any "ordinary" map command without the "nore" prefix
" that uses ":" to fail. For instance, "map <f2> :w" would fail, since vim will
" read ":w" as ";w" because of the below remappings. Use "noremap"s in such
" situations and you'll be fine.
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Re-adjust windows on window resize
autocmd VimResized * wincmd =

" Search and Replace
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ --hidden
    set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif

" C++ shortcuts
nmap <silent> <leader>sm ysiw)istd::move<Esc>

syntax enable
let g:load_doxygen_syntax = 1

set background=dark
let g:solarized_termcolors = 16
let g:solarized_termtrans = 1
colorscheme solarized

noremap <silent> <F1> :bp<CR>
inoremap <silent> <F1> <Esc>:bp<CR>
noremap <silent> <F2> :bn<CR>
inoremap <silent> <F2> <Esc>:bn<CR>
noremap <silent> <F4> :FSHere<CR>
inoremap <silent> <F4> <Esc>:FSHere<CR>
noremap <silent> <leader>u :UndotreeToggle<CR>
nnoremap <silent> <space> :noh<CR><space>
nnoremap <silent> <leader>gv :Gitv --date-order<CR>
nnoremap <silent> <leader>gV :Gitv! --date-order<CR>

" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
autocmd FileType c,cpp,objc,objcpp,rust setlocal comments-=:// comments+=f://

set undodir=~/.vim/undohistory
set undofile

set backspace=2
