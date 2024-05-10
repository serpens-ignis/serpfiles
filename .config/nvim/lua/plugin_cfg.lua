-- color scheme
require("monokai").setup { italics = false }

-- lsp-zero
local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(
    function(client, bufnr)
        -- use default keymaps
        lsp_zero.default_keymaps({ buffer = bufnr })
        -- format on save
        lsp_zero.buffer_autoformat()
        -- turn off semantic tokens (too slow)
        client.server_capabilities.semanticTokensProvider = nil
    end
)

-- nvim-cmp
local cmp = require("cmp")
cmp.setup {
    mapping = cmp.mapping.preset.insert {
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Right>'] = cmp.mapping.confirm { select = true },
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    },
    experimental = {
        ghost_text = true,
    }
}

-- indentLine
vim.g.indentLine_setColors = 0 -- use color scheme
vim.g.indentLine_fileTypeExclude = { "json", "jsonc", "jsonl", "jsonp", "markdown" }

-- vim-airline
vim.g.airline_powerline_fonts = 1     -- enable powerline fonts
vim.g.airline_skip_empty_sections = 1 -- don't show sections that have no content
vim.g.airline_theme = "serpkai"

-- nvim-treesitter
require("nvim-treesitter.configs").setup {
    ensure_installed = "all",
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    additional_vim_regex_highlighting = false,
}
