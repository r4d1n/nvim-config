return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		gh = { enabled = true },
		rename = { enabled = true },
		gitbrowse = { enabled = true },
		picker = { enabled = true },
	},
	keys = {
		{
			"<leader>gp",
			function()
				Snacks.picker.gh_pr()
			end,
			desc = "GitHub Pull Requests (open)",
		},
		{
			"<leader>gP",
			function()
				Snacks.picker.gh_pr({ state = "all" })
			end,
			desc = "GitHub Pull Requests (all)",
		},
		{
			"<leader>gf",
			function()
				Snacks.gitbrowse.open()
			end,
			desc = "Open git file in web browser",
		},
	},
}
