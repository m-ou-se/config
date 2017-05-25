set nocompatible
set number
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set copyindent
set cindent
set laststatus=2
set list
set listchars=tab:›—,trail:␣,extends:▶,precedes:◀
set cinkeys=0{,0},0),o,O,!^F
set cino=g0,Ls,N-s,(s,U1,m1,j1,J1,#1,l1
set mouse=a
set nowrap
set colorcolumn=+1
set showcmd
set hlsearch
set nrformats=octal,hex,alpha
set updatetime=500
set timeoutlen=300
set ttimeoutlen=50
set foldmethod=marker
set history=200
set viminfo='100,s10,h,%
set statusline=%<%f\ %h%w%m%r\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}%=%-14.(%4l/%L,%c%V%)\ %P
set guioptions=ac
set wildmenu
set nojoinspaces
let g:c_no_curly_error=1

nnoremap K i<Cr><Esc>
nmap <Leader>o VaBJds{
nmap <Leader>b i{<Cr><Esc>o}<Esc>k^
nnoremap <Leader>S vip:sort<Cr>
vnoremap <Leader>S :sort<Cr>gv
nnoremap <Leader>n :NERDTreeToggle<Cr>
nnoremap <Leader>f :NERDTreeFind<Cr>
noremap <MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>

syntax on
colorscheme custom
autocmd BufEnter,WinEnter * match IndentTab /^\t\+/

filetype off
call plug#begin('~/.vim/plugged')

let g:rust_recommended_style=0

Plug 'junegunn/vim-plug'
Plug 'godlygeek/tabular'
Plug 'hallison/vim-markdown'
Plug 'vim-scripts/surround.vim'
Plug 'vim-scripts/repeat.vim'
Plug 'vim-scripts/The-NERD-commenter'
Plug 'vim-scripts/The-NERD-tree'
Plug 'vim-scripts/speeddating.vim'
Plug 'vim-scripts/VisIncr'
Plug 'vim-scripts/vis'
Plug 'vim-scripts/Rename2'
Plug 'vim-scripts/JSON.vim'
Plug 'vim-scripts/glsl.vim'
Plug 'vim-scripts/django.vim'
Plug 'vim-scripts/jade.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'vim-scripts/openscad.vim'
Plug 'groenewege/vim-less'
Plug 'guns/xterm-color-table.vim'
Plug 'tpope/vim-fugitive'
Plug 'de-vri-es/vim-urscript'
Plug 'Shougo/vimproc.vim'
Plug 'lukerandall/haskellmode-vim'
Plug 'eagletmt/neco-ghc'
Plug 'vim-scripts/ShowMarks'
Plug 'rust-lang/rust.vim'

if &term =~? "^rxvt-unicode"
	set ttymouse=urxvt
	set nottybuiltin
	set term=$TERM
endif

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_extensions = ['mixed', 'line']
let g:ctrlp_cmd = 'CtrlPMixed'

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_keys = 'asghlqwertyuiopzxcvbnmdkfj'
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_prompt = '{n}/'
let g:EasyMotion_add_search_history = 0
let g:EasyMotion_verbose = 0
nmap s <Plug>(easymotion-s)
nmap S <Plug>(easymotion-sn)

Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
	\ ',': { 'pattern': ',', 'left_margin': 0, 'right_margin': 1 },
	\ '(': { 'pattern': '(', 'left_margin': 0, 'right_margin': 0 },
	\ ')': { 'pattern': ')', 'left_margin': 0, 'right_margin': 0 } }

let g:showmarks_enable=0
let g:haddock_browser='xdg-open'
let g:necoghc_enable_detailed_browse=1

if has('python')

	Plug 'vim-scripts/UltiSnips'
	let g:UltiSnipsSnippetDirectories=["ultisnips"]
	let g:UltiSnipsExpandTrigger="<c-space>"
	xnoremap <silent> <tab> :call UltiSnips#SaveLastVisualSelection()<cr>gvs
	let g:UltiSnipsJumpForwardTrigger="<tab>"
	let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

	if v:version > 703
		Plug 'Valloric/YouCompleteMe'
		nnoremap <Leader>k <Esc>:YcmCompleter GoToDefinitionElseDeclaration<Cr>
		nnoremap <Leader>i <Esc>:YcmCompleter FixIt<CR>:cclose<CR>
		let g:ycm_key_list_select_completion = ['<Down>']
		let g:ycm_key_list_previous_completion = ['<Up>']
		let g:ycm_allow_changing_updatetime=0
		set completeopt-=preview
		let g:ycm_add_preview_to_completeopt=0
		let g:ycm_global_ycm_extra_conf = '~/.vim/default_ycm_extra_conf.py'
		let g:ycm_semantic_triggers={'haskell' : ['.']}
	endif

endif

if filereadable($HOME . "/.vimrc.local")
	source ~/.vimrc.local
endif

call plug#end()

filetype plugin on
filetype indent on
