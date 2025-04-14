return {
  "echasnovski/mini.surround",
  version = false,

  opts = {
    mappings = {
      add = "<leader>cxa",
      delete = "<leader>cxd",
      find = "<leader>cxf",
      find_left = "<leader>cxF",
      highlight = "<leader>cxh",
      replace = "<leader>cxr",
      update_n_lines = "<leader>cxn",

      suffix_last = "N",
      suffix_next = "n",
    },
  },

  keys = {
    { "<leader>cxa", "<leader>cxa" },
    { "<leader>cxd", "<leader>cxd" },
    { "<leader>cxf", "<leader>cxf" },
    { "<leader>cxF", "<leader>cxF" },
    { "<leader>cxh", "<leader>cxh" },
    { "<leader>cxr", "<leader>cxr" },
    { "<leader>cxn", "<leader>cxn" },
  },
}
