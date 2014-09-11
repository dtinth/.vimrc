
augroup dtinth

  autocmd!

  " Markdown: use 4 spaces
  AutoType markdown setl shiftwidth=4 softtabstop=4
  AutoType markdown set wrap linebreak nolist wrapmargin=0 textwidth=0 
  AutoType java Tab

  " CSharp: use 4 spaces
  AutoType cs setl shiftwidth=4 softtabstop=4

  " Java: use tabs
  AutoType java Tab

augroup END
