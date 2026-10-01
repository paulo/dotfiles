-- AI assistant config

-- copilot config
require('copilot').setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    hide_during_completion = false,
    debounce = 0,
    trigger_on_accept = true,
    keymap = {
      accept = "<C-f>",
    },
  },
})
