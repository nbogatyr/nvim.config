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
        enabled = true,
        timeout = 7000,
      },

      -- ─( snacks.picker )──────────────────────────────────────────────────
      picker = {
        layout = "custom_telescope_default_layout",

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
              backdrop = false,
              border = "none",
              {
                win = "input",
                height = 1,
                backdrop = true,
                border = "rounded",
                title = "Find {title} {live} {flags}",
                title_pos = "center",
              },
              {
                box = "horizontal",
                { win = "list", border = "rounded" },
                {
                  win = "preview",
                  border = "rounded",
                  width = 0.6,
                },
              },
            },
          },
          custom_sidebar = {
            preview = "main",
            layout = {
              backdrop = true,
              width = 40,
              min_width = 40,
              height = 0,
              position = "left",
              border = "none",
              box = "vertical",
              {
                win = "input",
                height = 1,
                border = { " ", " ", " ", " ", "▁", "▁", "▁", " " },
                title = "{title} {live} {flags}",
                title_pos = "center",
              },
              { win = "list", border = "none" },
              { win = "preview", title = "{preview}", height = 0.4, border = "top" },
            },
          },

          vscode_custom = {
            preview = false,
            layout = {
              backdrop = false,
              row = 1,
              width = 0.8,
              min_width = 80,
              height = 0.4,
              border = "rounded",
              box = "vertical",
              { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
              { win = "list", border = "hpad" },
              { win = "preview", title = "{preview}", border = "rounded" },
            },
          },

          custom_telescope_vert_layout = {
            layout = {
              box = "vertical",
              width = 0.8,
              backdrop = false,
              height = 0.9,
              border = "none",
              {
                win = "input",
                border = "rounded",
                height = 1,
                title = "Find {title} {live} {flags}",
                title_pos = "center",
              },
              { win = "list", border = "rounded", height = 15 },
              { win = "preview", border = "rounded" },
            },
          },
        },

        sources = {
          buffers = { layout = { preset = "custom_telescope_vert_layout" } },
          recent = { layout = { preset = "custom_telescope_vert_layout" }, title = "Most Recently Used Files" },
          keymaps = { layout = { preset = "vscode_custom" } },
          explorer = { layout = { preset = "custom_sidebar" } },
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
        "<leader>fp",
        function()
          Snacks.picker.projects({
            confirm = function(picker, item)
              picker:close()
              if not item then
                return
              end
              local dir = item.file
              local session_loaded = false
              vim.api.nvim_create_autocmd("SessionLoadPost", {
                once = true,
                callback = function()
                  session_loaded = true
                end,
              })
              vim.defer_fn(function()
                if not session_loaded then
                  Snacks.picker.files()
                end
              end, 100)

              local detected_sessions = MiniSessions.detected
              local matching_session = nil
              for k, v in pairs(detected_sessions) do
                local new_string = string.gsub(v.name, "%%", "/")
                -- Split the string based on space
                if new_string == dir then
                  matching_session = v.name
                  break
                end
              end

              if matching_session ~= nil then
                MiniSessions.read(matching_session, { verbose = true })
              else
                vim.notify("No session found for " .. dir, vim.log.levels.WARN)
                vim.notify("Creating new session.")
                local new_session_file_name = string.gsub(dir, "/", "%%")
                MiniSessions.write(new_session_file_name)
                vim.fn.chdir(dir)
              end
            end,
          })
        end,
      },
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
      { "<leader>ft", nil },
      { "<leader>fT", nil },
      {
        "<leader>Tl",
        function()
          Snacks.terminal(nil, { win = { position = "right", enter = true } })
        end,
        desc = "Terminal (cwd) - Right",
        mode = "n",
      },
      {
        "<leader>Tk",
        function()
          Snacks.terminal(nil, { win = { position = "top", enter = true } })
        end,
        desc = "Terminal (cwd) - Above",
        mode = "n",
      },
      {
        "<leader>Tj",
        function()
          Snacks.terminal(nil, { win = { position = "bottom", enter = true, height = 0.25 } })
        end,
        desc = "Terminal (cwd) - Bottom",
        mode = "n",
      },
      {
        "<leader>Th",
        function()
          Snacks.terminal(nil, { win = { position = "left", enter = true } })
        end,
        desc = "Terminal (cwd) - Left",
        mode = "n",
      },

      {
        "<leader>TL",
        function()
          Snacks.terminal(nil, { win = { osition = "right", enter = true, cwd = LazyVim.root() } })
        end,
        desc = "Terminal (Root Dir) - Right",
        mode = "n",
      },
      {
        "<leader>TK",
        function()
          Snacks.terminal(nil, { win = { osition = "top", enter = true, cwd = LazyVim.root() } })
        end,
        desc = "Terminal (Root Dir) - Top",
        mode = "n",
      },
      {
        "<leader>TJ",
        function()
          Snacks.terminal(nil, { win = { position = "bottom", height = 0.25, enter = true, cwd = LazyVim.root() } })
        end,
        desc = "Terminal (Root Dir) - Bottom",
        mode = "n",
      },
      {

        "<leader>TH",
        function()
          Snacks.terminal(nil, { win = { position = "left", enter = true, cwd = LazyVim.root() } })
        end,
        desc = "Terminal (Root Dir) - Left",
        mode = "n",
      },
      {
        "<leader>Tf",
        function()
          Snacks.terminal(nil, { win = { position = "float", enter = true, border = "rounded" } })
        end,
        desc = "Terminal Floating",
        mode = "n",
      },
      {
        "<leader>Tt",
        function()
          Snacks.terminal.toggle()
        end,
        desc = "Toggle Terminal",
        mode = "n",
      },
      {
        "<leader>Tbr",
        function()
          Snacks.terminal(nil, { win = { position = "botright", enter = true } })
        end,
        desc = "Toggle Terminal - Bot Right",
        mode = "n",
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
