set list listchars=tab:>—,trail:␣,extends:▶,precedes:◀
set nowrap ruler number showcmd laststatus=2 encoding=utf-8 cmdheight=1
set mouse=a
set keymodel=startsel
set clipboard+=unnamed
set autowrite

set tabstop=4 shiftwidth=4 autoindent smartindent copyindent

inoremap <CR> <CR>x<Backspace>
nnoremap o ox<Backspace>
hi Comment ctermfg=LightBlue
hi SpecialKey ctermfg=DarkGray
hi LineNr ctermfg=Brown ctermbg=DarkGray
hi NonText ctermfg=Yellow

au BufRead,BufNewFile *.stne set filetype=stne
au! syntax stne source $HOME/.vim/stne.vim


command W w
command Q q
cnoremap %% <C-R>=expand('%:h').'/'<cr>

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

" Enable clang completion if clang is found.
if filereadable("/usr/local/lib/libclang.so")
	Bundle 'Rip-Rip/clang_complete'
	let g:clang_library_path = "/usr/local/lib/"
	let g:clang_use_library = 1
endif

filetype plugin indent on

" Auto completion
set completeopt=menuone

