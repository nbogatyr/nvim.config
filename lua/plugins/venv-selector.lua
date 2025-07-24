return {
  "linux-cultist/venv-selector.nvim",
  enabled = true,
  dependencies = {
    "neovim/nvim-lspconfig",
    -- { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  event = "VeryLazy",
  lazy = true,
  branch = "regexp", -- This is the regexp branch, use this for the new version
  keys = {
    { "<leader>pv", "<cmd>VenvSelect<cr>", desc = "Select Venv" },
    { "<leader>pV", "<cmd>VenvSelectCached<cr>", desc = "Select Cached Venv" },
  },
  ---@type venv-selector.Config
  opts = {
    search = {
      my_project_venv = {
        command = "fd ^python$ $WORKSPACE_PATH/.venv/bin --color never -u -d 4",
      },
    },

    options = {
      notify_user_on_venv_activation = true,
      enable_default_searches = true,
      enable_cached_venvs = true,

      on_venv_activate_callback = function()
        local venv_sel = require("venv-selector")
        vim.g.python_venv_active = true
        local venv_name = venv_sel.venv():match("([^/]+)$")
        venv_name = venv_name:gsub("^%.", "")
        vim.g.python_venv_name = venv_name
        local handle = io.popen("python --version")
        local result = handle:read("*a")
        handle:close()

        local version = result:match("Python%s([%d%.]+)")
        vim.g.python_venv_version = version
      end,
    },
  },
}
