" set leader
let mapleader = ","

" turn on syntax highlighting
syntax on
filetype plugin indent on

" cursor position, terminal background
set ruler background=dark

" auto indent
set autoindent
function GetDtinthIndent()

  let lnum = v:lnum
  let prevline = getline(lnum - 1)
  let line = getline(lnum)
  let indent = indent(lnum - 1)

  " don't bother re-indenting after a blank line
  if prevline =~ '^\s*$'
    return indent(lnum)
  endif

  " amd define: also don't indent
  if prevline =~ '^define('
    return indent(lnum)
  endif

  " now we check stuff
  let openbracket = (prevline =~ '{$')
  let prevclosebracket = (prevline =~ '^\s*}')
  let closebracket = (line =~ '^\s*}')
  let prevcomma = (prevline =~ '^\s*,')
  let comma = (line =~ '^\s*,')
  let prevvar = (prevline =~ '^\s*var\s')

  if prevclosebracket
    let open = GetOpenBracketLineNumber(lnum - 1)
    if open > 0
      let openline = getline(open)
      let openindent = indent(open)
      let opencomma = (openline =~ '^\s*,')
      if opencomma
        let prevcomma = opencomma
        let indent = openindent
      end
    end
  end

  let invar = 0
  if prevcomma
    let lnum2 = lnum - 1
    while getline(lnum2) =~ '^\s*,'
      let lnum2 -= 1
    endwhile
    if lnum2 > 0 && getline(lnum2) =~ '^\s*var'
      let invar = 1
    end
  end

  if closebracket && openbracket && prevcomma | return indent + 2 | end
  if closebracket && openbracket | return indent | end
  if openbracket && prevcomma | return indent + 4 | end
  if openbracket && !prevcomma | return indent + 2 | end
  if closebracket && prevcomma | return indent | end
  if closebracket && !prevcomma | return indent - 2 | end
  if prevvar && comma | return indent + 2 | end
  if prevcomma && !comma && invar | return indent - 2 | end
  if prevcomma && !comma && !invar | return indent + 2 | end
  if prevcomma && comma | return indent | end
  if !prevcomma && comma | return indent - 2 | end


  " if prevcomma && !openbracket | let indent -= 2 | end
  " if prevcomma && openbracket | let indent += 2 | end
  " if comma && (prevvar || prevcomma) | let indent += 2 | else | let indent -= 2 | end
  " if openbracket | let indent += 2 | end
  " if closebracket | let indent -= 2 | end
  " if prevclosebracket && OpenBracketIsAfterAComma(lnum - 1) | let indent -= 4 | end
  return indent

endfunction

function GetOpenBracketLineNumber(lnum)
  let lnum = a:lnum
  let level = 0
  while lnum > 0
    let line = getline(lnum)
    let openbracket = (line =~ '{$')
    let closebracket = (line =~ '^\s*}')
    if closebracket
      let level += 1
    elseif openbracket
      let level -= 1
      if level == 0
        return lnum
      end
    end
    let lnum -= 1
  endwhile
  return 0
endfunction


" allow backspacing over autoindent, linebreaks and starting point
set backspace=indent,eol,start

" set tab stops
set shiftwidth=2 tabstop=8 softtabstop=2 expandtab

" allow mouse usage
" set mouse=a

" other stuff
set title nowrap completeopt=menu dir=~/.vimtmp

" searching: incremental, highlight, smart case
set incsearch hlsearch smartcase

" gui font
set guifont=Monaco:h14 

" show line number and command being entered
set relativenumber showcmd

" window width
set numberwidth=5
set winwidth=85
"set winheight=10
"set winminheight=5
"set winheight=999

" COMMAND to use old-style tab
command Tab setl shiftwidth=4 tabstop=4 softtabstop=0 noexpandtab

" COMMAND to setup autocommands
command -nargs=* Auto au BufNewFile,BufRead <args>
command -nargs=* AutoType au FileType <args>

" COMMAND to fix typing mistakes
command Q q
command Wq wq
command WQ wq

augroup dtinth

  autocmd!

  " for markdown files: use 4 spaces
  AutoType markdown setl shiftwidth=4 softtabstop=4
  AutoType java Tab

  " mapping for csharp files
  AutoType cs setl shiftwidth=4 softtabstop=4
  AutoType cs inoremap <buffer> ;wl Console.WriteLine("");<left><left><left>
  AutoType cs inoremap <buffer> ;w; Console.Write("");<left><left><left>
  AutoType cs inoremap <buffer> ;ip int.Parse()<left>
  AutoType cs inoremap <buffer> ;dp double.Parse()<left>
  AutoType cs imap <buffer> ;rl Console.ReadLine()

  " mapping for js files
  AutoType javascript imap <buffer> ;rq ;req
  AutoType javascript imap <buffer> ;req require('
  AutoType javascript imap <buffer> ;ds describe('<esc>mda', function() {<cr>})<esc>`da
  AutoType javascript imap <buffer> ;it it('should <esc>mda', function() {<cr>})<esc>`da

  AutoType javascript set indentexpr=GetDtinthIndent() indentkeys+=0\,

augroup END

" http://news.ycombinator.com/item?id=1484280
" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" map ctrl+s to save
map <c-s> :up<cr>
imap <c-s> <esc>:up<cr>

" funny js
function! FunnyJS()
  syn match Error /^\s*[(\[]/ display
  syn match Error /;$/ display
  setl cc=80
endfunction

" nerdtree: auto quit and auto tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" tab remap
function InsertTabWrapper()
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

" map leader-f to command-t
map <leader>f :CommandT<cr>
map <leader>m :CommandT node_modules<cr>

" command-t options
let g:CommandTMatchWindowReverse=1

" ignore some files in command-t
set wildignore+=*.o,*.obj,.git
set wildignore+=node_modules

" restore cursor positions ( taken from ubuntu's vimrc )
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
" relative line numbers when moving around
au FocusLost * set number
au FocusGained * set relativenumber
au InsertEnter * set number
au InsertLeave * set relativenumber

" bind run command
map <leader>r :call RunCustomCommand()<cr>
map <leader>R :call SetCustomCommand()<cr>
function! RunCustomCommand()
  up
  execute '!' . s:customcommand
endfunction

function! SetCustomCommand()
  let s:customcommand = input('Enter Custom Command$ ')
endfunction

" rainbow rainbow!! 
let s:currentcolor = 9
function! ChangeColor()
  let s:currentcolor += 1
  if s:currentcolor >= 15
    let s:currentcolor = 9
  end
  exe "hi Comment ctermfg=" . s:currentcolor
endfunction

" autocmd InsertEnter * call ChangeColor()
" autocmd InsertCharPre * call ChangeColor()
" autocmd CursorMoved * call ChangeColor()

autocmd InsertEnter * noh

" from garybernhardt / dotfiles
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
autocmd! CmdwinEnter * :unmap <cr>
autocmd! CmdwinLeave * :call MapCR()
