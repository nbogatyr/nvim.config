return {
  "Vigemus/iron.nvim",
  enabled = false,
  lazy = false,
  main = "iron.core",
  opts = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    local my_opts = {
      config = {
        scratch_repl = true,

        -- Configure python repl to use ipython
        repl_definition = {
          python = {
            command = { "ipython", "--no-autoindent" },
            -- command = { "jupyter-console" },
            format = common.bracketed_paste_python,
            block_dividers = { "# %%", "#%%" },
          },
        },

        -- Set FT for the REPL
        repl_filetype = function(bufnr, ft)
          return "repl"
        end,

        -- How REPL gets opened
        repl_open_cmd = view.split.vertical.botright("30%", {}),
      },

      keymaps = {
        toggle_repl = "<leader>r<tab>",
        restart_repl = "<leader>rR", -- calls `IronRestart` to restart the repl
        send_motion = "<leader>rs",
        visual_send = "<leader>rs",
        send_file = "<leader>rF",
        send_line = "<leader>rl",
        send_paragraph = "<leader>rp",
        send_until_cursor = "<leader>ru",
        send_mark = "<leader>rm",
        send_code_block = "<leader>rb",
        send_code_block_and_move = "<leader>rn",
        -- mark_motion = "<leader>mc",
        -- mark_visual = "<leader>mc",
        -- remove_mark = "<leader>md",
        cr = "<leader>r<cr>",
        interrupt = "<leader>r<leader>",
        exit = "<leader>rq",
        clear = "<leader>rC",
      },
      ignore_blank_lines = true,
    }

    return my_opts
  end,

  keys = {
    { "<leader>rf", "<cmd>IronFocus<cr>", desc = "Focus REPL", mode = "n" },
    { "<leader>rh", "<cmd>IronHide<cr>", desc = "Hide REPL", mode = "n" },
  },
}
