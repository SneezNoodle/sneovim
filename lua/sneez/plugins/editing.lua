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
				below = "<Leader>/J",
				eol = "<Leader>/L",
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		opts = {
			disable_filetype = { "oil" },
			disable_in_visualblock = true,
			map_c_w = true, -- i_<C-w> should delete pairs when possible
		},
	},
}
