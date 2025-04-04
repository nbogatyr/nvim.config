-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt
local g = vim.g

-- ╭─────────────────────────────────────────────────────────╮
-- │                         Globals                         │
-- ╰─────────────────────────────────────────────────────────╯
-- Taken from LazyVim defaults: https://www.lazyvim.org/configuration/general
-- This file is automatically loaded by plugins.core
g.mapleader = " "
g.maplocalleader = "\\"

-- LazyVim auto format
g.autoformat = false

-- LazyVim completion engine to use.
-- Can be one of: nvim-cmp, blink.cmp, 'auto'
g.lazyvim_cmp = "blink.cmp"

-- if the completion engine supports the AI source,
-- use that instead of inline suggestions
g.ai_cmp = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Set LSP servers to be ignored when used with `util.root.detectors.lsp`
-- for detecting the LSP root
g.root_lsp_ignore = { "copilot" }

-- Hide deprecation warnings
g.deprecation_warnings = false

-- Show the current document symbols location from Trouble in lualine
-- You can disable this for a buffer by setting `vim.b.trouble_lualine = false`
g.trouble_lualine = true

-- Fix markdown indentation settings
g.markdown_recommended_style = 0

-- ╭─────────────────────────────────────────────────────────╮
-- │                         Options                         │
-- ╰─────────────────────────────────────────────────────────╯
-- Disable relative line numbers
opt.relativenumber = true

-- Tabs ought to be 4 spaces
opt.tabstop = 4

--  See `:help 'list'`
--  and `:help 'listchars'`
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- Set sessions opts
opt.sessionoptions = { "buffers", "curdir", "folds", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

-- Enable auto write
opt.autowrite = true

-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"

-- Confirm to save changes before exiting modified buffer
opt.confirm = true

-- Enable highlighting of the current line
opt.cursorline = true

-- Use spaces instead of tabs
opt.expandtab = true

-- See ':h fillchars'
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.formatoptions = "jcqlnt" -- tcqj
opt.laststatus = 3 -- global statusline
opt.sidescrolloff = 8 -- Columns of context
