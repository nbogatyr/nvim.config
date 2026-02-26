return {
  "nvim-mini/mini.snippets",
  enabled = false,
  event = "InsertEnter",
  dependencies = "rafamadriz/friendly-snippets",

  opts = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    LazyVim.cmp.actions.snippet_stop = function() end -- by design, <esc> should not stop the session!
    ---@diagnostic disable-next-line: duplicate-set-field
    LazyVim.cmp.actions.snippet_forward = function()
      return jump("next")
    end

    local mini_snippets = require("mini.snippets")
    local my_opts = {
      snippets = {
        mini_snippets.gen_loader.from_lang(),
      },

      -- Uncomment this to enable quitting snippet with esc
      -- mappings = { stop = "<esc>" }, -- <c-c> by default, see :h MiniSnippets-session
      mappings = {
        expand = "<M-e>",
        jump_next = "<M-d>",
        jump_prev = "<M-w>",
      },
    }

    return my_opts
  end,
}
