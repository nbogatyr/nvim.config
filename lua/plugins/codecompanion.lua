return {
  "olimorris/codecompanion.nvim",
  enabled = true,
  lazy = false,

  init = function()
    vim.cmd([[cab cc CodeCompanion]])
  end,

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },

  opts = {

    display = {
      inline = {
        layout = "buffer",
      },
    },

    stategies = {
      chat = {
        adapter = "copilot",
        keymaps = {
          close = {
            n = "q",
          },
        },
      },

      inline = {
        adapter = "copilot",
        keymaps = {
          accept_change = {
            modes = { n = "ga" },
            description = "Accept the suggested change",
          },
          reject_change = {
            modes = { n = "gr" },
            description = "Reject the suggested change",
          },
        },
      },

      cmd = {
        adapter = "copilot",
      },
    },

    prompt_library = {
      ["Buffer Docs"] = {
        strategy = "chat",
        description = "Write documentation for buffer",
        opts = {
          modes = { "n" },
          auto_submit = true,
          user_prompt = true,
          short_name = "bufdocs",
          is_slash_cmd = true,
        },
        prompts = {
          {
            role = "system",
            content = "You are an experienced developer and technical writer. When writing code or documentation, your main focus is on clarity and being concise.",
          },
          {
            role = "user",
            content = [[
@editor
#lsp
#buffer
<user_prompt>
Given the provided code, could you document and annotate it for me?
Please ensure the following:
* All functions and methods have docstrings specifying their arguments, and return values
* Provide type annotations or hints where necessary
* Ensure comments are concise
* Do not provide comments for simple code (e.g. my_var = 1 is too simple)
* Make sure to edit the code/buffer directly!
</user_prompt>]],
          },
        },
      },
    },
  },

  keys = {
    { "<leader>a<tab>", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle Code Companion Chat", mode = "n" },
    { "<leader>am", "<cmd>CodeCompanionActions<cr>", desc = "Open CC Actions", mode = { "n", "v" } },
    { "<leader>aa", "<cmd>CodeCompanionChat Add<cr>", desc = "Add selection to CC", mode = "v" },
  },
}
