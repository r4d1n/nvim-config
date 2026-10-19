require("mini.comment").setup()
require("mini.hipatterns").setup()
require("mini.fuzzy").setup()
-- Default gr/gx prefixes shadow the built-in gr* LSP maps and gx (open URL)
require("mini.operators").setup({
	replace = { prefix = "cr" },
	exchange = { prefix = "cx" },
})
require("mini.pairs").setup()
require("mini.starter").setup()
require("mini.surround").setup()
require("mini.trailspace").setup()
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
