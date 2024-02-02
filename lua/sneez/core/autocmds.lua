local augroups = {
	Sneez = {
		TextYankPost = {
			{ "*", "silent! lua vim.highlight.on_yank { higroup = 'Search' }" },
		},
		BufWinEnter = {
			{ "*", "silent! loadview" },
		},
		BufWritePost = {
			{ "*", "mkview" },
		}
	}
}

return {
	load = function()
		for group, events in pairs(augroups) do
			vim.api.nvim_create_augroup(group, { clear = true })
			for event, cmds in pairs(events) do
				for _, cmd in ipairs(cmds) do
					local autocmd_opts = {
						group = group,
						pattern = cmd[1],
						-- Set callback or command based on which is provided
						[type(cmd[2]) == "function" and "callback" or "command"] = cmd[2]
					}
					vim.api.nvim_create_autocmd(event, autocmd_opts)
				end
			end
		end
	end,
}
