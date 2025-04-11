return {
  "blink.cmp",
  opts = {

    -- Always use rust implementation
    fuzzy = { implementation = "rust" },
    completion = {
      menu = {
        border = nil,

        draw = {
          columns = { { "kind_icon", "label", gap = 1 }, { "source_name", "label_description", gap = 1 } },
        },
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
}
