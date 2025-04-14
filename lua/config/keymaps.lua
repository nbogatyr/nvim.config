-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Quit out of insert mode using Alt-Q instead of Esc
map("i", "A-q", "<Esc>", { desc = "Quit out of insert mode" })
