local colors = require("serpkai")
local actions = require("telescope.actions")
require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-Up>"] = actions.preview_scrolling_up,
                ["<C-Down>"] = actions.preview_scrolling_down,
            }
        },
        winblend = vim.o.winblend
    }
}

-- general
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = colors.bg })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = colors.bg })

-- git
vim.api.nvim_set_hl(0, "TelescopeResultsDiffAdd", { fg = colors.green })
vim.api.nvim_set_hl(0, "TelescopeResultsDiffChange", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "TelescopeResultsDiffDelete", { fg = colors.red })

-- variables
vim.api.nvim_set_hl(0, "TelescopeResultsVariable", { fg = colors.blue })
vim.api.nvim_set_hl(0, "TelescopeResultsField", { link = "TelescopeResultsVariable" })

-- types
vim.api.nvim_set_hl(0, "TelescopeResultsStruct", { fg = colors.purple })
vim.api.nvim_set_hl(0, "TelescopeResultsClass", { link = "TelescopeResultsStruct" })

-- routines
vim.api.nvim_set_hl(0, "TelescopeResultsFunction", { fg = colors.red })
vim.api.nvim_set_hl(0, "TelescopeResultsMethod", { link = "TelescopeResultsFunction" })
vim.api.nvim_set_hl(0, "TelescopeResultsOperator", { link = "TelescopeResultsFunction" })

-- values
vim.api.nvim_set_hl(0, "TelescopeResultsNumber", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "TelescopeResultsConstant", { link = "TelescopeResultsNumber" })
