local move_prefix = "M-"
local move_keys = { "h", "j", "k", "l" }

return {
  "nvim-mini/mini.move",
  version = false,
  lazy = true,
  -- event = "VeryLazy",
  opts = {

    mappings = {
      left = "<" .. move_prefix .. move_keys[1] .. ">",
      down = "<" .. move_prefix .. move_keys[2] .. ">",
      up = "<" .. move_prefix .. move_keys[3] .. ">",
      right = "<" .. move_prefix .. move_keys[4] .. ">",
    },
    options = {
      reindent_linewise = true,
    },
  },

  keys = {
    { "<" .. move_prefix .. move_keys[1] .. ">" },
    { "<" .. move_prefix .. move_keys[2] .. ">" },
    { "<" .. move_prefix .. move_keys[3] .. ">" },
    { "<" .. move_prefix .. move_keys[4] .. ">" },
  },
}
