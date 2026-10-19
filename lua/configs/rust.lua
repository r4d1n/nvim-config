-- rustaceanvim owns the rust-analyzer client; don't vim.lsp.enable("rust_analyzer").
-- It merges vim.lsp.config("*") (blink capabilities) and vim.lsp.config("rust-analyzer")
-- into its server config. Buffer keymaps live in after/ftplugin/rust.lua.
vim.lsp.config("rust-analyzer", {
	settings = {
		["rust-analyzer"] = {
			check = { command = "clippy" },
		},
	},
})

-- In-process LSP for Cargo.toml: version/feature completion, hover, and code actions.
require("crates").setup({
	lsp = {
		enabled = true,
		actions = true,
		completion = true,
		hover = true,
	},
})
