return {
  {
    "nvim-treesitter/nvim-treesitter",

    opts = {
      textobjects = {

        move = {
          enable = true,
          -- Enable jumps in the jump list
          set_jumps = true,

          goto_next_start = {
            ["]zc"] = "@comment.outer",
            ["]zb"] = "@block.outer",
            ["]zf"] = "@function.outer",
            ["]zq"] = "@class.outer",
            ["]za"] = "@parameter.inner",
            ["]ze"] = { query = "@code_cell.inner", desc = "Next code block" },
          },

          goto_next_end = {
            ["]zC"] = "@comment.outer",
            ["]zB"] = "@block.outer",
            ["]zF"] = "@function.outer",
            ["]zQ"] = "@class.outer",
            ["]zA"] = "@parameter.inner",
            ["]zE"] = { query = "@code_cell.outer", desc = "Next code block end" },
          },

          goto_previous_start = {
            ["[zc"] = "@comment.outer",
            ["[zb"] = "block.outer",
            ["[zf"] = "@function.outer",
            ["[zq"] = "@class.outer",
            ["[za"] = "@parameter.inner",
            ["[ze"] = { query = "@code_cell.inner", desc = "Previous code block" },
          },

          goto_previous_end = {
            ["[zC"] = "@comment.outer",
            ["[zB"] = "@block.outer",
            ["[zF"] = "@function.outer",
            ["[zQ"] = "@class.outer",
            ["[zA"] = "@parameter.inner",
            ["[zE"] = { query = "@code_cell.outer", desc = "Previous code block end" },
          },
        },

        select = {
          enable = true,
          lookahead = true,

          keymaps = {
            ["izb"] = "@block.inner",
            ["azb"] = "@block.outer",
            ["izf"] = "@function.inner",
            ["azf"] = "@function.outer",
            ["iza"] = "@parameter.inner",
            ["aza"] = "@parameter.outer",
            ["izq"] = "@class.inner",
            ["azq"] = "@class.outer",
            ["ize"] = { query = "@code_cell.inner", desc = "Select code block" },
            ["aze"] = { query = "@code_cell.outer", desc = "Select code block" },
          },
        },

        swap = {
          enable = true,
          swap_next = {
            ["<leader>cTe"] = "@code_cell.outer",
            ["<leader>cTq"] = "@class.outer",
            ["<leader>cTa"] = "@parameter.inner",
            ["<leader>cTf"] = "@function.outer",
            ["<leader>cTb"] = "@block.outer",
          },
          swap_previous = {
            ["<leader>cTE"] = "@code_cell.outer",
            ["<leader>cTQ"] = "@class.outer",
            ["<leader>cTA"] = "@parameter.inner",
            ["<leader>cTF"] = "@function.outer",
            ["<leader>cTB"] = "@block.outer",
          },
        },

        -- lsp_interop = {
        --   enable = true,
        --   border = "none",
        --   floating_preview_opts = {},
        --   peek_definition_code = {
        --     ["<leader>df"] = "@function.outer",
        --     ["<leader>dF"] = "@class.outer",
        --   },
        -- },
      },
    },
  },
  {
    "nvim-treesitter",
    opts = function(_, opts)
      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
    end,
  },
  { "nvim-treesitter-textobjects", event = "VeryLazy" },
}
