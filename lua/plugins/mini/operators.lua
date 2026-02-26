return {
  event = "VeryLazy",
  "nvim-mini/mini.operators",
  opts = {
    multiply = {
      prefix = "",
    },

    sort = {
      prefix = "",
    },

    exchange = {
      prefix = "gX",
    },

    replace = {
      prefix = "gR",
    },
  },
  version = false,
  keys = {
    { "gX", desc = "Exchange Line" },
    { "gR", desc = "Replace Line" },
  },
}
