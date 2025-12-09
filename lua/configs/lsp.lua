local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.enable("eslint")
vim.lsp.enable("lua_ls")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("terraformls")
vim.lsp.config("html", { filetypes = { "html", "handlebars" }, capabilities = capabilities })
vim.lsp.enable("html")

require("typescript-tools").setup({})

require("elixir").setup({
	nextls = {
		enable = true,
		init_options = {
			experimental = {
				completions = {
					enable = true, -- control if completions are enabled. defaults to false
				},
			},
		},
	},
	credo = { enable = true },
	elixirls = { enable = false },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = false,
})

vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })
