return {
  "which-key.nvim",

  opts = {
    preset = "classic",
    width = { min = 5 },
    delay = function(ctx)
      return ctx.plugin and 0 or 250
    end,

    win = {
      border = "rounded",
      padding = { 1, 2 },
      title_pos = "center",
    },

    spec = {
      { "<leader>p", icon = " ", group = "Python" },
      { "<leader>cT", group = "Treesitter" },
      { "<leader>O", group = "Obsidian", icon = "🪨" },
      { "<leader>pm", group = "Molten", icon = "" },
      { "<leader>pq", group = "Quarto", icon = "" },
      { "<leader>T", group = "Terminal", icon = "" },
      { "<leader>r", group = "REPL", icon = "" },
    },
  },
}
