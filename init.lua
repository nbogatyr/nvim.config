--------------------
--| Vim Settings |--
--------------------
-- Vim Options go here
require 'config.options'

-- Any sort of general, non-plugin specific keymaps go here
require 'config.keymaps'

-- Autocmds unrelated to plugins go here
require 'config.autocmds'

-- Bootstrap lazy.nvim and load every plugin
require 'config.lazy'

-- Add in any extra non-vim opt here
local settings = require 'config.settings'

-- Setup the colorscheme
vim.cmd.colorscheme(settings.default_colorscheme)

-- Load up my custom pickers
require 'config.pickers'
