local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.enable("eslint")
vim.lsp.enable("lua_ls")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("terraformls")
vim.lsp.config("html", { filetypes = { "html", "handlebars" }, capabilities = capabilities })
vim.lsp.enable("html")

require("typescript-tools").setup({})

vim.diagnostic.config({
	underline = true,
	virtual_text = false,
})

vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.jump({ count = -1 }) end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.jump({ count = 1 }) end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
