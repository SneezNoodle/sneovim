local M = {}

function M.mappings(map_table)
	for mode, maps in pairs(map_table) do
		for keycode, mapping in pairs(maps) do
			vim.keymap.set(mode, keycode, mapping[1], mapping[2] or {})
		end
	end
end

function M.options(option_table)
	for opt, val in pairs(option_table) do
		vim.opt[opt] = val
	end
end

function M.commands(command_table)
	for name, command in pairs(command_table) do
		vim.api.nvim_create_user_command(name, command[0], command[1] or {})
	end
end

function M.autocmds(autocmd_table)
	for key, value in autocmd_table:pairs() do
		-- Standalone cmds
		if type(key) == "number" then
			local cmd = value
			vim.api.nvim_create_autocmd(cmd[1], cmd[2])
		else -- Grouped cmds
			local augroup = vim.api.nvim_create_augroup(key)
			local autocmds = value
			for _, cmd in autocmds:ipairs() do
				cmd[2].group = augroup
				vim.api.nvim_create_autocmd(cmd[1], cmd[2])
			end
		end
	end
end

return M
