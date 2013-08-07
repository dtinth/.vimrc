
" remap <tab> to auto-complete
function InsertTabWrapper()

  " popup menu visible? select next item
  if pumvisible()
    return "\<c-n>"
  endif

  if strpart(getline('.'), 0, col('.') - 1) =~ '\w$'

    if ShouldUseOmniCompletion()
      return "\<c-x>\<c-o>"
    endif

    return "\<c-n>"

  endif

  return "\<tab>"

endfunction

function ShouldUseOmniCompletion()
  let text = strpart(getline('.'), 0, col('.') - 1)
  let name = synIDattr(synID(line("."), col("."), 1), "name")
  if text =~ '</$' | return 1 | end
  if name =~ '^css' | return 1 | end
  return 0
endfunction

inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-tab> <c-p>


