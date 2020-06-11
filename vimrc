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
set updatetime=100
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
set undofile
set guioptions=ac
set wildmenu
set nojoinspaces
let g:c_no_curly_error=1

nnoremap K i<Cr><Esc>
nmap <Leader>o VaBJds{
nmap <Leader>b i{<Cr><Esc>o}<Esc>k^
nnoremap <silent> <Leader>S vip:sort<Cr>
vnoremap <silent> <Leader>S :sort<Cr>gv
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
autocmd! BufRead,BufNewFile *.md set filetype=markdown.pandoc

let g:pandoc#syntax#conceal#use=0
let g:pandoc#syntax#codeblocks#embeds#langs = ["cpp", "sh", "rust"]

let g:rust_recommended_style=0
let g:python_recommended_style=0

let g:plug_extra = []
command -nargs=1 Plug call add(g:plug_extra, <args>)

function! PackInit() abort
	packadd minpac
	call minpac#init()
	call minpac#add('Shougo/vimproc.vim')
	call minpac#add('Valloric/YouCompleteMe')
	call minpac#add('airblade/vim-gitgutter')
	call minpac#add('bkad/CamelCaseMotion')
	call minpac#add('easymotion/vim-easymotion')
	call minpac#add('godlygeek/tabular')
	call minpac#add('groenewege/vim-less')
	call minpac#add('haya14busa/incsearch.vim')
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('junegunn/vim-easy-align')
	call minpac#add('terryma/vim-multiple-cursors')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('tpope/vim-fugitive')
	call minpac#add('tpope/vim-repeat')
	call minpac#add('tpope/vim-sleuth')
	call minpac#add('tpope/vim-speeddating')
	call minpac#add('tpope/vim-surround')
	call minpac#add('vim-scripts/Rename2')
	call minpac#add('vim-scripts/ShowMarks')
	call minpac#add('vim-scripts/The-NERD-tree')
	call minpac#add('vim-scripts/UltiSnips')
	call minpac#add('vim-scripts/VisIncr')
	call minpac#add('vim-scripts/vis')
	" File type / language support:
	call minpac#add('vim-scripts/JSON.vim')
	call minpac#add('vim-scripts/django.vim')
	call minpac#add('vim-scripts/glsl.vim')
	call minpac#add('vim-scripts/jade.vim')
	call minpac#add('vim-scripts/openscad.vim')
	call minpac#add('vim-pandoc/vim-pandoc-syntax')
	call minpac#add('cespare/vim-toml')
	call minpac#add('de-vri-es/vim-urscript')
	call minpac#add('eagletmt/neco-ghc')
	call minpac#add('guns/xterm-color-table.vim')
	call minpac#add('leafgarland/typescript-vim')
	call minpac#add('lukerandall/haskellmode-vim')
	call minpac#add('rust-lang/rust.vim')
	" Plugins added by :Plug
	for i in g:plug_extra
		call minpac#add(i)
	endfor
endfunction

command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

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

let g:gitgutter_sign_priority=0
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_removed_first_line='-↑'
let g:gitgutter_sign_modified='*'
let g:gitgutter_sign_modified_removed='*-'

let g:EasyMotion_keys = 'asghlqwertyuiopzxcvbnmdkfj'
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_prompt = '{n}/'
let g:EasyMotion_add_search_history = 0
let g:EasyMotion_verbose = 0
nmap s <Plug>(easymotion-s)
nmap S <Plug>(easymotion-sn)

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
	\ ',': { 'pattern': ',', 'left_margin': 0, 'right_margin': 1 },
	\ '(': { 'pattern': '(', 'left_margin': 0, 'right_margin': 0 },
	\ ')': { 'pattern': ')', 'left_margin': 0, 'right_margin': 0 } }

let g:showmarks_enable=0
let g:haddock_browser='xdg-open'
let g:necoghc_enable_detailed_browse=1

let g:UltiSnipsSnippetDirectories=["ultisnips"]
let g:UltiSnipsExpandTrigger="<c-space>"
xnoremap <silent> <tab> :call UltiSnips#SaveLastVisualSelection()<cr>gvs
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

nnoremap <Leader>k <Esc>:YcmCompleter GoToDefinitionElseDeclaration<Cr>
nnoremap <Leader>i <Esc>:YcmCompleter FixIt<CR>:cclose<CR>
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_allow_changing_updatetime=0
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
let g:ycm_global_ycm_extra_conf = '~/.vim/default_ycm_extra_conf.py'
let g:ycm_semantic_triggers={'haskell' : ['.']}

if filereadable($HOME . "/.vimrc.local")
	source ~/.vimrc.local
endif

filetype plugin on
filetype indent on
