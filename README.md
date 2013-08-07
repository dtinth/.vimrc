This repository contains my rc script for VIM and VImperator.

I add this to my real .vimrc:

    source ~/vimrc/vimrc
    source ~/vimrc/vundles.vim


Repository Contents
-------------------

<table>
    <tr>
        <td>vimrc</td>
        <td>
            My main vimrc file.
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


