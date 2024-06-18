-----------------------------
-- SPLITS
-----------------------------

-- move focus
vim.keymap.set("n", "<C-Up>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { noremap = true, silent = true })

-- move split
vim.keymap.set("n", "<C-S-Up>", "<C-w><S-k>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-Down>", "<C-w><S-j>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-Left>", "<C-w><S-h>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-Right>", "<C-w><S-l>", { noremap = true, silent = true })

-- split create/delete
vim.keymap.set("n", "<C-d>", ":vnew<CR><C-w><S-l>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-f>", ":new<CR><C-w><S-j>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-c>", ":q<CR>", { silent = true })

-----------------------------
-- TABS
-----------------------------

-- tab create/delete
vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-c>", ":tabclose<CR>", { noremap = true, silent = true })

-- change tabs
vim.keymap.set("n", "<C-1>", "1gt", { noremap = true })
vim.keymap.set("n", "<C-2>", "2gt", { noremap = true })
vim.keymap.set("n", "<C-3>", "3gt", { noremap = true })
vim.keymap.set("n", "<C-4>", "4gt", { noremap = true })
vim.keymap.set("n", "<C-5>", "5gt", { noremap = true })
vim.keymap.set("n", "<C-6>", "6gt", { noremap = true })
vim.keymap.set("n", "<C-7>", "7gt", { noremap = true })
vim.keymap.set("n", "<C-8>", "8gt", { noremap = true })
vim.keymap.set("n", "<C-9>", "9gt", { noremap = true })

-----------------------------
-- BUFFERS
-----------------------------

-- save buffer
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- change to previous buffer
vim.keymap.set("n", "fq", ":b#<CR>", { silent = true })

-----------------------------
-- TELESCOPE
-----------------------------

local builtin = require("telescope.builtin")

-- files
vim.keymap.set("n", "ff", builtin.find_files, {})
vim.keymap.set("n", "fg", builtin.live_grep, {})

-- vim
vim.keymap.set("n", "fb", builtin.buffers, {})
vim.keymap.set("n", "fm", ":Noice telescope<CR>", { silent = true })

-- git
vim.keymap.set("n", "fc", builtin.git_bcommits, {})

-- treesitter
vim.keymap.set("n", "ft", builtin.treesitter, {})

-- lsp
vim.keymap.set("n", "fd", function() builtin.diagnostics({ bufnr = 0 }) end, {})
vim.keymap.set("n", "f<S-d>", builtin.diagnostics, {})
vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
vim.keymap.set("n", "gr", builtin.lsp_references, {})
vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
vim.keymap.set("n", "go", builtin.lsp_type_definitions, {})
vim.keymap.set("n", "gs", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "g<S-s>", builtin.lsp_dynamic_workspace_symbols, {})
