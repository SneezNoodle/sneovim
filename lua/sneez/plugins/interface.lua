return {
	{
		"akinsho/toggleterm.nvim",
		opts = {
			direction = "float",
			open_mapping = "<C-/>",
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
					["<C-.>"] = "actions.toggle_hidden",

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

			-- Set float toggle keymaps
			vim.keymap.set("n", "<Leader>e", function()
				oil.toggle_float()
			end, { desc = "Toggle oil float (buffer parent)" })
			vim.keymap.set("n", "<Leader>E", function()
				oil.toggle_float(vim.fn.getcwd())
			end, { desc = "Toggle oil float (cwd)" })
		end,
	},
}
