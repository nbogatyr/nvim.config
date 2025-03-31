-- Add any extra plugin related keybinds here
-- Should be loaded last in the init.lua file as a result

local wk = require 'which-key'
wk.add {

  -- Adds a mapping for Lazy, just for easy of access
  { '<leader>ll', '<cmd>Lazy<cr>', desc = 'Open Lazy', mode = 'n', group = 'Lazy' },
}
