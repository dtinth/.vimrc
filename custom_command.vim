
let g:custom_command=''

function! custom_command#run()
  up
  if g:custom_command == ''
    execute b:default_run_command
  else
    execute g:custom_command
  endif
endfunction

function! custom_command#set()
  echohl Question
  let g:custom_command = input('Enter Custom Command$ ')
  echohl None
endfunction
