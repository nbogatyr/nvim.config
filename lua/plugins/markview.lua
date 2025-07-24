return {
  {
    "OXY2DEV/markview.nvim",
    enabled = true,
    lazy = false,

    opts = function()
      local presets = require("markview.presets")

      return {
        experimental = {
          check_rtp = false,
        },
        preview = {
          enable = true,
          enable_hybrid_mode = true,
          linewise_hybrid_mode = true,
          hybrid_modes = { "n" },
          debounce = 10,
          filetypes = { "markdown", "md", "rmd", "quarto", "codecompanion" },
          ignore_buftypes = {},

          condition = function(buffer)
            local ft, bt = vim.bo[buffer].ft, vim.bo[buffer].bt

            if bt == "nofile" and ft == "codecompanion" then
              return true
            elseif bt == "nofile" then
              return false
            else
              return true
            end
          end,
        },

        markdown = {
          headings = {
            enable = true,
            shift_width = 0,
            textoff = 7,

            heading_1 = {
              style = "label",
              sign = "󰌕 ",
              sign_hl = "MarkviewHeading1Sign",
              align = "left",

              padding_left = "╾──────╴ ",
              padding_right = " ╶──────╼",
              icon = "",
              hl = "MarkviewHeading1",
            },
            heading_2 = {
              style = "label",
              sign = "󰌖 ",
              sign_hl = "MarkviewHeading2Sign",
              align = "left",

              padding_left = "╾─────╴ ",
              padding_right = " ╶─────╼",
              icon = "",
              hl = "MarkviewHeading2",
            },
            heading_3 = {
              style = "label",
              align = "left",

              padding_left = "╾────╴ ",
              padding_right = " ╶────╼",
              icon = "",
              hl = "MarkviewHeading3",
            },
            heading_4 = {
              style = "label",
              align = "left",

              padding_left = "╾───╴ ",
              padding_right = " ╶───╼",
              icon = "",
              hl = "MarkviewHeading4",
            },
            heading_5 = {
              style = "label",
              align = "left",

              padding_left = "╾──╴ ",
              padding_right = " ╶──╼",
              icon = "",
              hl = "MarkviewHeading5",
            },
            heading_6 = {
              style = "label",
              align = "left",

              padding_left = "╾─╴ ",
              padding_right = " ╶─╼",
              icon = "",
              hl = "MarkviewHeading6",
            },
            ---_
          },
          tables = presets.tables.rounded,
        },
      }
    end,

    dependencies = {
      "saghen/blink.cmp",
    },
  },
}
