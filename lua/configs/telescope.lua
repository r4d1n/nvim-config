local telescope = require("telescope")
telescope.load_extension("fzf")

local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open

-- Use this to add more results without clearing the trouble list
-- local add_to_trouble = require("trouble.sources.telescope").add

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<c-t>"] = open_with_trouble },
			n = { ["<c-t>"] = open_with_trouble },
		},
	},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>rg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>gs", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
