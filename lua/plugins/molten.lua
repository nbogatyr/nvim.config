return {
  "benlubas/molten-nvim",
  enabled = false,
  version = "^1.0.0",
  build = ":UpdateRemotePlugins",
  init = function()
    vim.g.molten_auto_image_popup = true
    vim.g.molten_auto_init_behavior = "raise"
    vim.g.molten_auto_open_output = false

    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true

    vim.g.molten_output_show_exec_time = true
    vim.g.molten_tick_rate = 150
  end,

  keys = {
    { "n", "<leader>Me", ":MoltenEvaluateOperator<CR>", desc = "evaluate operator", silent = true },
    {
      "n",
      "<leader>Mo",
      ":noautocmd MoltenEnterOutput<CR>",
      desc = "open output window",
      silent = true,
    },
    { "n", "<leader>Mr", ":MoltenReevaluateCell<CR>", desc = "re-eval cell", silent = true },
    {
      "v",
      "<leader>Me",
      ":<C-u>MoltenEvaluateVisual<CR>gv",
      desc = "execute visual selection",
      silent = true,
    },
    { "n", "<leader>Mh", ":MoltenHideOutput<CR>", desc = "close output window", silent = true },
    { "n", "<leader>Md", ":MoltenDelete<CR>", desc = "delete Molten cell", silent = true },
  },
}
