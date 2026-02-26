return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = false,
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use the mini.nvim suite
  event = "BufRead *.md",
  ft = { "md", "markdown" },

  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    completions = {
      blink = {
        enabled = true,
      },
    },
    heading = {
      position = "inline",
      width = "block",
    },
  },
}
