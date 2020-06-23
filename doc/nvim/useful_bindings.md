## Useful bindings

## Navigation/Movement

| Command | Description |
|---|---|
| `Ctrl-w t` | makes the first (topleft) window current |
| `Ctrl-w K` | moves the current window to full-width at the very top |
| `Ctrl-w H` | moves the current window to full-height at far left |
| `'.` | jump back to last edited line |
| `ge or gE` | Move to the end of the previous word or WORD |
| `C-o and C-i` | jump back and forth, in the current file and beyond |
| `g;` | jump back to last edited position. |
| `Ctrl-]` | Navigate to definition under cursor, often by using tags |
| `<C-w>}.` | go to tag under cursor |
| `''` | go the first non-whitespace character of the last edited line. Again to go back |
| `w` and `b` | word and back motions |
| `I` and `A` |  put the cursor at the beginning/end of the line then enter insert mode |

**Mappings**

| Command | Description |
|---|---|
| ` :bp` | Go to the previous |
| ` :bn` |  Go to the next |
| ` :enew` | Open a new empty buffer |
| ` :bp` |  Close the current buffer |

## Toggle/Settings

| Command | Description |
|---|---|
| `coh` | toggle search highlights |
| `cor` | toggle relative line numbers |
| `cow` | toggle line wrapping |
| `cox` | toggle cursor cross-hairs |

## Edition/Selection

| Command | Description |
|---|---|
| `gv` | in visual mode, reselect the last visual selection. |
| `~ or u or U` | in visual mode, change current visual selection to inversed or forced-lower or forced-upper case. |
| `vip or vap` | in visual mode, visually select current inner or around paragraph. |
| `vis or vas` | in visual mode, visually select current inner or around sentence. |
| `vit or vat` | in visual mode, visually select current inner or around tag. |
| `:'<,'>sort` | in visual mode, sort visual selection. |
| `:'<,'>uniq` | in visual mode, unique the visual selection. |
| `CtrlC instead of Esc` | to switch out of insert mode |
| `<number>J` | join lines |
| `gg=G` | manually autoindent entire file |
| `=` | indent line |
| `u` and `C-r` | undo and redo |
| `:g/<pattern>/d` | delete all lines containing pattern. |
| `:v/<pattern>/d` | delete all lines not containing pattern. |
| `:g/<pattern>/norm <commands>` | define and execute normal commands in lines that match the pattern |
| `dt"` | delete everything until the first quote |
| `ciw`| delete a word your cursor is on and start insert mode |
| `Ctrl-r<reg>` | in insert mode, insert from the named register. The 0 yank register is a useful register to insert from. |
| `Ctrl-b` | in insert mode, delete the previous word after adding inoremap <C-b> <C-O>diw to .vimrc. |
| `5o<Esc>` | insert 5 new lines and stay in normal mode |
| `X` | delete the character immediately to the left of the cursor |
| `C-a` | in insert mode, type the text you typed the last time you were in insert mode (it pastes from the ". registers which is the last inserted text) |
| `C-w` | in insert mode, correct the previous word |
| `J` | join two lines |
| `d/c/>/v/y` | verbs for delete/change/indent/visually select/yank |
| `S` | cut an entire line and enter insert mode |
| `C-x C-l` | omni line completion. In insert mode, repeat an existing full line |

**Mappings**

| Command | Description |
|---|---|
| `<leader>o` | insert an empty new line without entering insert mode |

## Window/Pane Control

| Command | Description |
|---|---|
| `ctrl + w _` | Max out the height of the current split |
| `ctrl + w` | Max out the width of the current split |
| `ctrl + w =` | Normalize all split sizes, which is very handy when resizing terminal |
| `Ctrl+W R` | Swap top/bottom or left/right split |
| `Ctrl+W T` | Break out current window into a new tabview |
| `Ctrl+W o` | Close every window in the current tabview but the current one |
| `:vsp or :sp` | vertical and horizontal split |
| `Ctrl-w t Ctrl-w K` | change two vertically split windows to horizonally split |
| `Ctrl-w t Ctrl-w H` | change two horizonally split windows to vertically split |
| `<C-w><C-w> and <C-w>r` | change in between windows |
| `C-W <arrow>` | change window |
| `:hide` and `:only` | hide current window or only show current window |

**Mappings**

| Command | Description |
|---|---|
| `<leader>s` | :split |
| `<leader>v` | :vsplit |
| `<leader>q` | :close |


## Search/Replace/Sort

| Command | Description |
|---|---|
| `Ctrl-O or Ctrl-I` | go to previous (old) or to the next (when performing searches, edit files, etc) |
| `:'<,'>sort` | sort a selection with sort command. By default lines starting with 0-9 will be sorted before A-Z followed lastly by lines starting with a-z. |
| `:'<,'>sort i` | i option to ignore case when sorting |
| `:'<,'>sort! i` | use a ! to reverse the sort |
| `:'<,'>sort u` | lastly the u option can be used to remove duplicates much like the uniq system command |
| `cgn` | change the next match of the last search, enter . to repeat the change forward. |
| `dgn` | delete the next match of the last search, enter . to repeat the delete forward. |
| `search /<<some-pattern>> and then :%s///n` | use the substitute command to count the number of matches for a particular pattern |
| `:'<,'>s/\%Vold/new/c'>>>'` | substitute old with new in a rectangular visual block. |

## Misc

| Command | Description |
|---|---|
| `C-l` or `:nohl` | redraws the screen and removes any search highlighting |
| `C-A / C-X` | increments/decrements a number |
| `:read/:r <filename> and :read!/:r!` | read contents of file into current cursor position, or read! output of command int current cursor position |
| `.` | repeat last command (a simple macro) |
| `:'<,'>s/\%Vold/new` | substitute old with new only within a rectangular visual block (visual selection) |
| `vit, vi”, vi’, di{, ci"` | v i whatever to select whatever’s in the last key’s pair. Works with d (delete) and change (c) and (y)ank too. Change the second character to `a` to include the surrounding character |
| `:earlier 10m and :later 50s` | navigating around the change tree by time |
| `C-o <command>` | quickly execute a single normal operation in insert mode |
| `Control-r= <<math expression>>` | use the expression register, whilst in insert mode, to edit-in simple math values |
| `Ctrl-r "` or `Ctrl-r, Ctrl-o, "` | paste yanked text into Vim command line. If you have literal control characters in what you have yanked, use the second option |
| `gx` | open the URL under the cursor in a browser |
| `gn` | search for a word you want to change and then change the next found occurrence with `cgn` once and then use the . (dot) to apply the change to the next word or skip one word with n. You can for example use it with d to delete the matches. |
| `>iB` | indent a function body |
| `*p` | paste from * register (clipboard) |
| `"*y$` | copy till the end of the line to * register (clipboard) |
| `undo (u) and redo (ctrl-r)` | rollback and roll forward through edit history. Vim stores these changes in a tree structure. |
| `:h digraph-table` | list digraphs |

The :r! command reads the results of a command. It's the same as suspending the vi session, running a command, redirecting its output to a temporary file, resuming your vi session, and reading in the contents from the temp. file.

**Mappings**

| Command | Description |
|---|---|
| `<leader><Space>` | (za) toggles a fold based on the indent level of the current cursor line |
