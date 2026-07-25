-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true 

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true 

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Appearance
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- Mouse support
vim.opt.mouse = "a"

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Scrolling
vim.opt.scrolloff = 8

-- Wrapping
vim.opt.wrap = true 

-- Undo
vim.opt.undofile = true

-- Faster update
vim.opt.updatetime = 250

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable swap files
vim.opt.swapfile = false

-- Better backspace
vim.opt.backspace = { "indent", "eol", "start" }

-- True color
vim.opt.termguicolors = true

-- Nvim Treesitter Folding
vim.opt.foldmethod = "manual"
vim.opt.foldenable = true
