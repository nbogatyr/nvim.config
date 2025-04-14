-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Only show virtual diagnostic lines on current line and not both lines and text
local og_virt_text
local og_virt_line
vim.api.nvim_create_autocmd({ "CursorMoved", "DiagnosticChanged" }, {
  group = vim.api.nvim_create_augroup("diagnostic_only_virtlines", {}),
  callback = function()
    if og_virt_line == nil then
      og_virt_line = vim.diagnostic.config().virtual_lines
    end

    -- ignore if virtual_lines.current_line is disabled
    if not (og_virt_line and og_virt_line.current_line) then
      if og_virt_text then
        vim.diagnostic.config({ virtual_text = og_virt_text })
        og_virt_text = nil
      end
      return
    end

    if og_virt_text == nil then
      og_virt_text = vim.diagnostic.config().virtual_text
    end

    local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1

    if vim.tbl_isempty(vim.diagnostic.get(0, { lnum = lnum })) then
      vim.diagnostic.config({ virtual_text = og_virt_text })
    else
      vim.diagnostic.config({ virtual_text = false })
    end
  end,
})

-- Redraw diagnostics on mode changes
vim.api.nvim_create_autocmd("ModeChanged", {
  group = vim.api.nvim_create_augroup("diagnostic_redraw", {}),
  callback = function()
    pcall(vim.diagnostic.show)
  end,
})

-- Add keymap for markdown-toc to create a toc at cursor only in markdown files
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("formatters_markdown", {}),
  pattern = { "md", "markdown" },
  callback = function()
    vim.schedule(function()
      vim.keymap.set("n", "<leader>czt", function()
        require("config.extras").insert_at_start_of_line("<!-- toc -->")
        require("conform").format({ timeout_ms = 500 })
      end, { desc = "Creates a table of contents for the current markdown buffer using markdown-toc" })
    end)
  end,
})

-- Add keymap for CsvView keymaps so that they only trigger in CSV files
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("formatters_csv", {}),
  pattern = { "csv" },
  callback = function()
    vim.schedule(function()
      vim.keymap.set(
        "n",
        "<leader>cvt",
        vim.cmd["CsvViewToggle"],
        { desc = "Creates a table of contents for the current markdown buffer using markdown-toc" }
      )
    end)
  end,
})

-- Force tabline to always show no matter what
-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function()
--     vim.schedule(function()
--       vim.opt.showtabline = 2
--     end)
--   end,
-- })
