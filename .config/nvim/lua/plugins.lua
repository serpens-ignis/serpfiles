local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- color schemes
Plug("tanvirtin/monokai.nvim")

-- lsp
Plug("neovim/nvim-lspconfig")    -- LSP configs
Plug("hrsh7th/nvim-cmp")         -- Autocompletion engine
Plug("hrsh7th/cmp-nvim-lsp")     -- Autocompletion sources
Plug("L3MON4D3/LuaSnip")         -- Snippet engine
Plug(
    "VonHeikemen/lsp-zero.nvim", -- LSP setup abstraction
    { branch = "v3.x" }
)

-- misc
Plug("vim-airline/vim-airline")        -- Bottom status bar
Plug("vim-airline/vim-airline-themes") -- Bottom status bar themes
Plug("Yggdroot/indentLine")            -- Line indentation visualization
Plug(
    "nvim-treesitter/nvim-treesitter", -- Tree-sitter configs
    { ["do"] = vim.fn[":TSUpdate"] }
)

vim.call('plug#end')
