return {
	Core = {
		TextYankPost = {
			pattern = "*",
			desc = "Highlight yanked text",
			callback = function()
				vim.highlight.on_yank()
			end,
		},
	},
}
