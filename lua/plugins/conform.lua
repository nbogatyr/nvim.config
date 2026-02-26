return {
  "stevearc/conform.nvim",
  enabled = true,
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  opts = {
    notify_on_error = true,
    notify_no_formatters = true,

    formatters_by_ft = {
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
      markdown = { "prettier", "markdown-toc" },
    },
  },
}
