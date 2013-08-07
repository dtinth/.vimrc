
" ctrl+s: save
map <c-s> :up<cr>
imap <c-s> <esc>:up<cr>

" easymotion
map <leader>a <leader><leader>F
map <leader>o <leader><leader>f

" custom commands
map <leader>r :call custom_command#run()<cr>
map <leader>s :call custom_command#set()<cr>

" ctrl+p
let g:ctrlp_map = '<leader>f'

" ctrl+v: paste from clipboard
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

" ctrl+c: esc
inoremap <C-c> <Esc>

" enter: clear highlight
" from garybernhardt / dotfiles
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

autocmd! CmdwinEnter * :unmap <cr>
autocmd! CmdwinLeave * :call MapCR()




