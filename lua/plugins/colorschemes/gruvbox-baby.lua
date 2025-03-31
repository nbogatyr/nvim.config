return {
  'luisiacc/gruvbox-baby',
  version = false,
  priority = 1000,
  enabled = true,
  lazy = false,
  config = function()
    -- See :h attr-list
    vim.g.gruvbox_baby_background_color = 'medium'
    vim.g.gruvbox_baby_transparent_mode = false
    vim.g.gruvbox_baby_comment_style = 'italic'
    vim.g.gruvbox_baby_keyword_style = 'italic'
    vim.g.gruvbox_baby_string_style = 'nocombine'
    vim.g.gruvbox_baby_function_style = 'bold'
    vim.g.gruvbox_baby_variable_style = 'NONE'

    -- Color overrides
    -- See :h highlight-guifg
    vim.g.gruvbox_baby_highlights = {}
    vim.g.gruvbox_baby_color_overrides = {}

    -- Set to true to use the original gruvbox palette
    vim.g.gruvbox_baby_use_original_palette = true

    -- Install the telescope theme
    vim.g.gruvbox_baby_telescope_theme = 0
  end,
}
