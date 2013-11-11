
" chord files for vim-arpeggio

function! Chords#setup()
  Arpeggio inoremap fun function
  Arpeggio inoremap FUN Function
  Arpeggio inoremap end end
  Arpeggio inoremap the the
  Arpeggio inoremap def def
  Arpeggio inoremap amd define(function(require) {<CR>})<Esc>O<Tab>
  Arpeggio inoremap des return function(desire) {<Cr>}<Esc>O<Tab>
  Arpeggio inoremap cla class
  Arpeggio inoremap {} {<CR>}<Esc>O<Tab>
  Arpeggio inoremap () ()<Left>
  Arpeggio inoremap con console.log
  Arpeggio inoremap doe do<CR>end<Esc>O<Tab>
  Arpeggio inoremap thi this
  Arpeggio inoremap ten .then
  Arpeggio inoremap req require('')<Left><Left>
  Arpeggio inoremap var var<Space>
  Arpeggio inoremap doc document.
  Arpeggio inoremap win window.
  Arpeggio inoremap pro .prototype.
  Arpeggio inoremap ary Array
  Arpeggio inoremap obj Object
  Arpeggio inoremap ret return<Space>
  Arpeggio inoremap le .length
  Arpeggio inoremap arg arguments
  Arpeggio inoremap ;f ;(function() {<Cr>})()<Esc>O<Tab>
  Arpeggio inoremap rs <C-w>
  Arpeggio inoremap ei <C-w>
  Arpeggio nnoremap rst ciw
  Arpeggio nnoremap nei ciw
  Arpeggio nnoremap stn ci'
  Arpeggio nnoremap tne ci"
  Arpeggio inoremap rea fs.readFile
  Arpeggio inoremap jsp JSON.parse
  Arpeggio inoremap jst JSON.stringify
  Arpeggio inoremap bin .bind
  Arpeggio inoremap thr throw new Error()<left>
  Arpeggio inoremap tru true
  Arpeggio inoremap fal false
  Arpeggio inoremap syo System.out.println();<left><left>
  Arpeggio inoremap prf System.out.printf();<left><left>
  Arpeggio inoremap bol boolean<space>
  Arpeggio inoremap int int<space>
  Arpeggio inoremap dou dou<space>
  Arpeggio inoremap mat Math
  Arpeggio inoremap mex module.exports
  Arpeggio inoremap exo exports
  Arpeggio imap pl <C-Y>,

  Arpeggio nnoremap ex ZZ
  Arpeggio nnoremap qu ZQ
endfunction

autocmd VimEnter * call Chords#setup()
let g:arpeggio_timeoutlen=30





