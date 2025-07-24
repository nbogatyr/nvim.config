return {
  "danymat/neogen",
  config = true,
  lazy = true,
  event = "VeryLazy",

  opts = {
    snippet_engine = "luasnip",
    insert_after_comment = true,

    languages = {
      python = {
        template = {
          annotation_convention = "google_docstrings",
        },
      },
    },
  },

  keys = {
    { "<leader>D", "<cmd>Neogen<cr>", desc = "Generate Docstring", mode = "n" },
  },
}
