return {
  {
    "blink.cmp",
    opts = {

      -- Always use rust implementation
      fuzzy = { implementation = "rust" },

      snippets = {
        preset = "luasnip",
      },

      completion = {
        menu = {
          border = "rounded",

          draw = {
            columns = {
              { "kind_icon", "label", gap = 1 },
              { "kind", gap = 1 },
            },
          },
        },

        documentation = {
          window = {
            border = "rounded",
          },
        },
      },

      sources = {
        per_filetype = {
          -- Necessary for completions in codecompanion
          codecompanion = { "codecompanion" },
        },
      },

      keymap = {
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<PageUp>"] = { "scroll_documentation_up", "fallback" },
        ["<PageDown>"] = { "scroll_documentation_down", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      },
    },
  },
  {},
}
