return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 9001,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Extract more complex components for better reusability
			local components = {
				filename = {
					"filename",
					file_status = true,
					newfile_status = true,
					path = 0,
					symbols = {
						modified = "{}",
						readonly = "[]",
						newfile = "{󱪝}",
						unnamed = "[No Name]",
					},
					-- Display oil dir
					fmt = function(str, ctx)
						if vim.o.ft == "oil" then
							return vim.fn.fnamemodify(require("oil").get_current_dir(), ":~")
						else
							return str
						end
					end,
				},
				-- Display cwd with an icon
				cwd = function()
					return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
				end,
			}
			require("lualine").setup {
				options = {
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },

					ignore_focus = { "oil" },

					refresh = {
						statusline = 500,
						tabline = 500,
					},
				},
				extensions = { "toggleterm" },

				tabline = {
					lualine_a = { "tabs" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},

				sections = {
					lualine_a = { components.filename },
					lualine_b = { "filetype", "fileformat" },
					lualine_c = { "encoding" },
					lualine_x = {},
					lualine_y = { components.cwd, "branch", "diff" },
					lualine_z = { "%c:%l/%L" }, -- [Current byte], [Current line]/[Total lines]
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = { components.filename },
					lualine_c = {},
					lualine_x = {},
					lualine_y = { "%c:%l/%L" },
					lualine_z = {},
				},
			}

			-- Stop Lualine from eating my tabline option (feels like there should be a better way than this but I cannot find it)
			vim.opt.showtabline = require("core.options").showtabline
		end,
	},
}
