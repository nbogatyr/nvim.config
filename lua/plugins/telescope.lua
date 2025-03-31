return {
  'nvim-telescope/telescope.nvim',
  version = false,
  enabled = false,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim' },
  },

  keys = {

    -- Basic keymaps
    {
      '<leader>,',
      '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>',
      desc = 'Switch Buffer',
    },
    { '<leader>/', '<cmd>Telescope live_grep<cr>', desc = 'Grep (Root Dir)' },
    { '<leader>:', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
    { '<leader><space>', '<cmd>Telescope find_files<cr>', desc = 'Find Files (Root Dir)' },

    -- Find related keymaps
    {
      '<leader>fb',
      '<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>',
      desc = 'Buffers',
    },
    {
      '<leader>fc',
      function()
        require('telescope.builtins').find_files { cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Find Config File',
    },
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files (Root Dir)' },
    { '<leader>fg', '<cmd>Telescope git_files<cr>', desc = 'Find Files (git-files)' },
    { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent' },

    -- Git Related Keymaps
    { '<leader>gc', '<cmd>Telescope git_commits<CR>', desc = 'Commits' },
    { '<leader>gs', '<cmd>Telescope git_status<CR>', desc = 'Status' },

    -- Search related keymaps
    { '<leader>s"', '<cmd>Telescope registers<cr>', desc = 'Registers' },
    { '<leader>sa', '<cmd>Telescope autocommands<cr>', desc = 'Auto Commands' },
    { '<leader>sb', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Buffer' },
    { '<leader>sc', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
    { '<leader>sC', '<cmd>Telescope commands<cr>', desc = 'Commands' },
    { '<leader>sd', '<cmd>Telescope diagnostics bufnr=0<cr>', desc = 'Document Diagnostics' },
    { '<leader>sD', '<cmd>Telescope diagnostics<cr>', desc = 'Workspace Diagnostics' },
    { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = 'Grep (Root Dir)' },
    { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = 'Help Pages' },
    { '<leader>sH', '<cmd>Telescope highlights<cr>', desc = 'Search Highlight Groups' },
    { '<leader>sj', '<cmd>Telescope jumplist<cr>', desc = 'Jumplist' },
    { '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = 'Key Maps' },
    { '<leader>sl', '<cmd>Telescope loclist<cr>', desc = 'Location List' },
    { '<leader>sM', '<cmd>Telescope man_pages<cr>', desc = 'Man Pages' },
    { '<leader>sm', '<cmd>Telescope marks<cr>', desc = 'Jump to Mark' },
    { '<leader>so', '<cmd>Telescope vim_options<cr>', desc = 'Options' },
    { '<leader>sR', '<cmd>Telescope resume<cr>', desc = 'Resume' },
    { '<leader>sq', '<cmd>Telescope quickfix<cr>', desc = 'Quickfix List' },

    -- Grepping strings
    {
      '<leader>sw',
      function()
        require('telescope.builtins').grep_string { word_match = '-w' }
      end,
      desc = 'Word (Root Dir)',
    },
    {
      '<leader>sW',
      function()
        require('telescope.builtins').grep_string { root = false, word_match = '-w' }
      end,
      desc = 'Word (cwd)',
    },
    {
      '<leader>sw',
      function()
        require('telescope.builtins').grep_string { mode = 'v' }
      end,
      desc = 'Selection (Root Dir)',
    },
    {
      '<leader>sW',
      function()
        require('telescope.builtins').grep_string { root = false }
      end,
      mode = 'v',
      desc = 'Selection (cwd)',
    },
    {
      '<leader>uC',
      function()
        require('telescope.builtins').colorscheme { enable_preview = true }
      end,
      desc = 'Colorscheme with Preview',
    },
  },
}
