-- Auto-install parsers when opening a file
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local filetype = vim.bo[args.buf].filetype
		if filetype == "" then
			return
		end

		-- Get the treesitter language for this filetype
		local lang = vim.treesitter.language.get_lang(filetype)
		if not lang then
			return
		end

		require("nvim-treesitter").install(lang)
	end,
})

-- Enable treesitter highlighting for all filetypes
-- with performance optimization for large files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local bufnr = args.buf
		local filetype = vim.bo[bufnr].filetype

		if filetype == "" then
			return
		end

		-- Performance optimization: disable for large files (>30,000 lines)
		if vim.api.nvim_buf_line_count(bufnr) > 30000 then
			return
		end

		-- Get the treesitter language for this filetype
		local lang = vim.treesitter.language.get_lang(filetype)
		if not lang then
			return
		end

		-- Enable treesitter highlighting
		pcall(vim.treesitter.start, bufnr, lang)
	end,
})

-- Enable treesitter-based indentation
-- Set indentexpr for supported filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local bufnr = args.buf
		local filetype = vim.bo[bufnr].filetype

		if filetype == "" then
			return
		end

		-- Get the treesitter language for this filetype
		local lang = vim.treesitter.language.get_lang(filetype)
		if lang then
			-- Use treesitter for indentation if available
			vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})
