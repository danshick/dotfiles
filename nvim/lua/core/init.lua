-- utf-8 encoding
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- line numbers on
vim.wo.number = true

-- mouse mode on
vim.o.mouse = 'a'

-- save undo history
vim.o.undofile = true

-- case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- show non-printing
vim.opt.listchars = {tab = ' ⇥', space = '·'}
vim.opt.list = true

-- tabs render as two spaces
vim.opt.tabstop = 2

-- sign column on
vim.wo.signcolumn = 'yes'

-- column highlighting
vim.opt.colorcolumn = {'80'}
vim.o.cursorline = true
vim.o.cursorcolumn = true

-- yank and put to system clipboard
vim.o.clipboard="unnamedplus"

-- allow normal mode cursor beyone last character
vim.o.virtualedit = 'onemore'

-- set <space> as the leader key
-- and disable it's default behavior in normal and visual mode
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- vim command completion like bash
vim.opt.wildmode={'longest', 'list'}
vim.opt.wildmenu=true
