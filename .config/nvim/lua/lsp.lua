local lsp_cfg = require("lspconfig")

-- icons
local symbols = { Error = "󰅚", Info = "󰋽", Hint = "󰌶", Warn = "󰀪" }
for name, icon in pairs(symbols) do
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

-- lua
lsp_cfg.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT"
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                    "${3rd}/love2d/library"
                }
            }
        }
    }
}

-- rust
lsp_cfg.rust_analyzer.setup {}

-- zig
lsp_cfg.zls.setup {}

-- C, C++, Objective-C, Objective-C++, CUDA
lsp_cfg.clangd.setup {
    cmd = {
        "clangd",
        "--query-driver=/opt/devkitpro/devkitARM/bin/arm-none-eabi-gcc"
    }
}

-- JSON
lsp_cfg.jsonls.setup {}

-- CSS
lsp_cfg.cssls.setup {}

-- LaTeX
lsp_cfg.texlab.setup {}
