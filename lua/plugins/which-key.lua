return {
  "which-key.nvim",

  opts = {
    preset = "classic",
    width = { min = 5 },

    win = {
      border = "rounded",
      padding = { 1, 2 },
      title_pos = "center",
    },

    spec = {
      { "<leader>cb", group = "Comment Box" },
      { "<leader>O", group = "Obsidian" },
      { "<leader>cS", group = "Surround" },
    },
  },
}
