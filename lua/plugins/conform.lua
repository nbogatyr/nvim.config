return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  opts = {
    notify_on_error = true,
    notify_no_formatters = true,
    formatters_by_ft = {
      python = { "isort", "black" },
    },
  },
}
