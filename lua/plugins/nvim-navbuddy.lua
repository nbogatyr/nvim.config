return {
  "SmiteshP/nvim-navbuddy",
  enabled = false,

  lazy = true,

  init = function()
    LazyVim.lsp.on_attach(function(client, buffer)
      if client.supports_method("textDocument/documentSymbol") then
        require("nvim-navbuddy").attach(client, buffer)
      end
    end)
  end,

  opts = function()
    local actions = require("nvim-navbuddy.actions")

    local opts = {
      icons = LazyVim.config.icons.kinds,

      window = {
        border = "rounded",
        size = "80%",
        sections = {
          left = {
            size = "20%",
          },
          mid = {
            size = "20%",
          },
          right = {},
        },
      },

      mappings = {
        ["<esc>"] = actions.close(), -- Close and cursor to original location
        ["q"] = actions.close(),

        ["j"] = actions.next_sibling(), -- down
        ["k"] = actions.previous_sibling(), -- up

        ["h"] = actions.parent(), -- Move to left panel
        ["l"] = actions.children(), -- Move to right panel
        ["0"] = actions.root(), -- Move to first panel

        ["v"] = actions.visual_name(), -- Visual selection of name
        ["V"] = actions.visual_scope(), -- Visual selection of scope

        ["y"] = actions.yank_name(), -- Yank the name to system clipboard "+
        ["Y"] = actions.yank_scope(), -- Yank the scope to system clipboard "+

        ["i"] = actions.insert_name(), -- Insert at start of name
        ["I"] = actions.insert_scope(), -- Insert at start of scope

        ["a"] = actions.append_name(), -- Insert at end of name
        ["A"] = actions.append_scope(), -- Insert at end of scope

        ["r"] = actions.rename(), -- Rename currently focused symbol

        ["d"] = actions.delete(), -- Delete scope

        ["f"] = actions.fold_create(), -- Create fold of current scope
        ["F"] = actions.fold_delete(), -- Delete fold of current scope

        ["c"] = actions.comment(), -- Comment out current scope

        ["<enter>"] = actions.select(), -- Goto selected symbol
        ["o"] = actions.select(),

        ["J"] = actions.move_down(), -- Move focused node down
        ["K"] = actions.move_up(), -- Move focused node up

        ["s"] = actions.toggle_preview(), -- Show preview of current node

        ["<C-v>"] = actions.vsplit(), -- Open selected node in a vertical split
        ["<C-s>"] = actions.hsplit(), -- Open selected node in a horizontal split

        ["t"] = actions.telescope({ -- Fuzzy finder at current level.
          layout_config = { -- All options that can be
            height = 0.60, -- passed to telescope.nvim's
            width = 0.60, -- default can be passed here.
            prompt_position = "top",
            preview_width = 0.50,
          },
          layout_strategy = "horizontal",
        }),

        ["g?"] = actions.help(), -- Open mappings help window
      },
    }

    return opts
  end,

  keys = {
    { "<leader>cN", "<cmd>Navbuddy<cr>", desc = "Open Navbuddy" },
  },
}
