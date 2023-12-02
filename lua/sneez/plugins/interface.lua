return {
	{
		"akinsho/toggleterm.nvim",
		opts = {
			direction = "float",
			open_mapping = "<A-'>",
			float_opts = {
				border = "single",
			},
		},
		config = true,
	},
	{
		"sneeznoodle/bufmenu.nvim",
		opts = {
			use_bdelete = false,
		},
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local oil = require("oil")
			oil.setup {
				win_options = {
					number = true,
					relativenumber = false,
				},
				use_default_keymaps = false,
				keymaps = {
					["g?"] = "actions.show_help",
					["<F5>"] = "actions.refresh",
					["<C-m>"] = "actions.toggle_hidden",

					["<CR>"] = "actions.select",
					["<C-s>"] = "actions.select_split",
					["<C-v>"] = "actions.select_vsplit",
					["<C-t>"] = "actions.select_tab",
					["<C-p>"] = "actions.preview",
					["<C-c>"] = "actions.close",

					["-"] = "actions.parent",

					["_"] = "actions.open_cwd",
					["="] = "actions.cd",
					["+"] = "actions.tcd",
				},
				float = {
					border = "single",
					win_options = { winblend = 0 },
				},
				preview = { border = "single" },
				progress = { border = "single" },
			}

			-- Set open mappings
			vim.keymap.set("n", "<Leader>e", function() oil.open() end, { desc = "Open oil current buffer directory" })
			vim.keymap.set("n", "<Leader>E", function() oil.open(vim.fn.getcwd()) end, { desc = "Open oil to current working directory" })
		end,
	},
}
