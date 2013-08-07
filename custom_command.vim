
let g:silent_custom_command = 0
function! custom_command#run()
  up
  if g:silent_custom_command
    execute 'silent !' . g:custom_command
  else
    execute '!' . g:custom_command
  end
endfunction

function! custom_command#set()
  let g:custom_command = input('Enter Custom Command$ ')
endfunction
