return {
  {
    import = "plugins.neotest",
  },
  {
    "nvim-neotest/neotest",
    enabled = true,
    depenencies = {
      "nvim-neotest/neotest-python",
    },

    opts = {
      adapters = {
        ["neotest-python"] = {
          -- Config for the neotest python adapter
          runner = "pytest",
          python = ".venv/bin/python",
          pyest_discover_instances = true,
        },
      },
    },
  },
}
