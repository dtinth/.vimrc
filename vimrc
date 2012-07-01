
" set leader
let mapleader = ","

" turn on syntax highlighting
syntax on
filetype plugin indent on

" highlight menu colors
hi Pmenu ctermfg=White ctermbg=DarkBlue
hi PmenuSel ctermfg=Red ctermbg=White

" cursor position, terminal background
set ruler background=dark

" auto indent
set autoindent
function GetDtinthIndent()
  let lnum = v:lnum
  let prevline = getline(lnum - 1)
  let line = getline(lnum)
  let previndent = indent(lnum - 1)
  let indent = previndent
  if prevline =~ '^\s*$'
    return indent(lnum)
  endif
  if prevline =~ '{$'
    let indent += 2
  endif
  if line =~ '^\s*}'
    let indent -= 2
  endif
  if prevline =~ '^\s*,'
    let indent += 2
  endif
  if line =~ '^\s*,'
    if prevline =~ '^\s*var\s'
      let indent += 2
    else
      let indent -= 2
    endif
  endif
  return indent
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
set number showcmd

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
  Auto *.md setl shiftwidth=4 softtabstop=4
  AutoType java Tab

  " mapping for csharp files
  AutoType cs setl shiftwidth=4 softtabstop=4
  AutoType cs imap <buffer> ;wl Console.WriteLine("");<left><left><left>
  AutoType cs imap <buffer> ;w; Console.Write("");<left><left><left>
  AutoType cs imap <buffer> ;ip int.Parse()<left>
  AutoType cs imap <buffer> ;dp double.Parse()<left>
  AutoType cs imap <buffer> ;rl Console.ReadLine()

  " mapping for js files
  AutoType javascript imap <buffer> ;rq ;req
  AutoType javascript imap <buffer> ;req require('

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

" line number colors
hi LineNr  ctermfg=238  ctermbg=black  cterm=none

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
    return "\<c-n>"
  endif
  return "\<tab>"
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

