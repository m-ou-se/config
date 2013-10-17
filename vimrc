set autowrite
set nocompatible
set number
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set copyindent
set smartindent
set laststatus=2
set list
set listchars=tab:›—,trail:␣,extends:▶,precedes:◀
set cinkeys=0{,0},0),:,o,O
set cino=g0,Ls
set mouse=a
set nowrap
set showcmd
set hlsearch
set nrformats=octal,hex,alpha
set updatetime=500
set foldmethod=marker
set history=200
set viminfo='100,s10,h,%
let g:c_no_curly_error=1
nmap K i<Cr><Esc>k$
nmap <Leader>o VaBJds{
nmap <Leader>b i{<Cr><Esc>o}<Esc>k^
nmap <Leader>n :NERDTreeToggle<Cr>
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

colorscheme trusty

set guioptions=ac
nmap <Leader>k <Esc>:YcmCompleter GoToDefinitionElseDeclaration<Cr>
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'hallison/vim-markdown'
Bundle 'surround.vim'
Bundle 'repeat.vim'
Bundle 'The-NERD-tree'
Bundle 'speeddating.vim'
Bundle 'VisIncr'
Bundle 'vis'
Bundle 'ShowMarks'
Bundle 'UltiSnips'
Bundle 'Rename2'
Bundle 'JSON.vim'
Bundle 'glsl.vim'
Bundle 'django.vim'
Bundle 'bkad/CamelCaseMotion'
Bundle 'openscad.vim'
Bundle 'groenewege/vim-less'
if v:version > 703
	Bundle 'Valloric/YouCompleteMe'
endif
let g:vimwiki_camel_case=0
let g:netrw_dirhistmax=0
let g:showmarks_enable=0
let g:UltiSnipsSnippetDirectories=["ultisnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_allow_changing_updatetime=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
filetype plugin on
filetype indent on
syntax on
