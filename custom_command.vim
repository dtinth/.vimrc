
let g:custom_command='!~/Codejom/_agaru/run %'

function! custom_command#run()
  up
  execute g:custom_command
endfunction

function! custom_command#set()
  echohl Question
  let g:custom_command = input('Enter Custom Command$ ')
  echohl None
endfunction
