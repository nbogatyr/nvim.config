return {
  "mfussenegger/nvim-lint",
  event = "LazyFile",

  opt = {
    -- Events to trigger linters
    events = {
      "BufWritePost",
      "BufReadPost",
      "InsertLeave",
    },

    linters_by_ft = {
      markdown = { "markdownlint" },
      python = { "ruff" },
    },

    linters = {},
  },
}
