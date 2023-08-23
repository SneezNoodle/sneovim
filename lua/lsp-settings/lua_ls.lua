return {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false -- Do not prompt to configure environment on every startup
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

