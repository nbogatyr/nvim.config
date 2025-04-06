---@param index integer integer to set
local function setValue(index)
  vim.notify(index)
end

return {
  {
    "nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },

    opts = {

      -- vim.diagnostic.Opts
      diagnostics = {
        -- Underline the disagnostics when they appear
        underline = true,

        -- Enable virtual lines and configure how they appear
        virtual_lines = {
          current_line = true,
          format = function(diag)
            return diag.message .. ' (' .. diag.source .. ')'
          end,
        },

        -- Update the disagnostics while you insert text
        update_in_insert = false,

        -- Virtual text settings
        virtual_text = {
          -- Make the icons change depending on severity
          prefix = "icons",
          spacing = 4,
        },

        severity_sort = true,
      },

      -- Inlay hints, if enabled, LSP must also support it for it to work
      inlay_hints = {
        enabled = true,
      },

      -- Global capabilities, these get passed to each lsp config
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },

      -- LSP format, options that get passed to vim.lsp.buf.format
      -- See https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#formattingOptions for format options
      format = {
        formatting_options = {
          -- Prefer spaces over tabs
          insertSpaces = true,

          -- Size of a tab
          tabSize = 4,

          trimTrailingWhitespace = true,
          trimFinalNewlines = true,
          insertFinalNewline = true,
        },
      },

      servers = {

        -- Adding some additional default settings to make luals stop complaining about vim
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = "Replace",
                -- Display x lines of context from the source
                displayContext = 10,
                enable = true,
              },
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                enable = true,
                globals = {
                  "vim",
                },
              },
            },
          },
        },

        -- Configure the python LSPs
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
            ruff = {
              logLevel = "warning",
          }
            },
          },
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
        },

        basedpyright = {
          settings = {
            basedpyright = {
              disableOrganizeImports = true,
            },
          },
          keys = {
            -- TODO: Improve this so it works with more than just uv - if I ever switch
            {"<leader>cpb",function() require('config.extras').execute_shell_command('uvx basedpyright --writebaseline') end, desc = "Write (based)Pyright Baseline File"},
            {"<leader>cpB", function() require('config.extras').execute_shell_command('rm .basedpyright/baseline.json') end, desc = "Delete (based)Pyright File"},

          }

        }

      },

      setup = {
        ["ruff"] = function()
          LazyVim.lsp.on_attach(function(client, buffer)
            -- Disable doc formatting for ruff in favor of (based)pyright
            ---@type vim.lsp.Client
            client.server_capabilities.document_formatting = false
          end, "ruff")
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
 opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<leader>cX", "<cmd>LspRestart<cr>", desc = "Restart LSPs" }
  end,
  }
}
