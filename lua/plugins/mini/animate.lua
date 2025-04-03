return {

  "echasnovski/mini.animate",
  enabled = true,

  opts = function(_, opts)
    opts.scroll.enable = false
    Snacks.toggle({
      name = "Mini Animate",
      get = function()
        return not vim.g.minianimate_disable
      end,
      set = function(state)
        vim.g.minianimate_disable = not state
      end,
    }):map("<leader>uB")
  end,
}
