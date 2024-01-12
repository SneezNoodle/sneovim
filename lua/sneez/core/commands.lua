local function reload(coreFile)
	local path = "sneez.core." .. coreFile
	package.loaded[path] = nil
	require(path).load()
end

local commands = {
	ReloadOptions = { function() reload("options") end },
	ReloadMappings = { function() reload("mappings") end },
}

return {
	load = function()
		local default_opts = { }
		for cmd_name, cmd_data in pairs(commands) do
			local opts = vim.tbl_extend("keep", cmd_data[2] or {}, default_opts)
			vim.api.nvim_create_user_command(cmd_name, cmd_data[1], opts)
		end
	end
}
