-- AI assistant config

require('img-clip').setup ({})
require('render-markdown').setup ({
  file_types = { "markdown", "Avante" },
})
vim.treesitter.language.register('markdown', 'vimwiki')

require('avante_lib').load()
require('avante').setup ({
  provider = "copilot", -- Recommend using Claude
  auto_suggestions_provider = "copilot",
})

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
