return {
  {
    "GCBallesteros/NotebookNavigator.nvim",
    lazy = true,
    enabled = false,

    ft = { "python" },

    dependencies = {
      "nvim-mini/mini.comment",
      -- "Vigemus/iron.nvim", -- repl provider
      -- "akinsho/toggleterm.nvim", -- alternative repl provider
      "molten-nvim", -- alternative repl provider
      "anuvyklack/hydra.nvim",
    },

    keys = function()
      local nn = require("notebook-navigator")
      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

      local next_cell_repeat, prev_cell_repeat = ts_repeat_move.make_repeatable_move_pair(function()
        nn.move_cell("d")
      end, function()
        nn.move_cell("u")
      end)

      local my_keys = {
        {
          "]h",
          next_cell_repeat,
          desc = "Goto next Notebook Cell",
        },
        {
          "[h",
          prev_cell_repeat,
          desc = "Goto prev. Notebook Cell",
        },
        {
          "<leader>rx",
          "<cmd>lua require('notebook-navigator').run_cell()<cr>",
          desc = "Run Notebook Cell",
          mode = "n",
        },
        { "<leader>rX", desc = "Execute Notebook Cells" },
        {
          "<leader>rXn",
          "<cmd>lua require('notebook-navigator').run_and_move()<cr>",
          desc = "Run Notebook Cell and Goto Next",
          mode = "n",
        },
        {
          "<leader>rXa",
          function()
            nn.run_all_cells()
          end,
          desc = "Run all notebook cells",
        },
        {
          "<leader>rXb",
          function()
            nn.run_cells_below()
          end,
          desc = "Run current and below cells",
        },
        {
          "<leader>pM",
          desc = "Merge Notebook Cell",
        },
        { "<leader>pM", desc = "Merge Notebook Cell" },
        {
          "<leader>pMu",
          function()
            nn.merge_cell("u")
          end,
          desc = "Merge Notebook Cell Above",
        },
        {
          "<leader>pMd",
          function()
            nn.merge_cell("d")
          end,
          desc = "Merge Notebook Cell Above",
        },
        {
          "<leader>pS",
          function()
            nn.split_cell()
          end,
          desc = "Split Notebook Cell",
        },
        { "<leader>pA", desc = "Add Notebook Cell" },
        {
          "<leader>pAu",
          function()
            nn.add_cell_above()
          end,
          desc = "Add Notebook Cell Above",
        },
        {
          "<leader>pAd",
          function()
            nn.add_cell_below()
          end,
          desc = "Add Notebook Cell Below",
        },
      }
      return my_keys
    end,

    -- opts = {
    --   activate_hydra_keys = "<leader>ph", -- activate hydra keys for notebook navigator
    --   syntax_highlight = true, -- enable syntax highlighting for notebook cells
    -- },
    config = function()
      local nn = require("notebook-navigator")
      nn.setup({
        repl_provider = "molten",
      })
    end,
  },
  -- {
  --   "nvim-mini/mini.ai",
  --   lazy = true,
  --   opts = function(_, opts)
  --     local nn = require("notebook-navigator")
  --
  --     -- Extend the opts.custom_textobjects if it exists
  --     opts.custom_textobjects = {}
  --
  --     opts.custom_textobjects.h = nn.miniai_spec
  --     return opts
  --   end,
  -- },
}
