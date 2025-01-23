local Plug = vim.fn["plug#"]

vim.call("plug#begin")

-- color schemes
Plug("tanvirtin/monokai.nvim")

-- lsp
Plug("neovim/nvim-lspconfig")    -- LSP configs
Plug("onsails/lspkind.nvim")     -- LSP completion icons
Plug(
    "VonHeikemen/lsp-zero.nvim", -- LSP setup abstraction
    { branch = "v3.x" }
)

-- Autocompletion
Plug("hrsh7th/nvim-cmp")             -- Autocompletion engine
Plug("hrsh7th/cmp-nvim-lsp")         -- Autocompletion sources
Plug("hrsh7th/cmp-buffer")           -- Autocompletion source from buffer
Plug("hrsh7th/cmp-cmdline")          -- Cmdline autocompletion sources
Plug("rafamadriz/friendly-snippets") -- Snippet collection


-- file finder
Plug("nvim-lua/plenary.nvim")        -- Async coroutine programming lib for lua
Plug(
    "nvim-telescope/telescope.nvim", -- Fuzzy file finder
    { branch = "0.1.x" }
)

-- tabline, winbar, statusline
Plug("nvim-tree/nvim-web-devicons") -- Icons for file types
Plug("nvim-lualine/lualine.nvim")   -- Bottom status bar

-- messages, cmdline, popupmenu
Plug("MunifTanjim/nui.nvim") -- UI component lib
Plug("folke/noice.nvim")     -- Messages, cmdline and popupmenu replacement

-- misc
Plug("Yggdroot/indentLine")            -- Line indentation visualization
Plug(
    "nvim-treesitter/nvim-treesitter", -- Tree-sitter configs
    { ["do"] = vim.fn[":TSUpdate"] }
)
Plug("numToStr/Comment.nvim") -- Easy comment/uncomment bindings

vim.call("plug#end")

-- configs
require("plugins.monokai_cfg")
require("plugins.lsp-zero_cfg")
require("plugins.nvim-treesitter_cfg")
require("plugins.nvim-cmp_cfg")
require("plugins.indentline_cfg")
require("plugins.lualine_cfg")
require("plugins.telescope_cfg")
require("plugins.noice_cfg")
require("plugins.comment_cfg")
