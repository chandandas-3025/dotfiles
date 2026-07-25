-- Helper
local map = vim.keymap.set

-- General

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear Search Highlight" })

-- Save & Quit
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save File" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit Window" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit All" })

-- Window Navigation

map("n", "<C-h>", "<C-w>h", { desc = "Left Window" })
map("n", "<C-j>", "<C-w>j", { desc = "Lower Window" })
map("n", "<C-k>", "<C-w>k", { desc = "Upper Window" })
map("n", "<C-l>", "<C-w>l", { desc = "Right Window" })

-- Window Resize

map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase Height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase Width" })

-- Buffer Navigation

map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })

-- Better Indentation

map("v", "<", "<gv", { desc = "Indent Left" })
map("v", ">", ">gv", { desc = "Indent Right" })

-- Move Selected Lines

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Up" })

-- Terminal

map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })

-- Diagnostics

map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

-- Quickfix

map("n", "[q", "<cmd>cprev<CR>", { desc = "Previous Quickfix" })
map("n", "]q", "<cmd>cnext<CR>", { desc = "Next Quickfix" })
