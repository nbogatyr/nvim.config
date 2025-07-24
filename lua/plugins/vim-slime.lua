return {
  {
    "jpalardy/vim-slime",
    enabled = true,

    config = function()
      vim.g.slime_target = "kitty"
      vim.g.slime_cell_delimiter = "# %%"
      vim.g.slime_bracketed_paste = 1
      vim.g.slime_cell_delimiter = "# %%"

      vim.g.slime_no_mappings = 1
    end,

    keys = {
      -- { "<leader>rc", "<cmd>SlimeConfig<cr>", desc = "Slime Config" },
      -- { "<leader>r<space>", "<cmd>SlimeCellsSendAndGoToNext<cr>", desc = "" },
      -- { "<leader>r<Tab>", "<cmd>SlimeCellsNext<cr>", desc = "Go to next cell" },
      -- { "<leader>r<S-Tab>", "<cmd>SlimeCellsPrev<cr>", desc = "Go to previous cell" },
    },
  },
  {
    "klafyvel/vim-slime-cells",
    enabled = true,
    dependencies = { "jpalardy/vim-slime" },
    ft = { "python" },
    config = function()
      vim.cmd([[
    nmap <leader>r<space> <Plug>SlimeConfig
    " namp <leader>rm <Plug>SlimeMotionSend
    ]])
    end,

    keys = {
      { "<leader>rC", "<Plug>SlimeCellsSendAndGoToNext", desc = "Send current cell and go to next" },
      { "<leader>rc", "<Plug>SlimeSendCell", desc = "Send current cell to REPL" },
      { "]<leader>r", "<Plug>SlimeCellsNext", desc = "Go to next cell" },
      { "[<leader>r", "<Plug>SlimeCellsPrev", desc = "Go to previous cell" },
      { "<leader>rl", "<Plug>SlimeLineSend", desc = "Send current line to REPL" },
      { "<leader>r<tab>", "<cmd>SlimeSend<cr>", desc = "Send line or selection to REPL", mode = { "n", "v" } },
    },
  },
}
