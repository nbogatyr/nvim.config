return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,

  config = function()
    -- Add some highlights here

    -- Italics
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_disable_italic_comment = 0

    -- Bold
    vim.g.gruvbox_material_enable_bold = true

    -- For config, see :h g:gruvbox_material_*
    -- Background ought to be 'medium', 'hard', 'soft'
    -- Foreground ought to be 'material', 'mix', '
    vim.g.gruvbox_material_background = "medium"
    vim.g.gruvbox_material_foreground = "material"

    -- Probably sohuldn't turn this one on
    vim.g.gruvbox_material_dim_inactive_windows = false

    -- Should just put this to true
    vim.g.gruvbox_material_better_performance = true

    vim.g.gruvbox_material_statusline_style = "default"

    -- Colored or highlighted is important to differentiate between types of diagnostics
    vim.g.gruvbox_material_diagnostic_virtual_text = "colored"

    vim.g.gruvbox_material_current_word = "grey background"

    vim.g.gruvbox_material_diagnostic_line_highlight = false
    vim.g.gruvbox_material_diagnostic_text_highlight = false

    -- vim.g.gruvbox_material_float_style = 'dim'

    vim.g.gruvbox_material_ui_contrast = "low"

    vim.g.gruvbox_material_show_eob = false

    -- This autocommand exposes the colors so that they can be used elsewhere
    vim.api.nvim_create_autocmd("ColorScheme", {
      group = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {}),
      pattern = "gruvbox-material",
      callback = function()
        local config = vim.fn["gruvbox_material#get_configuration"]()
        local palette =
          vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
        local set_hl = vim.fn["gruvbox_material#highlight"]

        -- Snacks highlights
        -- Picker
        set_hl("SnacksPickerBoxTitle", palette.bg0, palette.orange, "bold")
        set_hl("SnacksPickerInput", palette.fg1, palette.bg0)
        set_hl("SnacksPickerInputBorder", palette.bg0, palette.bg0)
        set_hl("SnacksPickerInputTitle", palette.bg0, palette.orange, "bold")

        set_hl("SnacksPickerList", palette.fg0, palette.bg1)
        set_hl("SnacksPickerListBorder", palette.bg3, palette.bg0)
        set_hl("SnacksPickerListCursorLine", palette.fg1, palette.bg_visual_yellow)

        set_hl("SnacksPickerPreviewBorder", palette.bg3, palette.bg0)

        set_hl("SnacksPickerBorder", palette.bg0, palette.bg0)
        set_hl("SnacksPreviewTitle", palette.bg0, palette.orange, "bold")

        set_hl("FloatBorder", palette.bg3, palette.bg1)
        set_hl("NormalFloat", palette.fg1, palette.bg1)
        set_hl("FloatTitle", palette.bg0, palette.orange, "bold")

        set_hl("SnacksScratchKey", palette.bg0, palette.orange)
        set_hl("SnacksScratchDesc", palette.bg0, palette.orange)

        set_hl("NoiceCmdlineIcon", palette.fg1, palette.bg0)
        set_hl("NoiceCmdlinePopupTitle", palette.fg1, palette.bg0)
        set_hl("NoiceCmdlinePopupBorder", palette.grey1, palette.bg0)

        -- set_hl("RenderMarkdownH1Bg", palette.none, palette.markbg1)
        -- set_hl("RenderMarkdownH2Bg", palette.none, palette.markbg2)
        -- set_hl("RenderMarkdownH3Bg", palette.none, palette.markbg3)
        -- set_hl("RenderMarkdownH4Bg", palette.none, palette.markbg4)
        -- set_hl("RenderMarkdownH5Bg", palette.none, palette.markbg5)
        -- set_hl("RenderMarkdownH6Bg", palette.none, palette.markbg6)
        --
        -- Set the lualine theme as well
        -- local success, lualine = pcall(require("plugins.lualine"))
        -- local lualine = require("plugins.lualine")
        -- lualine.opts.options.theme = require("plugins.lualine.themes.gruvbox-material")
        --

        -- Highlights for bufferline

        -- set_hl("BufferLineFill", palette.bg0, palette.bg0)
        -- set_hl("BufferLineSeparator", buffer_background, palette.bg0)
        -- set_hl("BufferLineBackground", palette.fg0, buffer_background)
        --
        -- set_hl("BufferLineOffsetSeparator", palette.bg0, palette.bg0)
        --
        -- set_hl("BufferLineSeparatorSelected", buffer_background, palette.bg0)
        -- set_hl("BufferLineBufferSelected", palette.fg1, buffer_background, "underline", palette.fg0)
        -- set_hl("BufferLineIndicatorSelected", palette.fg1, buffer_background)
        -- set_hl("BufferLineMiniIconsAzureSelected", palette.blue, buffer_background, "underline", palette.fg0)
        -- set_hl("BufferLineModifiedSelected", palette.green, buffer_background)
        -- set_hl("BufferLineNumbersSelected", palette.fg1, buffer_background, "underline", palette.fg0)
        --
        -- set_hl("BufferLineHintSelected", palette.green, buffer_background, "underline", palette.fg0)
        -- set_hl("BufferLineInfoSelected", palette.blue, buffer_background, "underline", palette.fg0)
        -- set_hl("BufferLinePickSelected", palette.red, buffer_background, "underline", palette.fg0)
        -- set_hl("BufferLineErrorSelected", palette.red, buffer_background, "underline", palette.fg0)
        -- set_hl("BufferLineWarningSelected", palette.yellow, buffer_background, "underline", palette.fg0)
        -- set_hl("BufferLineDiagnosticSelected", palette.grey0, buffer_background, "underline", palette.fg0)
        --
        -- set_hl("BufferLineHintDiagnosticSelected", palette.green, buffer_background, "underline", palette.fg0)
        -- set_hl("BufferLineInfoDiagnosticSelected", palette.blue, buffer_background, "underline", palette.fg0)
        -- set_hl("BufferLineErrorDiagnosticSelected", palette.red, buffer_background, "underline", palette.fg0)
        -- set_hl("BufferLineWarningDiagnosticSelected", palette.yellow, buffer_background, "underline", palette.fg0)
        --
        -- set_hl("BufferLineDuplicateSelected", palette.fg1, buffer_background, "underline", palette.fg0)
        -- set_hl("BufferLineDuplicate", palette.fg0, buffer_background)
        --
        -- -- Visible buffers
        -- set_hl("BufferLineDuplicateVisible", other_buffer_text, buffer_background)
        -- set_hl("BufferLineHintVisible", other_buffer_text, buffer_background)
        -- set_hl("BufferLineInfoVisible", other_buffer_text, buffer_background)
        -- set_hl("BufferLineErrorVisible", other_buffer_text, buffer_background)
        -- set_hl("BufferLineBufferVisible", other_buffer_text, buffer_background)
        -- set_hl("BufferLineNumbersVisible", other_buffer_text, buffer_background)
        -- set_hl("BufferLineWarningVisible", other_buffer_text, buffer_background)
        -- set_hl("BufferLineModifiedVisible", palette.green, buffer_background)
        -- set_hl("BufferLineIndicatorVisible", other_buffer_text, buffer_background)
        -- set_hl("BufferLineSeparatorVisible", palette.bg_dim, palette.bg0)
        --
        -- set_hl("BufferLineDiagnosticVisible", other_buffer_text, buffer_background)
        -- set_hl("BufferLineCloseButtonVisible", other_buffer_text, buffer_background)
        -- set_hl("BufferLineHintDiagnosticVisible", other_buffer_text, buffer_background)
        -- set_hl("BufferLineInfoDiagnosticVisible", other_buffer_text, buffer_background)
        -- set_hl("BufferLineErrorDiagnosticVisible", other_buffer_text, buffer_background)
        -- set_hl("BufferLineWarningDiagnosticVisible", other_buffer_text, buffer_background)

        --
        -- -- Bufferline tabs
        -- set_hl("BufferLineTab", palette.fg0, buffer_background)
        -- set_hl("BufferLineTabClose", palette.fg0, buffer_background)
        -- set_hl("BufferLineTabSeparator", buffer_background, palette.bg0)
        -- set_hl("BufferLineTabPageFill", buffer_background, palette.bg_dim)
        -- set_hl("BufferLineTabpages", buffer_background, palette.bg_dim)
        --
        -- set_hl("BufferLineTabSelected", palette.fg1, palette.bg_dim, "underline", palette.fg0)
        -- set_hl("BufferLineTabSeparatorSelected", palette.bg_dim, palette.bg0)
      end,
    })
  end,
}
