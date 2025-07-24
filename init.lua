-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Add in any extra non-vim opt here
local settings = require("config.settings")

-- Setup the colorscheme
if vim.g.vscode ~= 1 then
  vim.cmd.colorscheme(settings.default_colorscheme)
end

-- Add in any user commands
require("config.commands")

-- Adjust the highlight groups
local config = vim.fn["gruvbox_material#get_configuration"]()
local palette = vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)

vim.api.nvim_set_hl(0, "MarkviewPalette1", { link = "MarkdownH1" })
vim.api.nvim_set_hl(0, "MarkviewPalette1", { link = "MarkdownH1" })
vim.api.nvim_set_hl(0, "MarkviewPalette2", { link = "MarkdownH2" })
vim.api.nvim_set_hl(0, "MarkviewPalette3", { link = "MarkdownH3" })
vim.api.nvim_set_hl(0, "MarkviewPalette4", { link = "MarkdownH4" })
vim.api.nvim_set_hl(0, "MarkviewPalette5", { link = "MarkdownH5" })
vim.api.nvim_set_hl(0, "MarkviewPalette6", { link = "MarkdownH6" })
