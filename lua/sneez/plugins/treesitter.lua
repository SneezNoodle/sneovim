---@diagnostic disable: missing-fields
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = { "lua" },

				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<A-v>",
						node_incremental = "<A-=>",
						node_decremental = "<A-->",
						scope_incremental = "<A-s>",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					swap = {
						enable = true,

						swap_next = {
							["<Leader>tl"] = "@parameter.inner",
							["<Leader>tj"] = "@function.outer",
						},
						swap_previous = {
							["<Leader>th"] = "@parameter.inner",
							["<Leader>tk"] = "@function.outer",
						},
					},
				},
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
