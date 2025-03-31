-- Highlight todo, notes, etc in comments
-- Repo link: https://github.com/folke/todo-comments.nvim
return {
  'folke/todo-comments.nvim',
  lazy = true,
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim', lazy = true },
  opts = {
    -- Show signs in the signs column
    signs = true,
    keywords = {
      FIX = {
        icon = ' ', -- icon used for the sign, and in search results
        color = 'error', -- can be a hex color, or a named color (see below)
        alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
      },
      TODO = { icon = ' ', color = 'info' },
      HACK = { icon = ' ', color = 'warning' },
      WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
      PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
      NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
      TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
    },
  },

  keys = {
    {
      ']t',
      function()
        require('todo-comments').jump_next()
      end,
      desc = 'Jump to the next TODO comment',
      mode = 'n',
    },
    {
      '[t',
      function()
        require('todo-comments').jump_prev()
      end,
      desc = 'Jumpy to the previous TODO comment',
      mode = 'n',
    },
  },
}
