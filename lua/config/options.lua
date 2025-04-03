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
g.autoformat = true

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
opt.relativenumber = false

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
opt.foldlevel = 99
opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
opt.formatoptions = "jcqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.jumpoptions = "view"
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.ruler = false -- Disable the default ruler
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
opt.termguicolors = true -- True color support
opt.timeoutlen = 200 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
