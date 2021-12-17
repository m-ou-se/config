set nocompatible
set number
set shiftwidth=0
set tabstop=4
set softtabstop=-1
set autoindent
set cindent
set copyindent
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
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
imap <C-D> <C-r>=strftime('%F')<Cr>
imap <C-T> <C-r>=strftime('%T')<Cr>
nnoremap <C-j> i<Cr><Esc>==

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

" Custom mappings for vim-visual-multi to be more like vim-multiple-cursors.
let g:VM_maps = {}
let g:VM_maps['Skip Region'] = '<C-x>'
let g:VM_maps['Remove Last Region'] = '<C-p>'

function! PackInit() abort
	packadd minpac
	call minpac#init()
	call minpac#add('PeterRincker/vim-argumentative')
	call minpac#add('Shougo/vimproc.vim')
	call minpac#add('airblade/vim-gitgutter')
	call minpac#add('bkad/CamelCaseMotion')
	call minpac#add('easymotion/vim-easymotion')
	call minpac#add('godlygeek/tabular')
	call minpac#add('groenewege/vim-less')
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('junegunn/vim-easy-align')
	call minpac#add('morhetz/gruvbox')
	call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
	call minpac#add('mg979/vim-visual-multi')
	call minpac#add('tpope/vim-commentary')
	call minpac#add('tpope/vim-fugitive')
	call minpac#add('tpope/vim-repeat')
	call minpac#add('tpope/vim-sleuth')
	call minpac#add('tpope/vim-speeddating')
	call minpac#add('tpope/vim-surround')
	call minpac#add('vim-scripts/Rename2')
	call minpac#add('vim-scripts/The-NERD-tree')
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

command! -bar PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! -bar PackClean  call PackInit() | call minpac#clean()
command! -bar PackStatus call PackInit() | call minpac#status()

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

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
	\ ',': { 'pattern': ',', 'left_margin': 0, 'right_margin': 1 },
	\ '(': { 'pattern': '(', 'left_margin': 0, 'right_margin': 0 },
	\ ')': { 'pattern': ')', 'left_margin': 0, 'right_margin': 0 } }

let g:haddock_browser='xdg-open'
let g:necoghc_enable_detailed_browse=1

if filereadable($HOME . "/.vimrc.local")
	source ~/.vimrc.local
endif

filetype plugin on
filetype indent on
