return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  lazy = true,

  dependencies = {
    { "rafamadriz/friendly-snippets" },
  },
  opts = function()
    -- Load my own personal snippets
    require("luasnip.loaders.from_lua").lazy_load({ lazy_paths = vim.fn.stdpath("config") .. "/lua" .. "/snippets" })

    local my_opts = {
      history = true,
      delete_check_events = "TextChanged",
      enable_autosnippets = true,
      store_selection_keys = "<M-s>",
    }

    return my_opts
  end,

  keys = function()
    local ls = require("luasnip")

    local my_keys = {
      {
        "<M-e>",
        function()
          ls.expand()
        end,
        mode = "i",
        desc = "Expand Snippet",
        silent = true,
      },
      {
        "<M-d>",
        function()
          ls.jump(1)
        end,
        mode = { "i", "s" },
        desc = "Jump Forward in Snippet",
        silent = true,
      },
      {
        "<M-q>",
        function()
          ls.jump(-1)
        end,
        mode = { "i", "s" },
        desc = "Jump Backward in Snippet",
        silent = true,
      },
      {
        "<M-c>",
        function()
          if ls.choice_active() then
            ls.change_choice(1)
          end
        end,
        mode = { "i", "s" },
        desc = "Change choice in Snippet",
        silent = true,
      },
      {
        "<M-v>",
        function()
          require("luasnip.extras.select_choice")()
        end,
        desc = "Select choice in snippet",
        mode = { "i", "s" },
      },
    }
    return my_keys
  end,
}
