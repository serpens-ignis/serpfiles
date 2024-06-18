-- enable relative line numbering when focusing window or leaving insert mode
vim.api.nvim_create_autocmd(
    { "BufEnter", "FocusGained", "InsertLeave" },
    {
        callback = function()
            local mode = vim.fn.mode()
            if mode ~= "i" then
                vim.opt.relativenumber = true
            end
        end
    }
)

-- disable relative line numbering when defocusing window or entering insert mode
vim.api.nvim_create_autocmd(
    { "BufRead", "FocusLost", "InsertEnter" },
    {
        callback = function()
            vim.opt.relativenumber = false
        end
    }
)

-- automatically resize splits when resizing nvim
vim.api.nvim_create_autocmd(
    "VimResized",
    {
        pattern = "*",
        command = "wincmd =",
    }
)
