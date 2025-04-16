return {
  "which-key.nvim",

  opts = {
    preset = "classic",
    width = { min = 5 },
    delay = function(ctx)
      return ctx.plugin and 0 or 50
    end,

    win = {
      border = "rounded",
      padding = { 1, 2 },
      title_pos = "center",
    },

    spec = {
      { "<leader>P", icon = " ", group = "Python" },
      { "<leader>cT", group = "Treesitter" },
    },
  },
}
