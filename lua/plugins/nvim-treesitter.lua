return {
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
        },

        goto_next_end = {
          ["]zC"] = "@comment.outer",
          ["]zB"] = "@block.outer",
          ["]zF"] = "@function.outer",
          ["]zQ"] = "@class.outer",
          ["]zA"] = "@parameter.inner",
        },

        goto_previous_start = {
          ["[zc"] = "@comment.outer",
          ["[zb"] = "block.outer",
          ["[zf"] = "@function.outer",
          ["[zq"] = "@class.outer",
          ["[za"] = "@parameter.inner",
        },

        goto_previous_end = {
          ["[zC"] = "@comment.outer",
          ["[zB"] = "@block.outer",
          ["[zF"] = "@function.outer",
          ["[zQ"] = "@class.outer",
          ["[zA"] = "@parameter.inner",
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
}
