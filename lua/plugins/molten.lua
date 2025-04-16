return {
  "benlubas/molten-nvim",
  enabled = true,
  ft = { "quarto" },
  version = "^1.0.0",
  build = ":UpdateRemotePlugins",
  init = function()
    vim.g.molten_auto_image_popup = true
    vim.g.molten_auto_init_behavior = "raise"
    vim.g.molten_auto_open_output = false

    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true

    vim.g.molten_output_show_exec_time = true
    vim.g.molten_tick_rate = 200
  end,

  keys = {
    { "<leader>pm", desc = "Molten" },
    { "<leader>pmi", "<cmd>MoltenInit<cr>", desc = "Init Molten", mode = "n" },
    { "<leader>pme", "<cmd>MoltenEvaluateOperator<CR>", desc = "Evaluate Operator", silent = true, mode = "n" },
    { "<leader>pmr", "<cmd>MoltenReevaluateCell<CR>", desc = "Re-Eval Cell", silent = true, mode = "n" },
    { "<leader>pmo", "<cmd>MoltenEnterOutput<CR>", desc = "Open Output Window", silent = true, mode = "n" },
    { "<leader>pme", "<cmd>MoltenEvaluateVisual<CR>gv", desc = "Execute Visual Selection", silent = true, mode = "v" },
    { "<leader>pmh", "<cmd>MoltenHideOutput<CR>", desc = "Close Output Window", silent = true, mode = "n" },
    { "<leader>pmd", "<cmd>MoltenDelete<CR>", desc = "Delete Molten cell", silent = true, mode = "n" },
  },
}
