return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "LazyFile",
    opts = function()
      local tsc = require("treesitter-context")

      -- Add a toggle to leader-ut
      Snacks.toggle({
        name = "Treesitter Context",
        get = tsc.enabled,
        set = function(state)
          if state then
            tsc.enable()
          else
            tsc.disable()
          end
        end,
      }):map("<leader>ut")

      local my_opts = {
        mode = "cursor",
        max_lines = 3,
        separator = "_",
      }
      return my_opts
    end,
  },
}
