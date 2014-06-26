
" space is the leader
let mapleader = " "

" ctrl+s: save
map <c-s> :up<cr>
imap <c-s> <esc>:up<cr>

" easymotion
map <leader>a <leader><leader>F
map <leader>o <leader><leader>f
map <leader>y <leader><leader>w
map <leader>; <leader><leader>e
map <leader>w <leader><leader>ge
map <leader>q <leader><leader>b

" custom commands
map <leader>r :call custom_command#run()<cr>
map <leader>S :call custom_command#set()<cr>!
map <esc>r <leader>r
imap <esc>r <c-o><leader>r
" map <leader>i :!curl http://localhost:10101/codejom/copy -d _=_<cr><cr>
" map <leader>s :call custom_command#set()<cr>!
" map <leader>S :call custom_command#set()<cr>
map <leader>n :call custom_command#set()<cr>!node %
map <leader>b :call custom_command#set()<cr>!ruby %

" reveal in finder
map <leader>e :Reveal<cr>

" inspect syntax
" map <leader>i :echo synIDattr(synID(line("."), col("."), 1), "name")<cr>

" ctrl+p
let g:ctrlp_map = '<leader>f'

" ctrl+v: paste from clipboard
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

" ctrl+c: esc
inoremap <C-c> <Esc>
inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>

" enter: clear highlight
" from garybernhardt / dotfiles
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

autocmd! CmdwinEnter * :unmap <cr>
autocmd! CmdwinLeave * :call MapCR()


" enable streak
let g:sneak#streak = 1


