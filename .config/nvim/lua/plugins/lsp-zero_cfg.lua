local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(
    function(client, bufnr)
        -- use default keymaps
        lsp_zero.default_keymaps({ buffer = bufnr })
        -- format on save
        lsp_zero.buffer_autoformat()
        -- turn off semantic tokens (too slow)
        client.server_capabilities.semanticTokensProvider = nil

        -- extra keymaps
        vim.keymap.set("n", "<leader>d", vim.diagnostic.goto_next, { buffer = bufnr })
        vim.keymap.set("n", "<leader><S-d>", vim.diagnostic.goto_prev, { buffer = bufnr })
    end
)
