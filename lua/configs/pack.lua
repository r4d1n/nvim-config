-- Build hooks and maintenance commands for the built-in plugin manager.
-- Required before `vim.pack.add()` so the PackChanged autocmd exists in time
-- for the very first install.

-- Keyed by plugin name. A table value is an argv list run in the plugin's
-- directory; a function value is called with the PackChanged event data
-- (`path`, `active`, `kind`, `spec`).
local build = {
	["telescope-fzf-native.nvim"] = { "make" },
	["LuaSnip"] = { "make", "install_jsregexp" },
	["nvim-treesitter"] = function(data)
		-- Replaces lazy's `build = ":TSUpdate"`. On install the plugin is not
		-- loaded yet, so its Lua module has to be made reachable first.
		if not data.active then
			vim.cmd.packadd("nvim-treesitter")
		end
		require("nvim-treesitter").update()
	end,
}

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.kind ~= "install" and ev.data.kind ~= "update" then
			return
		end
		local hook = build[ev.data.spec.name]
		if type(hook) == "table" then
			vim.system(hook, { cwd = ev.data.path }):wait()
		elseif type(hook) == "function" then
			hook(ev.data)
		end
	end,
})

local names = function()
	return vim.iter(vim.pack.get())
		:map(function(p)
			return p.spec.name
		end)
		:totable()
end

vim.api.nvim_create_user_command("PackUpdate", function(o)
	vim.pack.update(#o.fargs > 0 and o.fargs or nil)
end, { nargs = "*", complete = names, desc = "Update all plugins, or those named" })

vim.api.nvim_create_user_command("PackStatus", function()
	vim.pack.update(nil, { offline = true })
end, { desc = "Browse installed plugins without fetching" })

vim.api.nvim_create_user_command("PackClean", function()
	local orphans = vim.iter(vim.pack.get())
		:filter(function(p)
			return not p.active
		end)
		:map(function(p)
			return p.spec.name
		end)
		:totable()
	if #orphans == 0 then
		return vim.notify("No orphaned plugins", vim.log.levels.INFO)
	end
	local msg = "Delete from disk?\n" .. table.concat(orphans, "\n")
	if vim.fn.confirm(msg, "&Yes\n&No", 2) == 1 then
		vim.pack.del(orphans)
	end
end, { desc = "Remove plugins on disk that init.lua no longer adds" })
