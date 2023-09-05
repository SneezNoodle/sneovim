return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "lua" },

			highlight = { enable = true },
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = { -- Prefix mnemonic: node
					init_selection = "<Leader>nn",
					node_incremental = "<C-=>",
					node_decremental = "<C-->",
					scope_incremental = "<Leader>ns",
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
						["<Leader>nl"] = "@parameter.inner",
						["<Leader>nj"] = "@function.outer",
					},
					swap_previous = {
						["<Leader>nh"] = "@parameter.inner",
						["<Leader>nk"] = "@function.outer",
					},
				},
			},
		},
		config = function(plugin, opts)
			vim.cmd("silent TSUpdate")
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
