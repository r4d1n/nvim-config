-- bootstrap package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.keymap.set("n", "rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

require("lazy").setup("plugins")
require("configs.cmp")
require("configs.conform")
require("configs.gitsigns")
require("configs.lsp")
require("configs.lualine")
require("configs.mini")
require("configs.settings")
require("configs.telescope")
require("configs.trouble")
require("configs.treesitter")
require("configs.typescript-tools")
