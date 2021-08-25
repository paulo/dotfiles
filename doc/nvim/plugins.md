## Plugins

### Directory, file and buffer navigation

- [**scrooloose/nerdtree**](#scrooloosenerdtree) (Tree explorer for vim)
- **Xuyuanp/nerdtree-git-plugin** (NerdTree's git status)
- [**junegunn/fzf**](#junegunnfzf) (Fast and useful fuzzy search)
- **christoomey/vim-tmux-navigator** (Seamlessly navigate between vim splits and tmux panes)

### Themes and powerline

- **itchyny/lightline.vim** (Lightweight powerline like status bar)
- **jacoborus/tender.vim** (Colorscheme)

### Autocompletion and snippets

- **ms-jpq/coq_nvim** (Autocompletion and snippets engine)

### Ctags

- **majutsushi/tagbar** (Nerd-tree like menu for tags, F8 to trigger)

### LanguageServer client

- [**autozimu/LanguageClient-neovim**](#autozimulanguageclient-neovim)

### Code display

- **luochen1990/rainbow** (Various colors for brackets and parentises)
- **Yggdroot/indentLine** (Indentation lines)
- [**Chiel92/vim-autoformat**](#chiel92vim-autoformat)
- **ConradIrwin/vim-bracketed-paste** (Avoid indenting when pasting)
- **tpope/vim-sleuth** (Automatically set indententation and tabs on buffers)

### Code edition

- **w0rp/ale** (Asynchronous Lint Engine)
- [**scrooloose/nerdcommenter**](#scrooloosenerdcommenter) (Comment code)
- [**tpope/vim-surround**](#tpopevim-surround) (Support for surrounding text)
- **michaeljsmith/vim-indent-object** (Indentation as text objects - ai and ii to trigger)
- **kana/vim-textobj-user** (Allows the definition of new text objects)
- **wellle/targets.vim** (More text objects)
- **Raimondi/delimitMate** (Insert mode auto-completion for quotes, parentises, brackets)
- [**justinmk/vim-sneak**](#justinmkvim-sneak) (Jump to any location specified by two characters)
- [**godlygeek/tabular**](#godlygeektabular) (Align equals)
- [**dyng/ctrlsf**](#dyng/ctrlsf) (Sublime Ctrl+Shift+F)

### Accessibility

- [**christoomey/vim-system-copy**](#christoomeyvim-system-copy) (Copy to clipboard)
- [**tpope/vim-fugitive**](#tpopevim-fugitive) (Git integration)
- **shumphrey/fugitive-gitlab.vim** (Gitlab support)
- **haya14busa/is.vim** (Incremental search and clear highlighting)
- **tpope/vim-repeat** (Enhances . command)
- [**tpope/vim-unimpaired**](#topevim-unimpaired) (Complementary pairs of mappings)
- [**kshenoy/vim-signature**](#kshenoyvim-signature) (Support for marks)

### Programming Language support

- **sheerun/vim-polyglot** (A collection of language packs for Vim)
- [**tpope/vim-cucumber**](#tpopevim-cucumber) (Syntax highlighting and step utilities for Cucumber)
- **tpope/vim-haml** (Runtime files for Haml, Sass, and SCSS)
- [**fatih/vim-go**](#fatihvim-go) (Go language support for Vim)
- **vim-ruby/vim-ruby** (Vim/Ruby Configuration Files)

## Plugin cheatsheet

### justinmk/vim-sneak

| Command | Description |
|---|---|
| `s{char}{char}` |  move the cursor immediately to the next instance of the text. |
| `;` | go to the next match. |
| `3;` | skip to the third match from the current position. |
| `ctrl-o` | go back to the starting point. |
| `s<Enter>` | repeat the last Sneak-search. |
| `S` | search backwards. |
| Sneak is invoked with operators via z (because s is taken by surround.vim). |
| `3dzqt` | delete up to the third instance of "qt". |
| `.` | repeat the 3dzqt operation. |
| `d;` | delete up to the next match. |
| `yszxy]` | surround in brackets up to xy. |
| `.` to repeat the surround operation. |

### godlygeek/tabular

| Command | Description |
|---|---|
| `<leader>a=` | Align visual selection or line by the `=` character |
| `<leader>a:` | Align visual selection or line by the `:` character |
| `<leader>a\|` | Align visual selection or line by the `\|` character |
| `:Tab /<char>` | Align visual selection or line by the given character |

### autozimu/LanguageClient-Neovim

| Command | Description |
|---|---|
| `K` | check documentation for command |
| `gd` | go to definition |

### kshenoy/vim-signature

| Command | Description |
|---|---|
`mx` | Toggle mark 'x' and display it in the leftmost column
`dmx` | Remove mark 'x' where x is a-zA-Z
`m,` | Place the next available mark
`m.` | If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
`m-` | Delete all marks from the current line
`m<Space>` | Delete all marks from the current buffer
`]` | Jump to next mark
`[` | Jump to prev mark
`]'` | Jump to start of next line containing a mark
`['` | Jump to start of prev line containing a mark
`]` | Jump by alphabetical order to next mark
`[` | Jump by alphabetical order to prev mark
`']` | Jump by alphabetical order to start of next line having a mark
`'[` | Jump by alphabetical order to start of prev line having a mark
`m/` | Open location list and display marks from current buffer
`m[0-9]` | Toggle the corresponding marker !@#$%^&*()
`m<S-[0-9]>` | Remove all markers of the same type
`]-` | Jump to next line having a marker of the same type
`[-` | Jump to prev line having a marker of the same type
`]=` | Jump to next line having a marker of any type
`[=` | Jump to prev line having a marker of any type
`m?` | Open location list and display markers from current buffer
`m<BS>` | Remove all markers

### fatih/vim-go

For the complete help guide, `:help vim-go`

### tpope/vim-cucumber

| Command | Description |
|---|---|
| `[<C-d> or ]<C-d>` | in normal mode, on a step jumps to the corresponding step definition and replaces the current buffer |
| `<C-W>d or <C-w><C-d>` | in normal mode, on a step jumps to its definition in a new split buffer and moves the cursor there |
| `[d or ]d` | in normal mode, on a step opens the step definition in a new split buffer while maintaining the current cursor position |

### christoomey/vim-system-copy

**Mapping to copy to the system clipboard using a motion or visual selection.**

| Command | Description |
|---|---|
| `cp<motion or text <object>` | default mapping for copying |
| `cpiw` | copy word into system clipboard |
| `cpi'` | copy inside single quotes to system clipboard |
| `cP` | copy the current line directly |
| `cv`| paste the content of system clipboard to the next line |

### Chiel92/vim-autoformat

**Easy code formatting**

| Command | Description |
|---|---|
| `F3` or `:Autoformat` | format file |
| `:retab` | retab file |
| `:RemoveTrailingSpaces`| remove trailing whitespace |

### scrooloose/nerdcommenter

**Comment text, functions... easily**

| Command | Description |
|---|---|
| `[count]<leader>c<space>` | toggle the comment state of the selected line(s).
| `[count]<leader>cc` | comment out the current line or text selected in visual mode |
| `[count]<leader>cu` | uncomment the selected line(s) |
| `[count]<leader>cn` | same as cc but forces nesting |
| `[count]<leader>ci` | toggle the comment state of the selected line(s) individually |
| `[count]<leader>cs` | comment out the selected lines with a pretty block formatted layout |
| `[count]<leader>cy` | same as cc except that the commented line(s) are yanked first |
| `<leader>c$` | comment the current line from the cursor to the end of line |
| `<leader>cA` | add comment delimiters to the end of line and go into insert mode between them |

### Yggdroot/indentLine

**Display the indention levels with thin vertical lines**

| Command | Description |
|---|---|
| `:IndentLinesToggle` | toggle |

### luochen1990/rainbow

**Show different levels of parentheses in different colors**

| Command | Description |
|---|---|
| `:RainbowToggle`| toggle |

### tpope/vim-unimpaired

**Extra mappings for useful commands**

All of the mappings take a count. The . command works with all operator mappings

| Command | Description |
|---|---|
| `[f and ]f` | go to the next/previous file in the directory |
| `[n and ]n` | jump between SCM conflict markers |
| `[b and ]b` | navigate backward and forward through the buffer list |
| `[q and ]q` | navigate up and down through the quickfix list |
| `[l and ]l` | navigate up and down through the location list |
| `[a and ]a` | navigate backward and forward through the file list |
| `[<Space> and ]<Space>` | add a blank line above or below the current line |
| `[p and ]p` | paste above or below the current line |
| `>P and >p` | paste above or below the current line and increase the indent |
| `=P and =p` | paste above or below the current line and re-indent |
| `[e and ]e` | exchange the current line with the one above or below it |
| `[os, ]os and =os` | perform :set spell, :set nospell, and :set invspell |
| `[x and ]x` | encode and decode XML (and HTML) |
| `[u and ]u` | encode and decode URLs |
| `[y and ]y` | do C String style escaping |

See https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt for many more.

### junegunn/fzf.vim

**Wrapper for the general-purpose command-line fuzzy finder**

_All commands are prefixed with 'fzf'_

| Command | Description |
|---|---|
| `<leader>f` or `Files [PATH]` | Files (similar to :FZF) |
| `<leader>b` or `Buffers` | Open buffers |
| `<leader>w` or `Windows` | Windows |
| `<leader>l` or `BLines [QUERY]` | Lines in the current buffer |
| `<leader>f?` or `History` | v:oldfiles and open buffers |
| `GFiles [OPTS]` | Git files (git ls-files) |
| `GFiles?` | Git files (git status) |
| `Colors	Color` | schemes |
| `Ag [PATTERN]` | ag search result (ALT-A to select all, ALT-D to deselect all) |
| `Lines [QUERY]` | Lines in loaded buffers |
| `Tags [QUERY]` | Tags in the project (ctags -R) |
| `BTags [QUERY]` | Tags in the current buffer |
| `Marks` | Marks |
| `Locate PATTERN` | locate command output |
| `History:` | Command history |
| `History/` | Search history |
| `Snippets` | Snippets (UltiSnips) |
| `Commits` | Git commits |
| `BCommits` | Git commits for the current buffer |
| `Commands` | Commands |
| `Maps` | Normal mode mappings |
| `Helptags` | Help tags 1 |
| `Filetypes` | File types |
| `C-t` | Tab split |
| `C-x` | Horizontal split |
| `C-v` | Vertical split |

**Mappings**

| Command | Description |
|---|---|
| `<leader>f` | :FzfFiles |
| `<leader>b` | :FzfBuffers |
| `<leader>wf` | :FzfWindows |
| `<leader>/` | :Ag |
| `<leader>?` | :FzfHistory |

### tpope/vim-fugitive

**Git integration**

| Command | Description |
|---|---|
| `:Git` | run any arbitrary command |
| `Git!` | open the output of a command in a temp file |
| `:Gedit`, `:Gsplit`, `:Gvsplit`, `:Gtabedit` | view any blob, tree, commit, or tag in the repository |
| `:Gdiff` | bring up the staged version of the file side by side with the working tree version |
| `:Gstatus` | bring up the output of git status (press `-` to add/reset a file's changes, or `p` to add/reset --patch |
| `:Gcommit`| commit change |
| `:Gblame` | brings up an interactive vertical split with git blame output (press enter on a line to edit the commit where the line changed, or o to open it in a split. When you're done, use `:Gedit` in the historic buffer to go back to the work tree version) |
| `:Gmove` | does a git mv on a file and simultaneously renames the buffer |
| `:Gdelete` | does a git rm on a file and simultaneously deletes the buffer |
| `:Ggrep` | to search the work tree (or any arbitrary commit) with git grep, skipping over that which is not tracked in the repository |
| `:Glog` | load all previous revisions of a file into the quickfix list |
| `:Gread`| variant of git checkout -- filename that operates on the buffer rather than the filename. This means you can use u to undo it and you never get any warnings about the file changing outside Vim |
| `:Gwrite` | writes to both the work tree and index versions of a file, making it like git add when called from a work tree file and like git checkout when called from the index or a blob in history |
| `:Gbrowse` | to open the current file on the web front-end of your favorite hosting provider, with optional line range |

### scrooloose/nerdtree

| Command | Description |
|---|---|
| **File system explorer** |
| `<leader>º` or `:NERDTreeToogle`| open Nerdtree window |
| **Files** |
| `o` | open the file in a new buffer or open/close directory |
| `go`| preview |
| `t` | open the file in a new tab |
| `T` | open in new tab silently |
| `i` | open the file in a new horizontal split |
| `gi` | preview split |
| `s` | open the file in a new vertical split |
| `gs` | preview vsplit |
| `p` | go to parent directory |
| `r` | refresh the current directory |
| `m` | launch NERDTree menu inside Vim |
| **Direct­ories** |
| `o` | open & close |
| `O` | recurs­ively open |
| `x` | close parent |
| `X` | close all children recurs­ively |
| `e` | explore selected dir |
| **Bookmarks** |
| `o` | open bookmark |
| `t` | open in new tab |
| `T` | open new tab while staying in current tab |
| `D` | delete bookmark |
| `B` | list available bookmarks |
| `:Bookmark <bookmark name>` | create bookmark (must be in the wanted directory) |
| **Filesystem** |
| `C` | change tree root to selected dir |
| `u` | move tree root up a dir |
| `U` | move tree root up a dir but leave old root open |
| `r` | refresh cursor dir |
| `R` | refresh current root |
| `m` | Show menu |
| `cd` | change the CWD to the selected dir |
| `CD` | change tree root to CWD |
| **Tree navigation** |
| `p` | go to parent |
| `P` | go to root |
| `K` | go to first child |
| `J` | go to last child |
| `C-­k` | go to prev sibling |
| `C-­j` | go to next sibling |
| **Tree filtering** |
| `I` | hidden files (off) |
| `f` | file filters (on) |
| `F` | files (on) |
| `B` | bookmarks (off) |
| **Change window** |
| `C-ww` | cycle though all windows |
| `C-wh` | go left a window |
| `C-wj` | go down a window |
| `C-wk` | go up a window |
| `C-wl` | go right a window |
| **Change tabs** |
| `gt` | cycle though all tabs |
| `gT` | cycle though all tabs (moves to the left) |
| **Other commands** |
| `A` | Zoom (maxim­ize­-mi­nimize) the NERDTree window |
| `?` | toggle help |

### tpope/vim-surround

**Quoting/parenthesizing made simple**

| Command | Description |
|---|---|
|**Change surround**||
| `cs"'` | change surrounding double quotes to single quotes |
| `cs'<q>` | change surrounding single quotes to `<q></q>` tag |
| `cst"` | change surrounding tag (`t` is a text object) to double quotes |
| `cst<h2>` | change surrounding tag to `<h2></h2>` |
|**Remove delimiters**|
| `ds"` | remove delimiters entirely (delete surrounding double quotes) |
| `ysiw"` | add surrounding double quotes to inner word |
| `cs]{` | make that braces and add some space (use `}` instead of `{` for no space) |
|**Wrap line**|
| `yssb` or `yss)` | Now wrap the entire line in parentheses |
| `ysiw<em>`| emphasize hello |
|**Visual mode**|
| `V S<p class="important">` | surround with markup (V is for linewise visual mode). Works for any visually selected text. |

### dyng/ctrlsf

**Sublime like project search**

`:CtrlSF [pattern]` to split a new window to show search result. `Enter/o or q` to open corresponding file or quit. You can edit search result as you like. Whenever you apply a change, you can save your change to actual file by `:w`. You can always undo it by pressing `u` and saving it again.

`:CtrlSFOpen` can reopen CtrlSF window when you have closed CtrlSF window. A handy command `:CtrlSFToggle` is also available. If you prefer a quickfix-like result window, just try to press `M` in CtrlSF window.

| Command | Description |
|---|---|
| `<C-O>` | Like Enter but open file in a horizontal split window |
| `t` | Like Enter but open file in a new tab |
| `p` | Like Enter but open file in a preview window |
| `P` | Like Enter but open file in a preview window and switch focus to it |
| `O` | Like Enter but always leave CtrlSF window opening |
| `T` | Like t but focus CtrlSF window instead of new opened tab |
| `M` | Switch result window between normal view and compact view |
| `q` | Quit CtrlSF window or preview window |
| `<C-J>` | Move cursor to next match |
| `<C-K>` | Move cursor to previous match |
| `<C-C>` | Stop a background searching process |
| `<C-F>f` | Input `:CtrlSF` in command line for you, just a handy shortcut |
| `<C-F>f` | Input `:CtrlSF foo` in command line where foo is the current visual selected word, waiting for further input |
| `<C-F>n` | Input `:CtrlSF foo` in command line where foo is word under the cursor |
| `<C-F>p` | Input `:CtrlSF foo` in command line where foo is the last search pattern of vim |
| `<C-F>o` | Reopen CtrlSF window when you have closed CtrlSF window |
| `<C-F>t` | Toggle CtrlSF window |

CtrlSF has a lot of arguments you can use in search:

| Argument | Description |
|---|---|
| `-R` | Use regular expression pattern |
| `-I, -S` | Search case-insensitively (-I) or case-sensitively (-S) |
| `-C, -A, -B` | Specify how many context lines to be printed, identical to their counterparts in Ag/Ack |
| `-W` | Only match whole words |
