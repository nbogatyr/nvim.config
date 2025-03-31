return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  lazy = true,
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
  opts = {
    -- delay between pressing a key and opening which-key (milliseconds)
    -- this setting is independent of vim.opt.timeoutlen
    delay = 0,
    icons = {
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {},
    },

    triggers = {
      { '<leader>', mode = { 'n', 'v' } },
    },

    -- Document existing key chains
    spec = {
      { '<leader>l', group = 'LSP', icon = '' },
      { '<leader>lg', group = 'Goto' },
      { '<leader>ls', group = 'Show' },
      { '<leader>c', group = 'Code' },
      { '<leader>d', group = 'Document' },
      { '<leader>r', group = 'Rename' },
      { '<leader>s', group = 'Search' },
      { '<leader>f', group = 'Find' },
      { '<leader>w', group = 'Workspace' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>g', group = 'Git' },
      { '<leader>b', group = 'Buffer' },
      { '<leader>cb', group = 'Comment Block' },
      { '<leader>q', group = 'Sessions' },
    },
  },
}
