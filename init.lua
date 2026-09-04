vim.g.mapleader = " "

-- Build hooks + :PackUpdate/:PackStatus/:PackClean. Must come before add().
require("configs.pack")

local gh = function(x)
	return "https://github.com/" .. x
end

vim.pack.add({
	{ src = gh("catppuccin/nvim"), name = "catppuccin" },
	gh("nvim-lua/plenary.nvim"),
	gh("rafamadriz/friendly-snippets"),
	{ src = gh("L3MON4D3/LuaSnip"), version = vim.version.range("2") },
	{ src = gh("saghen/blink.cmp"), version = vim.version.range("1") },
	gh("neovim/nvim-lspconfig"),
	gh("pmizio/typescript-tools.nvim"),
	gh("mason-org/mason.nvim"),
	gh("echasnovski/mini.nvim"),
	gh("nvim-lualine/lualine.nvim"),
	gh("folke/snacks.nvim"),
	gh("folke/trouble.nvim"),
	gh("folke/which-key.nvim"),
	gh("stevearc/oil.nvim"),
	gh("stevearc/conform.nvim"),
	gh("lewis6991/gitsigns.nvim"),
	gh("airblade/vim-rooter"),
	gh("sindrets/diffview.nvim"),
	gh("oysandvik94/curl.nvim"),
	gh("nvim-telescope/telescope.nvim"),
	gh("nvim-telescope/telescope-fzf-native.nvim"),
	{ src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
})

require("oil").setup()
require("configs.settings")
require("configs.mason")
require("configs.blink")
require("configs.lsp")
require("configs.conform")
require("configs.curl")
require("configs.gitsigns")
require("configs.lualine")
require("configs.luasnip")
require("configs.mini")
require("configs.snacks")
require("configs.trouble")
require("configs.telescope")
require("configs.treesitter")
