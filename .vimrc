set nocompatible
filetype off

" Hostname for host specific configuration
let s:hostname = substitute(system('hostname'), '\n', '', '')

let g:vundle_default_git_proto='git'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-unimpaired'
Plugin 'tomtom/tcomment_vim'
Plugin 'gregsexton/gitv'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'dkprice/vim-easygrep'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mbbill/undotree'
Plugin 'Kris2k/A.vim'
Plugin 'kris89/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'wikitopian/hardmode'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Valloric/ListToggle'
Plugin 'ngg/vim-protobuf'
Plugin 'ngg/vim-gn'
Plugin 'rust-lang/rust.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'qwertologe/nextval.vim'
Plugin 'elzr/vim-json'
Plugin 'Yggdroot/indentLine'
if (s:hostname =~ "bp1-dsklin")
	Plugin 'git@bitbucket.org:tresorit/vimtresorit.git'
endif
call vundle#end()
filetype plugin indent on

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

" Unite
let g:unite_prompt='» '
let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_max_candidates = 1000
if executable('ag')
	let g:unite_source_grep_command = 'ag'
	let g:unite_source_grep_default_opts = '--line-numbers --nocolor --nogroup --hidden'
	let g:unite_source_grep_recursive_opt = ''
	let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
endif
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <silent> <C-p> :Unite -start-insert -no-split -buffer-name=file_rec file_rec/async<cr>
nnoremap <silent> <C-t> :Unite -start-insert -no-split -buffer-name=outline -auto-preview outline<cr>
nnoremap <silent> <leader>p :Unite -no-split -buffer-name=mru -auto-preview -quick-match file_mru<cr>
nnoremap <silent> <leader>y :Unite -buffer-name=yank -quick-match history/yank<cr>
nnoremap <silent> <leader>b :Unite -buffer-name=buffer -quick-match buffer<cr>

" gitgutter
let g:gitgutter_map_keys = 0
let g:gitgutter_max_signs = 5000
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nmap <leader>hs <Plug>GitGutterStageHunk
nmap <leader>hr <Plug>GitGutterRevertHunk
nmap <leader>hp <Plug>GitGutterPreviewHunk

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
nnoremap <silent> <leader>be :EditCurrentOutDir<CR>
nnoremap <silent> <leader>bo :Unite -start-insert -no-split gn_out<CR>
nnoremap <silent> <leader>bt :Unite -start-insert -no-split gn_target<CR>
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
let g:airline#extensions#tabline#show_tabs = 1
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
let g:ycm_extra_conf_globlist = ['~/git/*', '~/.vim/ycm_extra_conf.py', '!~/*']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_error_symbol = 'E>'
let g:ycm_warning_symbol = 'W>'
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
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
if executable('ag')
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
noremap <silent> <F4> :A<CR>
inoremap <silent> <F4> <Esc>:A<CR>
noremap <silent> <leader>u :UndotreeToggle<CR>
nnoremap <silent> <space> :noh<CR><space>
nnoremap <silent> <leader>gv :Gitv --date-order<CR>
nnoremap <silent> <leader>gV :Gitv! --date-order<CR>

" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
autocmd FileType c,cpp,objc,objcpp setlocal comments-=:// comments+=f://

set undodir=~/.vim/undohistory
set undofile

set backspace=2
