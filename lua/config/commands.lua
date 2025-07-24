vim.api.nvim_create_user_command("NewNotebook", function(opts)
  require("config.extras").create_new_notebook(opts.args)
end, {
  nargs = 1,
  complete = "file",
})
