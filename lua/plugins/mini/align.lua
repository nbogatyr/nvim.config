local start_with_preview_keymap = "<leader>cLA"
local start_keymap = "<leader>cLa"

return {
  -- TODO: Fix interactions with snacks notifier
  "nvim-mini/mini.align",
  enabled = true,
  version = false,
  opts = {
    mappings = {
      start_with_preview = start_with_preview_keymap,
      start = start_keymap,
    },
  },

  keys = {
    { start_with_preview_keymap },
    { start_keymap },
  },
}
