return {
  "nbogatyr/obsidian.nvim",
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      { name = "personal", path = "~/notes/personal" },
      {
        name = "work",
        path = "~/notes/work",
      },
    },

    daily_notes = {
      folder = "dailies",
      default_tags = { "daily-notes" },
    },

    mappings = {
      ["<leader>Ot"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },

    follow_url_func = function(url)
      vim.fn.jobstart({ "wslview", url })
    end,

    ui = {
      enable = false,
    },
  },

  keys = {
    { "<leader>OT", "<cmd>ObsidianToday<cr>", desc = "Create a new note for today" },
    { "<leader>Ol", "<cmd>ObsidianLinks<cr>", desc = "Search links" },
    { "<leader>On", "<cmd>ObsidianNew<cr>", desc = "New note" },
    { "<leader>Oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Switch between notes" },
    { "<leader>Os", "<cmd>ObsidianSearch<cr>", desc = "Search across notes" },
    { "<leader>Of", "<cmd>ObsidianTags<cr>", desc = "Find tags" },
    { "<leader>ON", "<cmd>ObsidianTomorrow<cr>", desc = "Create a new note for tomorrow" },
    { "<leader>Oy", "<cmd>ObsidianYesterday<cr>", desc = "Create a new note for yesterday" },
    { "<leader>O<tab>", "<cmd>ObsidianBacklinks<cr>", desc = "Show backlinks" },
  },
}
