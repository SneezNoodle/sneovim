local function reload(coreFile)
	local path = "sneez.core." .. coreFile
	package.loaded[path] = nil
	require(path)()
end

local commands = {
	ReloadOptions = { function() reload("options") end },
	ReloadMappings = { function() reload("mappings") end },
}

return function()
	local defaultOpts = {

	}
	for cmdName, cmdData in pairs(commands) do
		local opts = vim.tbl_extend("keep", cmdData[2] or {}, defaultOpts)
		vim.api.nvim_create_user_command(cmdName, cmdData[1], opts)
	end
end
