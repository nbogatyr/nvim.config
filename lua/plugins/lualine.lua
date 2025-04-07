return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",

    opts = function(_, opts)
      -- Custom theme
      local config = vim.fn["gruvbox_material#get_configuration"]()
      local palette =
        vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)

      opts.options.theme = require("plugins.lualine.themes.gruvbox-material")
      -- opts.options.component_separators = { left = "", right = "" }
      -- opts.options.section_separators = { left = "", right = "" }
      opts.options.section_separators = { left = "", right = "" }
      -- opts.options.component_separators = { left = "", right = "" }
      opts.options.component_separators = ""

      local icons = LazyVim.config.icons
      vim.o.laststatus = vim.g.lualine_laststatus

      -- Sections
      opts.sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          {
            function()
              return vim.g.python_cur_version or require("config.extras").get_python_version()
            end,
            cond = function()
              return vim.bo.filetype == "python"
            end,
            color = "lualine_a_command",
            icon = "",
            separator = { right = "" },
          },
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
        lualine_c = {},

        lualine_x = {},

        lualine_y = {
          Snacks.profiler.status(),
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return { fg = Snacks.util.color("Statement") } end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return { fg = Snacks.util.color("Constant") } end,
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = function() return { fg = Snacks.util.color("Debug") } end,
          },
          -- stylua: ignore
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = function() return { fg = Snacks.util.color("Special") } end,
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          { "lsp_status" },
          -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          {
            function()
              return " " .. os.date("%I:%M %p")
            end,
            padding = { right = 2, left = 0 },
          },
        },
      }

      opts.options.always_show_tabline = true

      opts.tabline = {
        lualine_a = {
          {
            function()
              return ""
            end,
            color = { bg = palette.bg_green[1] },
            separator = { right = "" },
          },
          { "filename" },
        },
        lualine_b = {
          -- {
          --   "buffers",
          --   show_modified_status = true,
          --   mode = 0,
          --   component_separators = { left = "", right = "" },
          -- },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { { "tabs" } },
      }
    end,
  },
}
