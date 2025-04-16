return {
  -- Remember, this needs the 'jupytext' package for python to work
  "GCBallesteros/jupytext.nvim",
  config = true,
  lazy = false,
  ft = { "python", "json", "markdown", "quarto" },

  opts = {
    output_extension = "auto",
    style = "markdown",
    custom_language_formatting = {
      python = {
        extension = "qmd",
        style = "quarto",
        force_ft = "quarto",
      },
    },
  },
}
