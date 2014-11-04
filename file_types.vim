
augroup dtinth

  autocmd!

  " Markdown: use 4 spaces
  AutoType markdown setl shiftwidth=4 softtabstop=4
  AutoType markdown setl wrap linebreak nolist wrapmargin=0 textwidth=0 spell
  AutoType pandoc setl shiftwidth=4 softtabstop=4
  AutoType pandoc setl wrap linebreak nolist wrapmargin=0 textwidth=0 spell
  AutoType java Tab

  " CSharp: use 4 spaces
  AutoType cs setl shiftwidth=4 softtabstop=4

  " Java: use tabs
  AutoType java Tab

  " Custom Run Scripts
  AutoType ruby let b:default_run_command='!ruby %'
  AutoType javascript let b:default_run_command='!node %'
  AutoType coffee let b:default_run_command='!coffee %'

augroup END
