return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    -- Italics
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_disable_italic_comment = 0

    -- Bold
    vim.g.gruvbox_material_enable_bold = true

    -- For config, see :h g:gruvbox_material_*
    -- Background ought to be 'medium', 'hard', 'soft'
    -- Foreground ought to be 'material', 'mix', '
    vim.g.gruvbox_material_background = 'medium'
    vim.g.gruvbox_material_foreground = 'material'

    -- Probably sohuldn't turn this one on
    vim.g.gruvbox_material_dim_inactive_windows = false

    -- Should just put this to true
    vim.g.gruvbox_material_better_performance = true

    vim.g.gruvbox_material_statusline_style = 'default'

    -- Colored or highlighted is important to differentiate between types of diagnostics
    vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'

    vim.g.gruvbox_material_current_word = 'grey background'

    vim.g.gruvbox_material_diagnostic_line_highlight = false
    vim.g.gruvbox_material_diagnostic_text_highlight = false

    vim.g.gruvbox_material_float_style = 'dim'

    vim.g.gruvbox_material_ui_contrast = 'low'

    vim.g.gruvbox_material_show_eob = false

    -- This autocommand exposes the colors so that they can be used elsewhere
    vim.api.nvim_create_autocmd('ColorScheme', {
      group = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {}),
      pattern = 'gruvbox-material',
      callback = function()
        local config = vim.fn['gruvbox_material#get_configuration']()
        local palette = vim.fn['gruvbox_material#get_palette'](config.background, config.foreground, config.colors_override)
        local set_hl = vim.fn['gruvbox_material#highlight']

        set_hl('Search', palette.none, palette.bg_visual_yellow)
        set_hl('IncSearch', palette.none, palette.bg_visual_red)
      end,
    })
  end,
}
