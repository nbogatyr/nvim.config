return {

  "echasnovski/mini.animate",
  event = "VeryLazy",
  enabled = true,

  opts = function(_, opts)
    -- Disable scrolling
    opts.scroll = { enable = false }
    opts.cursor = { enable = false }

    -- Disable mini.animate in grug-far filetype
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "grug-far",
      callback = function()
        vim.b.minianimate_disable = true
      end,
    })

    -- Add a toggle for mini animations
    Snacks.toggle({
      name = "Mini Animate",
      get = function()
        return not vim.g.minianimate_disable
      end,
      set = function(state)
        vim.g.minianimate_disable = not state
      end,
    }):map("<leader>uB")

    return opts
  end,
}
