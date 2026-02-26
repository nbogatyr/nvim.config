return {
  "saghen/blink.cmp",

  completion = {
    menu = {
      auto_show = false,
    },
  },

  keymap = {
    -- show with a list of providers
    ["<C-Space>"] = {
      function(cmp)
        cmp.show({ providers = { "snippets" } })
      end,
    },
  },
}
