local lualine = require("lualine")
local devicons = require("nvim-web-devicons")
local colors = require("serpkai")

local theme = {
    normal = {
        a = { bg = colors.white, fg = colors.bg },
        b = { bg = colors.bg, fg = colors.white },
        c = { bg = colors.bg, fg = colors.white }
    },
    insert = {
        a = { bg = colors.blue, fg = colors.bg },
        b = { bg = colors.bg, fg = colors.white },
        c = { bg = colors.bg, fg = colors.white }
    },
    visual = {
        a = { bg = colors.green, fg = colors.bg },
        b = { bg = colors.bg, fg = colors.white },
        c = { bg = colors.bg, fg = colors.white }
    },
    replace = {
        a = { bg = colors.red, fg = colors.bg },
        b = { bg = colors.bg, fg = colors.white },
        c = { bg = colors.bg, fg = colors.white }
    },
    command = {
        a = { bg = colors.purple, fg = colors.bg },
        b = { bg = colors.bg, fg = colors.white },
        c = { bg = colors.bg, fg = colors.white }
    },
    inactive = {
        a = { bg = "none", fg = "none" },
        b = { bg = "none", fg = "none" },
        c = { bg = "none", fg = "none" }
    }
}

local tab_head = {
    function()
        return #vim.api.nvim_list_tabpages() > 1 and "" or ""
    end,
    color = { bg = colors.bg, fg = colors.white },
    padding = 0,
    separator = { left = "", right = "" }
}

local tab_tail = {
    function()
        return #vim.api.nvim_list_tabpages() > 1 and " " or ""
    end,
    color = { bg = colors.bg, fg = colors.white },
    padding = 0,
    separator = { left = "", right = "" }
}

local function fmt_tab(tabnr, tabid)
    local win = vim.api.nvim_tabpage_get_win(tabid)
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    buf_name = vim.fn.fnamemodify(buf_name, ":t")
    local ext = vim.fn.fnamemodify(buf_name, ":e")
    local icon = devicons.get_icon(buf_name, ext, { default = true })
    if buf_name == nil or buf_name == "" then
        buf_name = "[No Name]"
    end
    local cur = vim.api.nvim_get_current_tabpage()
    local head = cur == tabid and "" or ""
    local tail = cur == tabid and "" or ""
    return head .. tabnr .. "  " .. icon .. " " .. buf_name .. tail
end

local tabs_before = {
    function()
        local tabs = ""
        for tabnr, tabid in ipairs(vim.api.nvim_list_tabpages()) do
            if tabid == vim.api.nvim_get_current_tabpage() then break end
            tabs = tabs .. fmt_tab(tabnr, tabid) .. " "
        end
        return tabs
    end,
    padding = 0,
    separator = { left = "", right = "" }
}

local tab_cur = {
    function()
        if #vim.api.nvim_list_tabpages() <= 1 then
            return ""
        end
        local tabid = vim.api.nvim_get_current_tabpage()
        local tabnr = vim.api.nvim_tabpage_get_number(tabid)
        return fmt_tab(tabnr, tabid)
    end,
    color = { bg = colors.fg, fg = colors.bg },
    padding = 0
}

local tabs_after = {
    function()
        local tabs = ""
        for tabnr, tabid in ipairs(vim.api.nvim_list_tabpages()) do
            if tabnr <= vim.api.nvim_tabpage_get_number(vim.api.nvim_get_current_tabpage()) then
                goto continue
            end
            tabs = tabs .. fmt_tab(tabnr, tabid) .. " "
            ::continue::
        end
        return tabs
    end,
    padding = 0,
    separator = { left = "", right = "" }
}

local filename_path = {
    "filename",
    file_status = false,
    newfile_status = false,
    path = 1,
    shorting_target = 20,
    padding = 0,
    separator = { left = "", right = "" },
    color = { fg = colors.gray },
    fmt = function(name)
        if name == "[No Name]" then return " " end
        local path = vim.fn.fnamemodify(name, ":h")
        if path == "." then return " " end
        if path:sub(1, 1) == "/" then path = path:sub(2) end
        return " " .. path:gsub("/", "  ") .. "  "
    end
}

local filename_icon = {
    "filename",
    file_status = false,
    newfile_status = false,
    path = 2,
    shorting_target = 20,
    padding = 0,
    separator = { left = "", right = "" },
    fmt = function(name)
        local filename = vim.fn.fnamemodify(name, ":t")
        local ext = vim.fn.fnamemodify(name, ":e")
        local icon
        icon, icon_color = devicons.get_icon_color(filename, ext, { default = true })
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if name == vim.api.nvim_buf_get_name(buf) then
                if vim.bo[buf].readonly then
                    icon = ""
                elseif vim.fn.getbufinfo(buf)[1].changed == 1 then
                    icon = "●"
                end
            end
        end
        return icon .. " "
    end
}

local filename = {
    "filename",
    file_status = false,
    newfile_status = false,
    path = 0,
    shorting_target = 20,
    padding = 0,
    separator = { left = "", right = "" },
    color = { gui = "bold" }
}

lualine.setup {
    options = {
        theme = theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        refresh = {
            winbar = 100,
            statusline = 100
        }
    },
    winbar = {
        lualine_a = {
            {
                function() return "" end,
                color = function()
                    local fg = colors.white
                    local mode = vim.api.nvim_get_mode().mode
                    if mode == "i" then
                        fg = colors.blue
                    elseif mode == "v"
                        or mode == "V"
                        or mode == vim.fn.nr2char(22)
                        or mode == "s" then
                        fg = colors.green
                    elseif mode == "R" then
                        fg = colors.red
                    elseif mode == "c" then
                        fg = colors.purple
                    end
                    return { fg = fg, bg = colors.bg }
                end,
                padding = 0
            },
            "mode",
            "branch"
        },
        lualine_b = {},
        lualine_c = {
            filename_path,
            filename_icon,
            filename
        },
        lualine_x = {},
        lualine_y = {
            {
                "diff",
                diff_color = {
                    added = { fg = colors.green },
                    modified = { fg = colors.yellow },
                    removed = { fg = colors.red }
                }
            },
            {
                "diagnostics",
                diagnostics_color = {
                    error = { fg = colors.red },
                    warn = { fg = colors.yellow },
                    info = { fg = colors.cyan },
                    hint = { fg = colors.blue }
                },
            }
        },
        lualine_z = {}
    },
    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            filename_path,
            filename_icon,
            filename
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    sections = {
        lualine_a = {},
        lualine_b = {
            tabs_before,
            tab_head,
            tab_cur,
            tab_tail,
            tabs_after
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    }
}

vim.api.nvim_create_autocmd(
    { "TabNew", "TabClosed" },
    {
        callback = function() lualine.refresh({ place = { "statusline" } }) end
    }
)
