local surround_prefix = "<leader>cx"

return {
  "echasnovski/mini.surround",
  version = false,

  opts = {
    mappings = {
      add = surround_prefix .. "a",
      delete = surround_prefix .. "d",
      find = surround_prefix .. "f",
      find_left = surround_prefix .. "F",
      highlight = surround_prefix .. "h",
      replace = surround_prefix .. "r",
      update_n_lines = surround_prefix .. "n",

      suffix_last = "N",
      suffix_next = "n",
    },
  },

  keys = {
    { surround_prefix, desc = "Mini Surround" },
    { surround_prefix .. "a", desc = "Add surround char", mode = { "n", "v" } },
    { surround_prefix .. "d", desc = "Delete surround char" },
    { surround_prefix .. "f", desc = "Find surround char" },
    { surround_prefix .. "F", desc = "Find left surround char" },
    { surround_prefix .. "h", desc = "Highlight surround char" },
    { surround_prefix .. "r", desc = "Replace surround char" },
    { surround_prefix .. "n", desc = "Update n lines" },
  },
}
