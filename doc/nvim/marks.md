## Marks

vi has 26 "marks" and 26 "registers." A mark is set to any cursor location using the m command.
Each mark is designated by a single lower case letter.
Thus ma sets the 'a' mark to the current location, and mz sets the 'z' mark.
You can move to the line containing a mark using the ' (single quote) command.
Thus 'a moves to the beginning of the line containing the 'a' mark.
You can move to the precise location of any mark using the ` (backquote) command. Thus \`z will move directly to the exact location of the 'z' mark.

| Command | Description |
|---|---|
| `y'a` | yank from here to the line containing the mark named 'a' |
| `mm` | set a mark in the current file |
| `'m` | return back to the m mark in the current file |
| `mM` | set a global mark in any file |
| `'M` | return back to the global M mark |
