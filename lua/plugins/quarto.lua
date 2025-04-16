return {
  "quarto-dev/quarto-nvim",
  dependencies = {
    "jmbuhr/otter.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-lspconfig",
  },
  enabled = true,

  lazy = true,

  ft = { "quarto", "markdown", "python" },

  opts = {
    debug = false,

    closePreviewOnExit = true,

    lspFeatures = {
      enabled = true,
      chunks = "curly",
      languages = { "r", "python", "julia", "bash", "html" },
      diagnostics = {
        enabled = true,
        triggers = { "BufWritePost" },
      },

      completion = {
        enabled = true,
      },
    },

    codeRunner = {
      enabled = true,
      default_method = "slime", -- "molten", "slime", "iron" or <function>
      ft_runners = { python = "molten" }, -- filetype to runner, ie. `{ python = "molten" }`.
      -- Takes precedence over `default_method`
      never_run = { "yaml" }, -- filetypes which are never sent to a code runner
    },
  },

  keys = {
    { "<leader>pq", desc = "Quarto" },
    {
      "<leader>pqp",
      function()
        require("quarto").quartoPreview()
      end,
      silent = true,
      mode = "n",
      desc = "Preview with Quarto",
    },
    {
      "<leader>pqP",
      function()
        require("quarto").quartoClosePreview()
      end,
      silent = true,
      mode = "n",
      desc = "Close Quarto Preview",
    },
    {
      "<leader>pqr",
      function()
        require("quarto.runner").run_cell()
      end,
      desc = "Run cell",
      silent = true,
      mode = "n",
    },
    {
      "<leader>pqa",
      function()
        require("quarto.runner").run_above()
      end,
      mode = "n",
      desc = "Run cell and above",
      silent = true,
    },
    {
      "<leader>pqA",
      function()
        require("quarto.runner").run_all()
      end,
      mode = "n",
      desc = "Run all cells",
      silent = true,
    },
    {
      "<leader>pql",
      function()
        require("quarto.runner").run_line()
      end,
      mode = "n",
      desc = "Run line",
      silent = true,
    },
    {
      "<leader>pqR",
      function()
        require("quarto.runner").run_range()
      end,
      mode = "v",
      desc = "Run visual range",
      silent = true,
    },
    {
      "<leader>pqE",
      function()
        require("quarto.runner").run_all(true)
      end,
      mode = "n",
      desc = "Run every cell",
      silent = true,
    },
  },
}
