set list listchars=tab:>—,trail:␣,extends:▶,precedes:◀
set nowrap ruler number showcmd laststatus=2 encoding=utf-8 cmdheight=1
set mouse=a
set keymodel=startsel
set clipboard+=unnamed
set autowrite
set hlsearch

set tabstop=4 shiftwidth=4 autoindent smartindent copyindent

hi Comment ctermfg=LightBlue
hi SpecialKey ctermfg=DarkGray
hi LineNr ctermfg=Brown ctermbg=DarkGray
hi NonText ctermfg=Yellow
hi Search ctermbg=LightBlue ctermfg=White

cnoremap %% <C-R>=expand('%:h').'/'<cr>
nnoremap o ox<Backspace>
inoremap <CR> <CR>x<Backspace>

" Auto completion
set completeopt=menuone

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'mutewinter/vim-indent-guides'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-speeddating'
Bundle 'godlygeek/tabular'
Bundle 'snipMate'

" Enable clang completion if clang is found.
"if filereadable("/usr/local/lib/libclang.so")
"	Bundle 'Rip-Rip/clang_complete'
"	let g:clang_library_path = "/usr/local/lib/"
"	let g:clang_use_library = 1
"endif

filetype plugin indent on

