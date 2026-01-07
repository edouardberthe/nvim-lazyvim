-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local unmap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- Remove mapping for terminal, set toggleterm
unmap("n", "<C-/>")
map({ "n", "t" }, "<C-/>", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm" })
