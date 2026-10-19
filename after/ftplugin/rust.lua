local bufnr = vim.api.nvim_get_current_buf()
local map = function(lhs, args, desc)
	vim.keymap.set("n", lhs, function()
		vim.cmd.RustLsp(args)
	end, { silent = true, buffer = bufnr, desc = desc })
end

-- Overrides of the global LSP maps with rust-analyzer-aware versions
map("K", { "hover", "actions" }, "Hover with actions")
map("<leader>ca", "codeAction", "Code action (grouped)")

map("<leader>re", "explainError", "Explain error")
map("<leader>rd", "renderDiagnostic", "Render diagnostic (cargo style)")
map("<leader>rr", "runnables", "Runnables")
map("<leader>rt", "testables", "Testables")
map("<leader>rm", "expandMacro", "Expand macro")
map("<leader>ro", "openDocs", "Open docs.rs")
map("<leader>rc", "openCargo", "Open Cargo.toml")
map("<leader>rp", "parentModule", "Parent module")
