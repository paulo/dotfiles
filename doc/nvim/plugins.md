## Plugins

Managed with [vim-plug](https://github.com/junegunn/vim-plug) in `nvim/.config/nvim/init.lua`.

### Themes and powerline

- **nvim-lualine/lualine.nvim** (Status bar)
- **AlexvZyl/nordic.nvim** (Colorscheme)

### Directory, file and buffer navigation

- [**nvim-tree/nvim-tree.lua**](#nvim-treenvim-treelua) (File explorer tree)
- **nvim-tree/nvim-web-devicons** (File icons)

### Navigation and searching

- [**nvim-telescope/telescope.nvim**](#nvim-telescopetelescopenvim) (Fuzzy finder for files, buffers, grep and help)
- **nvim-lua/plenary.nvim** (Lua utilities, required by telescope)
- [**junegunn/fzf.vim**](#junegunnfzfvim) (Fuzzy finder, alternative to telescope)
- **junegunn/fzf** (fzf binary)
- **christoomey/vim-tmux-navigator** (Seamlessly navigate between vim splits and tmux panes)

### Autocompletion and snippets

- [**ms-jpq/coq_nvim**](#ms-jpqcoq_nvim) (Autocompletion engine)
- **ms-jpq/coq.artifacts** (Snippets for coq)

### LanguageServer client

- [**neovim/nvim-lspconfig**](#neovimnvim-lspconfig) (LSP configs for gopls, solargraph, pyright, bashls, clangd, ts_ls, eslint, html and emmet_language_server)
- **onsails/diaglist.nvim** (Diagnostics on the quickfix list)

### Code display

- **Yggdroot/indentLine** (Indentation lines)
- [**Chiel92/vim-autoformat**](#chiel92vim-autoformat) (Code formatting)
- **ConradIrwin/vim-bracketed-paste** (Avoid indenting when pasting)
- **tpope/vim-sleuth** (Automatically set indentation and tabs on buffers)
- **pboettch/vim-cmake-syntax** (CMake syntax highlighting)
- **romus204/tree-sitter-manager.nvim** (Installs tree-sitter parsers and enables highlighting)

### Code edition

- [**scrooloose/nerdcommenter**](#scrooloosenerdcommenter) (Comment code)
- [**tpope/vim-surround**](#tpopevim-surround) (Support for surrounding text)
- **michaeljsmith/vim-indent-object** (Indentation as text objects - ai and ii to trigger)
- **wellle/targets.vim** (More text objects)
- **Raimondi/delimitMate** (Insert mode auto-completion for quotes, parentheses, brackets)
- [**justinmk/vim-sneak**](#justinmkvim-sneak) (Jump to any location specified by two characters)
- [**godlygeek/tabular**](#godlygeektabular) (Align equals)
- [**dyng/ctrlsf.vim**](#dyngctrlsfvim) (Sublime Ctrl+Shift+F)
- **sbdchd/neoformat** (Format on save)
- [**esmuellert/codediff.nvim**](#esmuellertcodediffnvim) (VSCode-style diff view)

### Accessibility

- [**christoomey/vim-system-copy**](#christoomeyvim-system-copy) (Copy to clipboard)
- [**tpope/vim-fugitive**](#tpopevim-fugitive) (Git integration)
- **haya14busa/is.vim** (Incremental search and clear highlighting)
- **tpope/vim-repeat** (Enhances . command)
- [**tpope/vim-unimpaired**](#tpopevim-unimpaired) (Complementary pairs of mappings)
- [**kshenoy/vim-signature**](#kshenoyvim-signature) (Support for marks)

### Programming Language support

- [**fatih/vim-go**](#fatihvim-go) (Go language support for Vim)
- **vim-ruby/vim-ruby** (Vim/Ruby Configuration Files)
- **rhysd/vim-clang-format** (Format C/C++ on save)

### AI assistance

- [**zbirenbaum/copilot.lua**](#zbirenbaumcopilotlua) (GitHub Copilot inline suggestions)

## Plugin cheatsheet

### justinmk/vim-sneak

| Command | Description |
|---|---|
| `s{char}{char}` |  move the cursor immediately to the next instance of the text. |
| `s` or `;` | go to the next match (`sneak#s_next` is enabled). |
| `f`, `F`, `t`, `T` | one-character sneak (replaces the builtin motions). |
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

### neovim/nvim-lspconfig

**Mappings** (buffer-local, set when an LSP attaches)

| Command | Description |
|---|---|
| `K` | hover documentation for the symbol under the cursor |
| `gd` | go to definition |
| `gD` | go to declaration |
| `gri` | list implementations (nvim default) |
| `grt` | go to type definition (nvim default) |
| `grr` | list references (nvim default) |
| `<C-k>` | signature help (overrides the window-up mapping in LSP buffers) |
| `F2` | rename symbol |
| `F3` | format file |
| `F4` | code action |

The `eslint` server runs `:EslintFixAll` on save.

### ms-jpq/coq_nvim

| Command | Description |
|---|---|
| `<Tab>` / `<S-Tab>` | select next/previous item in the popup menu |
| `<C-?>` | jump to the next snippet placeholder (insert/select mode) |

### zbirenbaum/copilot.lua

Suggestions are shown automatically as you type.

| Command | Description |
|---|---|
| `<C-f>` | accept the suggestion (insert mode) |

### kshenoy/vim-signature

| Command | Description |
|---|---|
`mx` | Toggle mark 'x' and display it in the leftmost column
`dmx` | Remove mark 'x' where x is a-zA-Z
`m,` | Place the next available mark
`m.` | If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
`m-` | Delete all marks from the current line
`m<Space>` | Delete all marks from the current buffer
`` ]` `` | Jump to next mark
`` [` `` | Jump to prev mark
`]'` | Jump to start of next line containing a mark
`['` | Jump to start of prev line containing a mark
`` `] `` | Jump by alphabetical order to next mark
`` `[ `` | Jump by alphabetical order to prev mark
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

| Command | Description |
|---|---|
| `F12` | go to definition (Go files). `C-t` to go back |

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
| `F2` or `:Autoformat` | format file (in LSP buffers `F2` is rename, use `F3` to format) |
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
| `[os, ]os and yos` | perform :set spell, :set nospell, and :set invspell |
| `[x and ]x` | encode and decode XML (and HTML) |
| `[u and ]u` | encode and decode URLs |
| `[y and ]y` | do C String style escaping |

See https://github.com/tpope/vim-unimpaired/blob/master/doc/unimpaired.txt for many more.

### nvim-telescope/telescope.nvim

**Fuzzy finder (main file/buffer search)**

| Command | Description |
|---|---|
| `<leader>f` | find files (ripgrep, includes hidden files) |
| `<leader>/` | live grep |
| `<leader>b` | buffers |
| `<leader>h` | help tags |

**Inside the picker**

| Command | Description |
|---|---|
| `C-j` / `C-k` | next/previous result (insert mode) |
| `C-s` | open in horizontal split |
| `C-v` | open in vertical split |
| `C-u` / `C-d` | scroll preview up/down (insert mode) |
| `C-q` | send selected to the quickfix list and open it |
| `Esc` | close |

### junegunn/fzf.vim

**Wrapper for the general-purpose command-line fuzzy finder**

_All commands are prefixed with 'Fzf'_ (e.g. `:FzfFiles`), except `:Ag` and `:Rg`.

| Command | Description |
|---|---|
| `FzfFiles [PATH]` | Files (similar to :FZF) |
| `FzfBuffers` | Open buffers |
| `FzfWindows` | Windows |
| `FzfBLines [QUERY]` | Lines in the current buffer |
| `FzfHistory` | v:oldfiles and open buffers |
| `FzfGFiles [OPTS]` | Git files (git ls-files) |
| `FzfGFiles?` | Git files (git status) |
| `FzfColors` | Color schemes |
| `Ag [PATTERN]` | ag search result (`?` toggles preview, `Ag!` for fullscreen) |
| `Rg [PATTERN]` | ripgrep search result (`?` toggles preview, `Rg!` for fullscreen) |
| `FzfLines [QUERY]` | Lines in loaded buffers |
| `FzfTags [QUERY]` | Tags in the project (ctags -R) |
| `FzfBTags [QUERY]` | Tags in the current buffer |
| `FzfMarks` | Marks |
| `FzfLocate PATTERN` | locate command output |
| `FzfHistory:` | Command history |
| `FzfHistory/` | Search history |
| `FzfCommits` | Git commits |
| `FzfBCommits` | Git commits for the current buffer |
| `FzfCommands` | Commands |
| `FzfMaps` | Normal mode mappings |
| `FzfHelptags` | Help tags |
| `FzfFiletypes` | File types |
| `C-t` | Tab split |
| `C-s` | Horizontal split |
| `C-v` | Vertical split |

**Mappings**

| Command | Description |
|---|---|
| `<leader><leader>f` | :FzfFiles |
| `<leader><leader>b` | :FzfBuffers |
| `<leader><leader>w` | :FzfWindows |
| `<leader><leader>/` | :Rg |
| `<leader><leader>?f` | :FzfHistory |

### tpope/vim-fugitive

**Git integration**

| Command | Description |
|---|---|
| `:Git` | with no arguments, bring up a summary window like git status (press `-` to stage/unstage a file, `=` to show an inline diff, `cc` to commit) |
| `:Git <cmd>` | run any arbitrary git command |
| `:Gedit`, `:Gsplit`, `:Gvsplit`, `:Gtabedit` | view any blob, tree, commit, or tag in the repository |
| `:Gdiffsplit` | bring up the staged version of the file side by side with the working tree version |
| `:Git blame` | interactive vertical split with git blame output (press enter on a line to edit the commit where the line changed, or o to open it in a split) |
| `:GMove` | does a git mv on a file and simultaneously renames the buffer |
| `:GDelete` | does a git rm on a file and simultaneously deletes the buffer |
| `:Ggrep` | search the work tree (or any arbitrary commit) with git grep |
| `:Gclog` | load all previous revisions of a file into the quickfix list |
| `:Gread`| variant of git checkout -- filename that operates on the buffer rather than the filename, so `u` undoes it |
| `:Gwrite` | writes to both the work tree and index versions of a file, making it like git add |
| `:GBrowse` | open the current file on the web front-end of the hosting provider (requires a provider plugin) |

### esmuellert/codediff.nvim

**VSCode-style diff view**

| Command | Description |
|---|---|
| `:CodeDiff` | diff the working tree against HEAD |
| `:CodeDiff <revision>` | diff against the given revision |
| `:CodeDiff file <revision>` | diff the current file against the given revision |
| `:CodeDiff merge <file>` | resolve merge conflicts in the given file |

### nvim-tree/nvim-tree.lua

The tree opens automatically on startup.

| Command | Description |
|---|---|
| `<leader>d` or `:NvimTreeToggle` | toggle the tree |
| `<leader><leader>d` or `:NvimTreeFindFile` | open the tree at the current file |

**Inside the tree** (defaults plus custom mappings)

| Command | Description |
|---|---|
| `<CR>` or `o` | open file or open/close directory |
| `v` | open in vertical split |
| `s` | open in horizontal split |
| `<C-t>` | open in new tab |
| `<Tab>` | preview |
| `i` | open with the system application |
| `R` | refresh |
| `a` | create file or directory (end with `/`) |
| `d` / `D` | delete / move to trash |
| `r` | rename |
| `x` / `c` / `p` | cut / copy / paste |
| `y` / `Y` / `gy` | copy name / relative path / absolute path |
| `P` | go to parent directory |
| `-` | move tree root up a dir |
| `<C-]>` | change tree root to selected dir |
| `H` | toggle dotfiles |
| `I` | toggle git ignored files |
| `W` / `E` | collapse / expand all |
| `f` | filter |
| `q` | close |
| `g?` | toggle help |

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

### dyng/ctrlsf.vim

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

CtrlSF has a lot of arguments you can use in search:

| Argument | Description |
|---|---|
| `-R` | Use regular expression pattern |
| `-I, -S` | Search case-insensitively (-I) or case-sensitively (-S) |
| `-C, -A, -B` | Specify how many context lines to be printed, identical to their counterparts in Ag/Ack |
| `-W` | Only match whole words |
