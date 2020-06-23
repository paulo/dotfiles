## Registers

**To access a register, you type `"<reg>` before a command, where `<reg>` is the name of a register.**

| Command | Description |
|---|---|
| `"<reg>yy` | copy the current line into register, or append using a capital letter (<REG>) |
| `"<reg>p` | paste from the register |
| `"+p`| paste from system clipboard on Linux (+ is the register that refers to the system clipboard) |
| `"*p` | paste from system clipboard on Windows (or from "mouse highlight" clipboard on Linux) |
| `girw` | replace inner word with register |
| `:reg` | access all currently defined registers type |
| `"/` | register of the last search command |
| `":` | register of the last command |
| `:help registers` | More info |

See https://stackoverflow.com/questions/3997078/how-to-paste-yanked-text-into-vim-command-line

If you yank text without assigning it to a particular register, then it will be assigned to the `0 register`, as well as being saved in the default `"` register. The difference between the `0` and `"` registers is that `0` is only populated with yanked text, whereas the default register is also populated with text deleted using `d/D/x/X/c/C/s/S` commands.

Useful when copying, delete something and replace it with the copied text:
- Yank the text you want to copy with `y<motion>` - this text is saved in `"` and `0` registers
- Delete the text you want to replace with d`<motion>` - this text is saved in `"` register
- Paste the yanked text with `"0p` (where `"` is the command to use a register for the next command)

Note that `p` or `P` pastes from the default register. The longhand equivalent would be `""p (or ""P)` and `"0` holds the last yank. The same way `"0` holds the last yank, `"1` holds the last delete or change.
