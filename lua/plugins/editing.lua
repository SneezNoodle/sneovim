return {
	{
		"kylechui/nvim-surround",
		--opts = { }, -- TODO add custom maps
		config = true,
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			mappings = {
				basic = true,
				extra = true,
			},
			toggler = {
				line = "<Leader>//",
				block = "<Leader>??",
			},
			opleader = {
				line = "<Leader>/",
				block = "<Leader>?",
			},
			extra = {
				above = "<Leader>/K",
				belove = "<Leader>/J",
				eol = "<Leader>/L"
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		-- event = "InsertEnter",
		opts = {
			disable_filetype = { "oil" },
			disable_in_visualblock = true,
		},
	},
}
