local lsp_cfg = require("lspconfig")

-- lua
lsp_cfg.lua_ls.setup {
    settings = {
        Lua = {
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                    "${3rd}/love2d/library"
                }
            }
        }
    }
}

-- python
lsp_cfg.pyright.setup {
    settings = {
        pyright = {
            disableOrganizeImports = true,
            disableTaggedHints = true,
        },
        python = {
            analysis = {
                diagnosticSeverityOverrides = {
                    reportMissingImports = "none",
                    reportUndefinedVariable = "none",
                },
            },
        },
    },
}
lsp_cfg.ruff_lsp.setup {}

-- rust
lsp_cfg.rust_analyzer.setup {}

-- C, C++, Objective-C, Objective-C++, CUDA
lsp_cfg.clangd.setup {}

-- JSON
lsp_cfg.jsonls.setup {}

-- CSS
lsp_cfg.cssls.setup {}
