return {
  "obsidian-nvim/obsidian.nvim",
  enabled = true,
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
    "blink.cmp",
    "snacks.nvim",
    "nvim-treesitter",
    -- "render-markdown.nvim",
  },
  opts = {
    workspaces = {
      { name = "personal", path = "~/notes/personal" },
      {
        name = "work",
        path = "~/notes/work",
      },
    },
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },

    -- templates = {
    --   folder = "templates",
    -- },
    daily_notes = {
      folder = "dailies",
      default_tags = { "daily-notes" },
    },
  },

  keys = {
    { "<leader>O", desc = "+Obsidian" },
    { "<leader>OT", "<cmd>ObsidianToday<cr>", desc = "Create a new note for today" },
    { "<leader>Ol", "<cmd>ObsidianLinks<cr>", desc = "Search links" },
    { "<leader>On", "<cmd>ObsidianNew<cr>", desc = "New note" },
    { "<leader>O<Space>", "<cmd>ObsidianQuickSwitch<cr>", desc = "Switch between notes" },
    { "<leader>Os", "<cmd>ObsidianSearch<cr>", desc = "Search across notes" },
    { "<leader>Of", "<cmd>ObsidianTags<cr>", desc = "Find tags" },
    { "<leader>ON", "<cmd>ObsidianTomorrow<cr>", desc = "Create a new note for tomorrow" },
    { "<leader>Oy", "<cmd>ObsidianYesterday<cr>", desc = "Create a new note for yesterday" },
    { "<leader>O<tab>", "<cmd>ObsidianBacklinks<cr>", desc = "Show backlinks" },
    { "<leader>Or", "<cmd>ObsidianRename<cr>", desc = "Rename file" },
    { "<leader>Ow", "<cmd>ObsidianWorkspace<cr>", desc = "Switch Obsidian Workspace" },
    { "<leader>OF", "<cmd>ObsidianTOC<cr>", desc = "Navigate TOC" },
  },
}
