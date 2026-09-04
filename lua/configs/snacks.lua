---@type snacks.Config
require("snacks").setup({
	bigfile = { enabled = true },
	gh = { enabled = true },
	rename = { enabled = true },
	gitbrowse = { enabled = true },
	picker = { enabled = true },
})

vim.keymap.set("n", "<leader>gp", function()
	Snacks.picker.gh_pr()
end, { desc = "GitHub Pull Requests (open)" })

vim.keymap.set("n", "<leader>gP", function()
	Snacks.picker.gh_pr({ state = "all" })
end, { desc = "GitHub Pull Requests (all)" })

vim.keymap.set("n", "<leader>gf", function()
	Snacks.gitbrowse.open()
end, { desc = "Open git file in web browser" })
