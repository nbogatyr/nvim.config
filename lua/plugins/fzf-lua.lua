return {
  'ibhagwan/fzf-lua',
  version = false,
  enabled = false,
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {
    keys = {
      { '<leader>/', '<cmd>FzfLua live_grep<cr>', desc = 'Grep (Root Dir)' },
      { '<leader>:', '<cmd>FzfLua command_history<cr>', desc = 'Command History' },
      { '<leader><space>', '<cmd>FzfLua files<cr>', desc = 'Find Files (Root Dir)' },

      -- Just open the basic builtins search menu
      { '<leader>f.', '<cmd>FzfLua builtins<cr>', desc = 'Open FzfLua builtins search menu' },

      -- Buffer finding
      { '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = 'Find Buffer' },

      -- File finding keymaps
      { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find Files (Root Dir)' },
      { '<leader>fr', '<cmd>FzfLua oldfiles<cr>', desc = 'Find Recent Files' },

      -- Git related keymaps
      { '<leader>fgf', '<cmd>FzfLua git_files<cr>', desc = 'Find Git Files' },
      { '<leader>fgc', '<cmd>FzfLua git_commits<cr>', desc = 'Find Git Commits' },
      { '<leader>fgs', '<cmd>FzfLua git_status<cr>', desc = 'Find Git Statuses' },

      -- Searching keymaps
      { '<leader>s"', '<cmd>FzfLua registers<cr>', desc = 'Search Registers' },
      { '<leader>sa', '<cmd>FzfLua autocommands<cr>', desc = 'Search Autocommands' },
      { '<leader>scb', '<cmd>FzfLua curbuf<cr>', desc = 'Search Cur. Buf.' },
      { '<leader>sc', '<cmd>FzfLua command_history<cr>', desc = 'Command History' },
      { '<leader>sC', '<cmd>FzfLua commands<cr>', desc = 'Commands' },
      { '<leader>sd', '<cmd>FzfLua diagnostics_document<cr>', desc = 'Document Diagnostics' },
      { '<leader>sD', '<cmd>FzfLua diagnostics_workspace<cr>', desc = 'Workspace Diagnostics' },
      { '<leader>slg', '<cmd>FzfLua live_grep<cr>', desc = 'Grep (Root Dir)' },
      { '<leader>sh', '<cmd>FzfLua helptags<cr>', desc = 'Help Pages' },
      { '<leader>sH', '<cmd>FzfLua highlights<cr>', desc = 'Search Highlight Groups' },
      { '<leader>sj', '<cmd>FzfLua jumps<cr>', desc = 'Jumplist' },
      { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = 'Key Maps' },
      { '<leader>sl', '<cmd>FzfLua loclist<cr>', desc = 'Location List' },
      { '<leader>sM', '<cmd>FzfLua manpages<cr>', desc = 'Man Pages' },
      { '<leader>sm', '<cmd>FzfLua marks<cr>', desc = 'Jump to Mark' },
      { '<leader>sR', '<cmd>FzfLua resume<cr>', desc = 'Resume' },
      { '<leader>sq', '<cmd>FzfLua quickfix<cr>', desc = 'Quickfix List' },

      -- Grepping strings
      { '<leader>uC', '<cmd>FzfLua colorschemes<cr>', desc = 'Colorscheme with Preview' },
    },
  },
}
