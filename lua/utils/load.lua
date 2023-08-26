local M = {}

-- Table format: { Mode = { Keycode = { RHS, { opts } } } }
function M.mappings(map_table)
	for mode, maps in pairs(map_table) do
		for keycode, mapping in pairs(maps) do
			vim.keymap.set(mode, keycode, mapping[1], mapping[2] or {})
		end
	end
end

-- Table format: { Option = value (see vim.opt) }
function M.options(option_table)
	for opt, val in pairs(option_table) do
		vim.opt[opt] = val
	end
end

-- Table format: { Group = { Event = { opts (see nvim_create_augroup) } } }
function M.autocmds(autocmd_table)
	for augroup_name, cmds in pairs(autocmd_table) do
		local augroup_id = vim.api.nvim_create_augroup(augroup_name, { clear = true })

		for event, cmd in pairs(cmds) do
			vim.api.nvim_create_autocmd(event, cmd)
		end
	end
end

return M
