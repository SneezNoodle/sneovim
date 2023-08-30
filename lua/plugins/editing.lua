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
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async", "nvim-treesitter/nvim-treesitter" },
		config = function()
			local ufo = require("ufo")
			local load = require("utils.load")

			load.options {
				foldcolumn = "0",
				foldlevel = 99,
				foldlevelstart = 99,
				foldenable = true,
			}
			load.mappings {
				n = {
					["zR"] = { ufo.openAllFolds, { desc = "UFO: Open all folds" } },
                    ["zM"] = { ufo.closeAllFolds, { desc = "UFO: Close all folds" } },
				},
			}
			require('ufo').setup {
				provider_selector = function(bufnr, filetype, buftype)
					return { 'treesitter', 'indent' }
				end
			}
		end,
	}
}
