-- set <space> as the leader key
-- and disable it's default behavior in normal and visual mode
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- move highlighted line or block up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- half page up/down and recenter
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- paste over or delete without copy
vim.keymap.set("x", "<leader>lp", [["_dP]])
vim.keymap.set({"n", "x"}, "<leader>ld", [["_d]])
