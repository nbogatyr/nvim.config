-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Add in any extra non-vim opt here
local settings = require("config.settings")

-- Setup the colorscheme
vim.cmd.colorscheme(settings.default_colorscheme)
