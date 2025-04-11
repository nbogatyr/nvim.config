return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, -- if you use the mini.nvim suite
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

      backgrounds = {
        "RenderMarkdownH4Bg",
        "RenderMarkdownH5Bg",
        "RenderMarkdownH1Bg",
        "RenderMarkdownH2Bg",
        "RenderMarkdownH3Bg",
        "RenderMarkdownH6Bg",
      },
    },
  },
}
