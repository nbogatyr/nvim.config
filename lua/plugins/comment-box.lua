local get_comment_box_default_style = function()
  return vim.g.comment_box_default_style
end

return {
  'LudoPinelli/comment-box.nvim',
  version = false,
  lazy = false,

  init = function()
    vim.g.comment_box_default_style = 0
  end,

  opts = {
    comment_style = 'line',

    -- Don't put lines around the comment boxes
    outer_blank_lines_above = false,
    outer_blank_lines_below = false,

    -- Extra lines around the comment lines
    line_blank_line_below = false,
    line_blank_line_above = false,
  },

  keys = {
    {
      '<leader>cbccb',
      function()
        vim.cmd('CBccbox ' .. get_comment_box_default_style())
      end,
      desc = 'Create CC Comment Box',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cbclb',
      function()
        vim.cmd('CBccbox ' .. get_comment_box_default_style())
      end,
      desc = 'Create CL Comment Box',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cbcrb',
      function()
        vim.cmd('CBcrbox ' .. get_comment_box_default_style())
      end,
      desc = 'Create CR Comment Box',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cblcb',
      function()
        vim.cmd('CBlcbox ' .. get_comment_box_default_style())
      end,
      desc = 'Create LC Comment Box',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cbllb',
      function()
        vim.cmd('CBllbox ' .. get_comment_box_default_style())
      end,
      desc = 'Create LL Comment Box',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cblrb',
      function()
        vim.cmd('CBlrbox ' .. get_comment_box_default_style())
      end,
      desc = 'Create LR Comment Box',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cbrrb',
      function()
        vim.cmd('CBrrbox ' .. get_comment_box_default_style())
      end,
      desc = 'Create RC Comment Box',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cbrlb',
      function()
        vim.cmd('CBrlbox ' .. get_comment_box_default_style())
      end,
      desc = 'Create RL Comment Box',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cbrcb',
      function()
        vim.cmd('CBrcbox ' .. get_comment_box_default_style())
      end,
      desc = 'Create RC Comment Box',
      mode = { 'n', 'v', 'i' },
    },

    -- Keymaps for lines
    {
      '<leader>cbccl',
      function()
        vim.cmd('CBccline ' .. get_comment_box_default_style())
      end,
      desc = 'Create CC Comment Line',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cbcll',
      function()
        vim.cmd('CBclline ' .. get_comment_box_default_style())
      end,
      desc = 'Create CL Comment Line',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cbcrl',
      function()
        vim.cmd('CBcrline ' .. get_comment_box_default_style())
      end,
      desc = 'Create CR Comment Line',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cblcl',
      function()
        vim.cmd('CBlcline ' .. get_comment_box_default_style())
      end,
      desc = 'Create LC Comment Line',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cblll',
      function()
        vim.cmd('CBllline ' .. get_comment_box_default_style())
      end,
      desc = 'Create LL Comment Line',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cblrl',
      function()
        vim.cmd('CBlrline ' .. get_comment_box_default_style())
      end,
      desc = 'Create LR Comment Line',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cbrrl',
      function()
        vim.cmd('CBrrline ' .. get_comment_box_default_style())
      end,
      desc = 'Create RC Comment Line',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cbrll',
      function()
        vim.cmd('CBrlline ' .. get_comment_box_default_style())
      end,
      desc = 'Create RL Comment Line',
      mode = { 'n', 'v', 'i' },
    },
    {
      '<leader>cbrcl',
      function()
        vim.cmd('CBrcline ' .. get_comment_box_default_style())
      end,
      desc = 'Create RC Comment Line',
      mode = { 'n', 'v', 'i' },
    },

    {
      '<leader>cbd',
      function()
        vim.cmd('CBd ' .. get_comment_box_default_style())
      end,
      desc = 'Remove a comment box in visual mode',
      mode = { 'v' },
    },
    {
      '<leader>cby',
      function()
        vim.cmd('CBy ' .. get_comment_box_default_style())
      end,
      desc = 'Yank the contents of a comment box',
      mode = { 'n', 'v' },
    },

    {
      '<leader>cbC',
      function()
        vim.cmd('CBcatalog ' .. get_comment_box_default_style())
      end,
      desc = 'Open the Comment Box catalogue',
    },

    {
      '<leader>cbD',
      function()
        local input = vim.fn.input 'Enter the name of the default style to use: '
        vim.g.comment_box_default_style = input
      end,
      desc = 'Change the default comment box style',
    },
  },
}
