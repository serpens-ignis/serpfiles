local colors = require("serpkai")

require("noice").setup({
    cmdline = { view = "cmdline" },

    popupmenu = { enabled = false },

    lsp = {
        signature = { enabled = false },
        progress = {
            format = {
                "({data.progress.percentage}%) ",
                { "{spinner} ",              hl_group = "NoiceLspProgressSpinner" },
                { "{data.progress.title} ",  hl_group = "NoiceLspProgressTitle" },
                { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
            }
        }
    },

    messages = { view_search = "mini" },

    views = {
        mini = {
            reverse = false,
            win_options = { winblend = 100 }
        },
        popupmenu = { border = { style = "rounded" } }
    }
})

-- LSP progress bar
vim.api.nvim_set_hl(0, "NoiceLspProgressTitle", { fg = colors.white })
