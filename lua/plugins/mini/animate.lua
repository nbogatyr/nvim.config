return {
  'echasnovski/mini.animate',
  version = false,
  lazy = false,
  enabled = true,
  event = 'VimEnter',
  opts = {

    cursor = {
      enable = true,
    },
    scroll = {
      enable = false,
    },
    resize = {
      enable = true,
    },
    open = {
      enable = true,
    },
    close = {
      enable = true,
    },
  },
  keys = {
    {
      '<leader>taa',
      function()
        vim.g.minianimate_disable = not vim.g.minianimate_disable
      end,
      desc = 'Toggle All Mini Animations',
    },
  },
}
