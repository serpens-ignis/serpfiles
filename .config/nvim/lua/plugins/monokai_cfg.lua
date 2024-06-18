local colors = require("serpkai")

require("monokai").setup {
    italics = false,
    custom_hlgroups = {
        DiagnosticError = { fg = colors.red },
        DiagnosticWarn = { fg = colors.yellow },
        DiagnosticInfo = { fg = colors.cyan },
        DiagnosticHint = { fg = colors.blue },

        DiagnosticSignError = { fg = colors.red },
        DiagnosticSignWarn = { fg = colors.yellow },
        DiagnosticSignInfo = { fg = colors.cyan },
        DiagnosticSignHint = { fg = colors.blue },

        DiagnosticUnderlineError = { sp = colors.red, style = "underline" },
        DiagnosticUnderlineWarn = { sp = colors.yellow, style = "underline" },
        DiagnosticUnderlineInfo = { sp = colors.cyan, style = "underline" },
        DiagnosticUnderlineHint = { sp = colors.blue, style = "underline" }
    }
}
