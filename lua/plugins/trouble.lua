return {
  "folke/trouble.nvim",
  keys = {
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false win.position=bottom<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=bottom<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
  },
}
