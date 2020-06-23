## Text objects

**The text object or motion can either be a text construct, e.g., a word, a sentence, a paragraph, or a motion, e.g., forward a line, back one page, end of the line.**

| Command | Description |
|---|---|
| `aw` and `iw` | word |
| `as` and `is` | sentence |
| `ap` and `ip` | paragraph |
| `a”` and `i”` | double quoted string |
| `a’` and `i’` | single quoted string |
| `a\`` and `i\`` | back quoted string |
| `/'` | search pattern |
| `a)` and `i)` or `ab` and `ib` | parenthesized block |
| `a]` and `i]` | bracketed block |
| `a}` and `i}` or `aB` and `iB` | brace block |
| `at` and `it` | tag block |
| `a>` and `i>` | single tag |
| `aa` and `ia` | function argument |
| `ai` and `ii` | current indentation level |
| `ar` and `ir` | Ruby block |

The % motion is another way to match a pair of parentheses. Entering % on an opening parenthesis will move the cursor to the closing parenthesis.
