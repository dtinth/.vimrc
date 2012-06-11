
" turn on syntax highlighting
syntax on
filetype plugin on

" highlight menu colors
hi Pmenu ctermfg=White ctermbg=DarkBlue
hi PmenuSel ctermfg=Red ctermbg=White

" cursor position, auto indent, terminal background
set ruler autoindent background=dark

" allow backspacing over autoindent, linebreaks and starting point
set backspace=indent,eol,start

" set tab stops
set shiftwidth=2 tabstop=8 softtabstop=2 expandtab

" allow mouse usage
set mouse=a

" other stuff
set title nowrap completeopt=menu dir=~/.vimtmp

" searching: incremental, highlight, smart case
set incsearch hlsearch smartcase

" gui font
set guifont=Monaco:h14 

" COMMAND to use old-style tab
command Tab setl shiftwidth=4 tabstop=4 softtabstop=0 noexpandtab

" COMMAND to setup autocommands
command -nargs=* Auto au BufNewFile,BufRead <args>

" COMMAND to fix typing mistakes
command Q q
command Wq wq
command WQ wq

" for markdown files: use 4 spaces
Auto *.md setl shiftwidth=4 softtabstop=4
Auto *.java Tab

" mapping for csharp files
Auto *.cs setl shiftwidth=4 softtabstop=4
Auto *.cs imap <buffer> ;wl Console.WriteLine("");<left><left><left>
Auto *.cs imap <buffer> ;w; Console.Write("");<left><left><left>
Auto *.cs imap <buffer> ;ip int.Parse()<left>
Auto *.cs imap <buffer> ;dp double.Parse()<left>
Auto *.cs imap <buffer> ;rl Console.ReadLine()

" mapping for js files
Auto *.js imap <buffer> ;rq ;req
Auto *.js imap <buffer> ;req require('
