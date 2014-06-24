This repository contains my rc script for VIM.


Setup
-----

```bash
# install vundle and clone the repository
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/dtinth/.vimrc.git ~/vimrc

# install plugins
vim +'set nocompatible' \
    +'filetype off' \
    +'set rtp+=~/.vim/bundle/Vundle.vim' \
    +'call vundle#begin()' \
    +'source ~/vimrc/vundles.vim' \
    +'call vundle#end()' \
    +'PluginInstall' \
    +'qall'

# create required directories
mkdir ~/.vimtmp ~/.vimbackup

# install!
echo 'source ~/vimrc/boot.vim' >> ~/.vimrc
```


Repository Contents
-------------------

<table>
    <tr>
        <td>boot.vim</td>
        <td>
            Convenient file for quick setup...
        </td>
    </tr>
    <tr>
        <td>main.vim</td>
        <td>
            My main .vimrc file.
            Includes the other files (except vundles.vim).
            Contains the settings that don't deserve its own file.
        </td>
    </tr>
    <tr>
        <td>vundles.vim</td>
        <td>My Vundle settings.</td>
    </tr>
    <tr>
        <td>disable_arrow_keys.vim</td>
        <td>Disables arrow keys, forcing you to use hjkl.</td>
    </tr>
    <tr>
        <td>keys.vim</td>
        <td>My key mappings.</td>
    </tr>
    <tr>
        <td>tab_autocomplete.vim</td>
        <td>Maps the tab key to trigger autocompletion menu.</td>
    </tr>
    <tr>
        <td>file_types.vim</td>
        <td>Specific settings for file types.</td>
    </tr>
</table>


