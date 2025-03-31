return {
  'olimorris/persisted.nvim',
  event = 'BufReadPre', -- Ensure the plugin loads only when a buffer has been loaded
  opts = {
    use_git_branch = true,
    autoload = false,
    on_autoload_no_session = function()
      vim.notify 'No session found for CWD'
    end,
  },

  keys = {
    { '<leader>qa', '<cmd>SessionStart<cr>', desc = 'Starts Session' },
    { '<leader>qb', '<cmd>SessionStop<cr>', desc = 'Stops Session' },
    { '<leader>qs', '<cmd>SessionSave<cr>', desc = 'Save Session' },
    { '<leader>qS', '<cmd>SessionSelect<cr>', desc = 'Select Session' },
    { '<leader>ql', '<cmd>SessionLoad<cr>', desc = 'Load CWD Session' },
    { '<leader>qL', '<cmd>SessionLoadLast<cr>', desc = 'Load Last Session' },
    { '<leader>qd', '<cmd>SessionDelete<cr>', desc = 'Delete Cur. Session' },
  },
}
