-- AI assistant config

-- copilot config
require('copilot').setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    hide_during_completion = true,
    debounce = 0,
    trigger_on_accept = true,
    keymap = {
      accept = "<C-f>",
    },
  },
})

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
  providers = {
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-sonnet-4-5-20250929",
      extra_request_body = {
        max_tokens = 4096,
        temperature = 0,
      },
      disable_tools = false
    }
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
