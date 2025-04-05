return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",

    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    branch = "main",

    cmd = "CopilotChat",

    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        auto_insert_mode = true,
        question_header = "  " .. user .. " ",
        answer_header = "  Copilot ",
        window = {
          width = 0.4,
        },

        prompts = {
          Tutor = {
            prompt = "Explain how to do what has been requested.",
            system_prompt = "You are very knowledgeable about programming. Provide a detailed explanation as if you were tutoring someone. Point out any important, relevant details including examples or caveats in your response.",
            description = "Explain how/what something is",
          },
        },
      }
    end,

    keys = {
      -- Can submit prompts with Ctrl-S
      { "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },

      { "<leader>a", "", desc = "ai", mode = { "n", "v" } },
      {
        "<leader>aa",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>ax",
        function()
          return require("CopilotChat").reset()
        end,
        desc = "Clear (CopilotChat)",
        mode = { "n", "v" },
      },
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n", "v" },
      },
      { "<leader>aM", "<cmd>CopilotChatModels<cr>", desc = "Select Models (CopilotChat)", mode = { "n", "v" } },
      { "<leader>aA", "<cmd>CopilotChatAgents<cr>", desc = "Select Agents (CopilotChat)", mode = { "n", "v" } },
      -- Show prompts actions
      { "<leader>ap", "<cmd>CopilotChatPrompts<cr>", desc = "Prompt Actions (CopilotChat)", mode = { "n", "v" } },
    },

    config = function(_, opts)
      local chat = require("CopilotChat")

      -- Disable some options inside the chat window
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      -- Call setup
      chat.setup(opts)
    end,
  },

  -- Edgy integration
  -- {
  --   "folke/edgy.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     opts.right = opts.right or {}
  --     table.insert(opts.right, {
  --       ft = "copilot-chat",
  --       title = "Copilot Chat",
  --       size = { width = 50 },
  --     })
  --   end,
  -- },
}
