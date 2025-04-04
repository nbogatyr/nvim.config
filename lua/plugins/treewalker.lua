return {
  "aaronik/treewalker.nvim",

  opts = {
    -- Whether to briefly highlight the node after jumping to it
    highlight = true,

    -- How long should above highlight last (in ms)
    highlight_duration = 250,

    -- The color of the above highlight. Must be a valid vim highlight group.
    -- (see :h highlight-group for options)
    highlight_group = "CursorLine",
  },

  keys = {
    -- movement
    { mode = { "n", "v" }, "<C-k>", "<cmd>Treewalker Up<cr>", silent = true },
    { mode = { "n", "v" }, "<C-j>", "<cmd>Treewalker Down<cr>", silent = true },
    { mode = { "n", "v" }, "<C-h>", "<cmd>Treewalker Left<cr>", silent = true },
    { mode = { "n", "v" }, "<C-l>", "<cmd>Treewalker Right<cr>", silent = true },

    -- swapping
    { mode = "n", "<C-M-k>", "<cmd>Treewalker SwapUp<cr>", silent = true },
    { mode = "n", "<C-M-j>", "<cmd>Treewalker SwapDown<cr>", silent = true },
    { mode = "n", "<C-M-h>", "<cmd>Treewalker SwapLeft<cr>", silent = true },
    { mode = "n", "<C-M-l>", "<cmd>Treewalker SwapRight<cr>", silent = true },
  },
}
