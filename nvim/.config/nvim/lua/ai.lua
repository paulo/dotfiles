-- AI assistant config

-- Configure copilot to complete with C-f
vim.keymap.set('i', '<C-f>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true


-- Avante

require('img-clip').setup({})
require('render-markdown').setup({
  file_types = { "markdown", "Avante" },
})
vim.treesitter.language.register('markdown', 'vimwiki')

require('avante_lib').load()
require('avante').setup({
  provider = "claude", -- The provider used in Aider mode or in the planning phase of Cursor Planning Mode
  auto_suggestions_provider = "copilot", -- high frequency, use cheap provider
  suggestion = {
    debounce = 600,
    throttle = 600,
  },
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-5-haiku-20241022",
    max_tokens = 4096,
    temperature = 0,
    disable_tools = false
  },
  mappings = {
    suggestion = {
      accept = "<M-l>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    }
  }
})

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
