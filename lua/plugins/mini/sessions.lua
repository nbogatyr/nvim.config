return {
  "echasnovski/mini.sessions",
  enabled = true,

  -- Plugin can't be lazy, needs to load right away to grab the sessions
  lazy = true,

  event = "VeryLazy",

  opts = {
    autoread = false,

    -- Only autowrites the currently open session
    autowrite = true,

    verbose = { read = true, write = true, delete = true },
  },

  keys = {
    {
      "<leader>qw",
      function()
        local pwd = vim.fn.getcwd()
        local pwd_filtered = string.gsub(pwd, "/", "%%")
        MiniSessions.write(pwd_filtered)
      end,
      desc = "Write/Setup current session",
    },
    {
      "<leader>qr",
      function()
        MiniSessions.read()
      end,
      desc = "Read default session",
    },
    {
      "<leader>qd",
      function()
        MiniSessions.delete(nil, { force = true })
      end,
      desc = "Delete current session",
    },
    {
      "<leader>qS",
      require("config.extras").select_sessions,
      desc = "Select session",
    },
    {
      "<leader>qD",
      function()
        MiniSessions.select("delete")
      end,
      desc = "Select session to delete",
    },
    { "<leader>fs", require("config.extras").select_sessions, desc = "Find Sessions" },
  },
}
