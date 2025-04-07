return {
  {
    "snacks.nvim",
    enabled = true,

    init = function()
      -- Enable snacks animate by default
      vim.g.snacks_animate = true
    end,

    opts = {

      animate = {
        fps = 100,
      },

      explorer = {},

      -- ─( snacks.dshboard )────────────────────────────────────────────────
      dashboard = {
        enabled = true,

        width = 80,

        sections = {
          {
            section = "terminal",
            cmd = "tte -i ~/.config/nvim/neovim_dashboard_header.txt --anchor-text c --anchor-canvas c slide --movement-speed 0.5 --final-gradient-stops e78a4e d8a657 ea6962",
            ttl = 10,
          },
          { icon = " ", title = "Shortcuts", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },

      -- ─( snacks.image )───────────────────────────────────────────────────
      image = {
        enabled = true,
      },

      -- ─( snacks.notifier )────────────────────────────────────────────────
      notifier = {
        enabled = false,
        timeout = 7000,
      },

      -- ─( snacks.picker )──────────────────────────────────────────────────
      picker = {
        layout = "custom_telescope_vert_layout",

        files = {
          follow = true,
        },

        grep = {
          follow = true,
        },

        layouts = {
          custom_telescope_default_layout = {
            layout = {
              box = "vertical",
              width = 0.8,
              height = 0.8,
              border = "none",
              {
                win = "input",
                height = 1,
                border = "single",
                title = "Find {title} {live} {flags}",
                title_pos = "center",
              },
              {
                box = "horizontal",
                { win = "list", border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" } },
                {
                  win = "preview",
                  border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
                  width = 0.6,
                },
              },
            },
          },

          custom_telescope_vert_layout = {
            layout = {
              box = "vertical",
              width = 0.8,
              height = 0.9,
              border = "none",
              {
                win = "input",
                border = "single",
                height = 1,
                title = "Find {title} {live} {flags}",
                title_pos = "center",
              },
              { win = "list", border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }, height = 15 },
              { win = "preview", border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" } },
            },
          },
        },

        sources = {
          buffers = { layout = { preset = "custom_telescope_vert_layout" } },
          recent = { layout = { preset = "custom_telescope_vert_layout" }, title = "Most Recently Used Files" },
          keymaps = { layout = { preset = "vscode" } },
        },
      },

      -- ─( snacks.zen )─────────────────────────────────────────────────────
      zen = {
        toggles = {
          dim = false,
          show = {
            statusline = true,
            tabline = false,
          },
        },

        win = { backdrop = { transparent = false } },
      },

      styles = {
        dashboard = {
          wo = { wrap = false },
        },

        explorer = {
          wo = {},
        },

        terminal = {
          wo = {
            wrap = false,
          },
        },
      },
    },

    keys = {
      {
        "<leader>ff",
        function()
          Snacks.picker.files({ follow = true })
        end,
        desc = "Find Files",
      },
      {
        "<leader>/",
        function()
          Snacks.picker.grep({ follow = true })
        end,
        desc = "Grep",
      },
      {
        "<leader>sg",
        function()
          Snacks.picker.grep({ follow = true })
        end,
        desc = "Grep",
      },
      {
        "<leader>sw",
        function()
          Snacks.picker.grep_word({ follow = true })
        end,
        desc = "Visual selection or word",
        mode = { "n", "x" },
      },
    },
  },
  {
    "snacks.nvim",
    opts = function(_, opts)
      table.insert(opts.dashboard.preset.keys, 3, {
        icon = "",
        key = "G",
        desc = "LazyGit",
        action = "<leader>gg",
      })

      table.insert(opts.dashboard.preset.keys, 3, {
        icon = "",
        key = "S",
        desc = "Find Sessions",
        action = "<leader>qS",
      })
    end,
  },
}
