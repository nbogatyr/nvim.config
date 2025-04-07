return {
  "akinsho/bufferline.nvim",
  enabled = false,
  keys = {
    { "gB", "<cmd>BufferLinePick<cr>", mode = "n", desc = "Pick a buffer" },
    { "<leader>bx", "<cmd>BufferLinePick<cr>", mode = "n", desc = "Pick a buffer" },
    { "<leader>bX", "<cmd>BufferLinePickClose<cr>", mode = "n", desc = "Pick a buffer to delete" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", mode = "n", desc = "Pin/Unpin buffer" },
    { "<leader>bsd", "<cmd>BufferLineSortByDirectory<cr>", mode = "n", desc = "Sort by directory" },
    { "<leader>bse", "<cmd>BufferLineSortByExtension<cr>", mode = "n", desc = "Sort by extension" },
    { "<leader>bst", "<cmd>BufferLineSortByTabs<cr>", mode = "n", desc = "Sort by tabs" },
    { "<leader>bR", "<cmd>BufferLineTabRename<cr>", mode = "n", desc = "Rename current tab" },
    { "1", "<cmd>BufferLineGoToBuffer 1<cr>", mode = "n", desc = "Go to buffer 1" },
    { "2", "<cmd>BufferLineGoToBuffer 2<cr>", mode = "n", desc = "Go to buffer 2" },
    { "3", "<cmd>BufferLineGoToBuffer 3<cr>", mode = "n", desc = "Go to buffer 3" },
    { "4", "<cmd>BufferLineGoToBuffer 4<cr>", mode = "n", desc = "Go to buffer 4" },
    { "5", "<cmd>BufferLineGoToBuffer 5<cr>", mode = "n", desc = "Go to buffer 5" },
    { "6", "<cmd>BufferLineGoToBuffer 6<cr>", mode = "n", desc = "Go to buffer 6" },
    { "7", "<cmd>BufferLineGoToBuffer 7<cr>", mode = "n", desc = "Go to buffer 7" },
    { "8", "<cmd>BufferLineGoToBuffer 8<cr>", mode = "n", desc = "Go to buffer 8" },
    { "9", "<cmd>BufferLineGoToBuffer 9<cr>", mode = "n", desc = "Go to buffer 9" },
  },

  opts = {
    options = {
      -- See :h bufferline-configuration
      numbers = "none",
      indicator = {
        style = "none",
      },

      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },

      -- Enable groups
      groups = {
        options = {
          toggle_hidden_on_enter = true,
        },
        items = {
          require("bufferline.groups").builtin.pinned:with({ icon = "󰐃" }),
        },
      },

      themable = true,

      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
        {
          filetype = "snacks_layout_box",
          text = "",
          highlight = "NoiceCmdlinePopupTitle",
          text_align = "center",
        },
      },

      buffer_close_icon = "󰅖",
      left_trunc_marker = " ",
      right_trunc_marker = " ",

      show_buffer_close_icons = false,
      separator_style = { " ", " ", true },
      always_show_bufferline = false,
    },
  },
}
