let s:dirname = expand("<sfile>:p:h")

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
exe "source " . s:dirname . "/vundles.vim"
source ~/Projects/vimrc/vundles.vim
call vundle#end()

exe "source " . s:dirname . "/main.vim"
colors dtinth256
filetype plugin on

