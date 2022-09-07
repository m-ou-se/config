if !exists(":CocInfo")
  finish
endif

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Use CTRL-S CTRL-S for codeAction
nmap <silent> <C-s><C-s> <Plug>(coc-codeaction-cursor)
xmap <silent> <C-s><C-s> <Plug>(coc-codeaction-selected)

" Use CTRL-S d for codeLensAction
nmap <silent> <C-s>d <Plug>(coc-codelens-action)
nmap <silent> <C-s><C-d> <Plug>(coc-codelens-action)

" Use CTRL-S n for rename
nmap <C-s>n <Plug>(coc-rename)
nmap <C-s><C-n> <Plug>(coc-rename)

" Use CTRL-S f for format
nmap <C-s>f <Plug>(coc-format)
nmap <C-s><C-f> <Plug>(coc-format)
xmap <C-s>f <Plug>(coc-format-selected)
xmap <C-s><C-f> <Plug>(coc-format-selected)

" Use CTRL-S x for fix
nmap <C-s>x <Plug>(coc-fix-current)
nmap <C-s><C-x> <Plug>(coc-fix-current)

" Use CTRL-S r for refactor
nmap <C-s>r <Plug>(coc-refactor)
nmap <C-s><C-r> <Plug>(coc-refactor)

" `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Show all diagnostics.
nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>

" Find symbol of current document.
nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent><nowait> <space>s :<C-u>CocList -I symbols<cr>

" Rust
nmap <leader>re :CocCommand rust-analyzer.expandMacro<cr>
nmap <leader>rj :CocCommand rust-analyzer.joinLines<cr>
nmap <leader>rp :CocCommand rust-analyzer.parentModule<cr>
nmap <leader>rr :CocCommand rust-analyzer.run<cr>
nmap <leader>rt :CocCommand rust-analyzer.runSingle<cr>
nmap <leader>rs :CocCommand rust-analyzer.ssr<cr>
nmap <silent> <A-up> :CocCommand rust-analyzer.moveItemUp<cr>
nmap <silent> <A-down> :CocCommand rust-analyzer.moveItemDown<cr>
nmap <silent> <A-k> :CocCommand rust-analyzer.moveItemUp<cr>
nmap <silent> <A-j> :CocCommand rust-analyzer.moveItemDown<cr>
