set nocompatible
set number
set shiftwidth=0
set tabstop=4
set softtabstop=-1
set autoindent
set copyindent
set cindent
set laststatus=2
set list
set listchars=tab:›─,trail:␣,extends:▶,precedes:◀
set cinkeys=0},0),0],o,O,!^F
set cino=g0,Ls,N-s,(0,u0,U1,Ws,m1,j1,J1,)50,#1,l1
set formatoptions+=j
set mouse=a
set nowrap
set colorcolumn=+1
set showcmd
set hlsearch
set nrformats=bin,hex,alpha
set updatetime=500
set timeoutlen=300
set ttimeoutlen=50
set foldmethod=marker
set history=200
set viminfo='100,s10,h,%
set statusline=%<%f\ %h%w%m%r\ 
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%=
set statusline+=%{exists('g:loaded_sleuth')?SleuthIndicator():''}
set statusline+=%-14.(%4l/%L,%c%V%)\ %P
set guioptions=ac
set wildmenu
set nojoinspaces
let g:c_no_curly_error=1

nnoremap K i<Cr><Esc>
nmap <Leader>o VaBJds{
nmap <Leader>b i{<Cr><Esc>o}<Esc>k^
nnoremap <silent> <Leader>S vip:<C-R>=exists(':RustFmtRange')==2?'RustFmtRange':'sort'<Cr><Cr>
vnoremap <silent> <Leader>S :<C-R>=exists(':RustFmtRange')==2?'RustFmtRange':'sort'<Cr><Cr>gv
nnoremap <Leader>n :NERDTreeToggle<Cr>
nnoremap <Leader>f :NERDTreeFind<Cr>
noremap <MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>
map <F1> <Esc>
map! <F1> <Esc>
nmap <F8> :terminal ++curwin<Cr>
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

syntax on
colorscheme custom
autocmd BufEnter,WinEnter * 2match IndentTab /^\t\+\( *\S\)\@=/

autocmd BufRead,BufNewFile Cargo.toml,*.rs compiler cargo

filetype off
call plug#begin('~/.vim/plugged')

let g:rust_recommended_style=0
let g:python_recommended_style=0

Plug 'junegunn/vim-plug'
Plug 'godlygeek/tabular'
Plug 'hallison/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/The-NERD-tree'
Plug 'tpope/vim-speeddating'
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
Plug 'cespare/vim-toml'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'leafgarland/typescript-vim'

Plug 'junegunn/fzf.vim'
nmap <C-p> :Files<CR>
imap <C-x><C-p> <plug>(fzf-complete-path)

if executable('rg')
	command! -bang -nargs=* Find call fzf#vim#grep(
		\'rg --smart-case --column --line-number --no-heading --follow --color "always" '.shellescape(<q-args>),
		\1, fzf#vim#with_preview('right:50%', '?'), <bang>0)
	nmap <C-K> :Find 
	set grepprg=rg\ --vimgrep
endif

if &term =~? "^rxvt-unicode"
	set ttymouse=urxvt
	set nottybuiltin
	set term=$TERM
	let &t_SI = "\<Esc>[6 q"
	let &t_SR = "\<Esc>[4 q"
	let &t_EI = "\<Esc>[2 q"
endif

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

if has('python3')

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
