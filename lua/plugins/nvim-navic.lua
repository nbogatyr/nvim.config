return {
  "SmiteshP/nvim-navic",
  enabled = false,
  lazy = true,
  init = function()
    LazyVim.lsp.on_attach(function(client, buffer)
      if client.supports_method("textDocument/documentSymbol") then
        require("nvim-navic").attach(client, buffer)
      end
    end)
  end,

  opts = function()
    local opts = {

      -- separator = "  ",
      separator = " ",
      highlight = true,
      depth_limit = 10,
      icons = LazyVim.config.icons.kinds,

      -- Makes navic only update on
      lazy_update_context = true,
      click = true,
    }
    return opts
  end,
}
