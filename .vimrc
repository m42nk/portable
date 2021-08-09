"
" minimal vimrc with no (extra) plugins
"
" https://github.com/lemonase/dotfiles/raw/master/files/vim/.vim/vimrc.min
" modified by github.com/m42nk

"load system defaults
if filereadable(expand('$VIMRUNTIME/defaults.vim'))
	unlet! g:skip_defaults_vim
	source $VIMRUNTIME/defaults.vim
endif

" ui
set number
set relativenumber
set ruler
set wildmenu
set showcmd
set showmatch
set scrolloff=3

" encoding/format
set encoding=utf-8
set fileformats=unix,dos,mac

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" indent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent

" key timeout values
set esckeys
set ttimeoutlen=20
set timeoutlen=1000

" allow syntax and filetype plugins
syntax enable
filetype plugin indent on
runtime macros/matchit.vim

" folding
set foldmethod=indent
set nofoldenable
set foldnestmax=10
set foldlevel=2

" mappings
inoremap jk <c-c>
nnoremap <Space>w :w<cr>
nnoremap <Space>h :nohlsearch<cr>
nnoremap <esc><esc> :nohlsearch<cr>

" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" use system clipboard
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" autocmds
augroup general
    autocmd!
    "keep equal proportions when windows resized
    autocmd VimResized * wincmd =
    "save cursor position in a file
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"")
                \ <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup languages
    autocmd!
    autocmd BufNewFile,BufRead *.bash set syntax=sh
    autocmd FileType python xnoremap <leader>r <esc>:'<,'>:w !python3<CR>
    autocmd FileType go set noexpandtab
    autocmd FileType html :syntax sync fromstart
    autocmd FileType html,javascript,css,json,yaml,sh
                \ setlocal ts=2 sts=2 sw=2 expandtab
augroup END

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" let &t_SI = "\<Esc>]12;orange\x7"
" let &t_EI = "\<Esc>]12;red\x7"
" autocmd VimLeave * silent !echo -ne "\033]112\007"
