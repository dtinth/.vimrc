" get directory
let s:dirname = expand("<sfile>:p:h")

" turn on syntax highlighting
syntax on
filetype plugin on

" cursor position, terminal background
set ruler background=dark

" color column 80
set cc=80

" auto indent
set autoindent

" scroll speed
set scroll=8

" allow backspacing over autoindent, linebreaks and starting point
set backspace=indent,eol,start

" set tab stops
set shiftwidth=2 tabstop=8 softtabstop=2 expandtab

" other stuff
set title nowrap completeopt=menu dir=~/.vimtmp
set backupcopy=yes
set backupdir=~/.vimbackup

" searching: incremental, highlight, smart case
set incsearch hlsearch ignorecase smartcase

" gui font
set guifont=Monaco:h14 

" show line number and command being entered
set showcmd number

" COMMAND to use old-style tab
command Tab setl shiftwidth=4 tabstop=4 softtabstop=0 noexpandtab indentexpr=

" COMMAND to setup autocommands
command -nargs=* Auto au BufNewFile,BufRead <args>
command -nargs=* AutoType au FileType <args>

" COMMAND to fix typing mistakes
command Q q
command Wq wq
command WQ wq

" nerdtree: auto quit and auto tree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" source stuff
exe "source " . s:dirname . "/disable_arrow_keys.vim"
exe "source " . s:dirname . "/keys.vim"
exe "source " . s:dirname . "/file_types.vim"
exe "source " . s:dirname . "/custom_command.vim"
exe "source " . s:dirname . "/chords.vim"
exe "source " . s:dirname . "/airline.vim"
" exe "source " . s:dirname . "/tab_autocomplete.vim"

" files to ignore in CtrlP
set wildignore+=*.o,*.obj,.git
set wildignore+=node_modules
set wildignore+=tmp/cache
let g:ctrlp_working_path_mode = '0'

" restore cursor positions ( taken from ubuntu's vimrc )
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" terminal capibilities
set t_ti= t_te=

let g:EasyMotion_keys='tnseriaoplfuwydhjcxmvkbNEIOLUYHKMTSCV' " colemak ftw
let g:EclimCompletionMethod='omnifunc' " for eclim to work with YouCompleteMe
let g:EclimJavascriptLintEnabled=0
let g:EclimJavascriptValidate=0
let g:syntastic_mode_map = { "mode": "active",
                           \ "active_filetypes": [],
                           \ "passive_filetypes": ["ruby", "html", "scss"] }
let g:pandoc#modules#disabled = ["folding"]
let g:vim_markdown_folding_disabled=1
let g:goldenview__enable_default_mapping = 0

