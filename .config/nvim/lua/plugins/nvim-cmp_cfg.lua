local colors = require("serpkai")
local cmp = require("cmp")

cmp.setup {
    sources = {
        { name = "nvim_lsp" }
    },
    snippet = {
        expand = function(arg)
            vim.snippet.expand(arg.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ["<CR>"] = cmp.mapping.confirm { select = false },
        ["<Right>"] = cmp.mapping.confirm { select = false },
        ["<C-Up>"] = cmp.mapping.scroll_docs(-4),
        ["<C-Down>"] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp.mapping(
            function(fallback)
                if vim.snippet.active({ direction = 1 }) then
                    vim.snippet.jump(1)
                else
                    fallback()
                end
            end,
            { "i", "s" }
        ),
        ["<S-Tab>"] = cmp.mapping(
            function(fallback)
                if vim.snippet.active({ direction = -1 }) then
                    vim.snippet.jump(-1)
                else
                    fallback()
                end
            end,
            { "i", "s" }
        )
    },
    formatting = {
        format = function(entry, vim_item)
            if vim.tbl_contains({ "path" }, entry.source.name) then
                local devicons = require("nvim-web-devicons")
                local icon, hl_group = devicons.get_icon(entry:get_completion_item().label)
                if icon then
                    vim_item.kind = icon
                    vim_item.kind_hl_group = hl_group
                    return vim_item
                end
            end
            return require("lspkind").cmp_format()(entry, vim_item)
        end
    },
    window = {
        completion = {
            border = "rounded"
        },
        documentation = {
            border = "rounded"
        }
    },
    experimental = {
        ghost_text = true,
    }
}

local cmd_mapping = {
    ["<Up>"] = {
        c = function()
            if cmp.visible() then
                cmp.select_prev_item()
            end
        end
    },
    ["<Down>"] = {
        c = function()
            if cmp.visible() then
                cmp.select_next_item()
            end
        end
    },
    ["<Right>"] = {
        c = function()
            if cmp.visible() then
                cmp.confirm()
            end
        end
    },
    ["<CR>"] = {
        c = function(fallback)
            if cmp.get_active_entry() then
                cmp.confirm()
            else
                fallback()
            end
        end
    }
}

-- search cmdline setup
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" }
    },
    mapping = cmd_mapping
})

-- command cmdline setup
cmp.setup.cmdline(":", {
    sources = cmp.config.sources(
        {
            { name = "nvim-lsp" },
            { name = "buffer" }
        },
        {
            {
                name = "cmdline",
                option = {
                    ignore_cmds = { "Man", "!" }
                }
            }
        }
    ),
    mapping = cmd_mapping
})

-- menu
vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.bg })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.white, fg = colors.bg, blend = 0 })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.white, blend = 0 })

-- deprecated text
vim.api.nvim_set_hl(
    0,
    "CmpItemAbbrDeprecated",
    { bg = "none", strikethrough = true, fg = colors.gray }
)

-- matched text
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "none", fg = colors.blue })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })

-- variables
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "none", fg = colors.blue })
vim.api.nvim_set_hl(0, "CmpItemKindField", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindVariable" })

-- routines
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "none", fg = colors.red })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { link = "CmpItemKindFunction" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { link = "CmpItemKindFunction" })

-- types
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { bg = "none", fg = colors.purple })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { link = "CmpItemKindStruct" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { link = "CmpItemKindStruct" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindStruct" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { link = "CmpItemKindStruct" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindStruct" })

-- values
vim.api.nvim_set_hl(0, "CmpItemKindValue", { bg = "none", fg = colors.yellow })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { link = "CmpItemKindValue" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { link = "CmpItemKindValue" })
vim.api.nvim_set_hl(0, "CmpItemKindConstant", { link = "CmpItemKindValue" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { link = "CmpItemKindValue" })

-- imports
vim.api.nvim_set_hl(0, "CmpItemKindModule", { bg = "none", fg = colors.green })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { link = "CmpItemKindModule" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { link = "CmpItemKindModule" })

-- keywords
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "none", fg = colors.cyan })

-- other
vim.api.nvim_set_hl(0, "CmpItemKindText", { bg = "none", fg = colors.gray })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { link = "CmpItemKindText" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { link = "CmpItemKindText" })
