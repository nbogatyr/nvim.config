return {
  "olimorris/persisted.nvim",
  enabled = false,
  event = "BufReadPre", -- Ensure the plugin loads only when a buffer has been loaded
  opts = {
    follow_cwd = false,
  },
  keys = {
    {
      "<leader>qw",
      "<cmd>SessionSave<cr>",
      desc = "Write/Setup current session",
    },
    {
      "<leader>qr",
      "<cmd>SessionLoad<cr>",
      desc = "Read default session",
    },
    {
      "<leader>qd",

      "<cmd>SessionDelete<cr>",
      desc = "Delete current session",
    },
    {
      "<leader>qS",
      "<cmd>SessionSelect<cr>",
      desc = "Select session",
    },
    { "<leader>fs", "<cmd>SessionSelect<cr>", desc = "Find Sessions" },
  },
}
