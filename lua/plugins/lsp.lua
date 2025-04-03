return {
  {
    "nvim-lspconfig",
    opts = {

      diagnostics = {
        virtual_lines = {
          current_line = true,
          format = function(diag)
            return diag.message
          end,
        },
        update_in_insert = false,
      },

      servers = {

        -- Adding some additional default settings to make luals stop complaining about vim
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = {
                  "vim",
                },
              },
            },
          },
        },
      },
    },
  },
}
