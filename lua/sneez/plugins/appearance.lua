return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 9001,
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local components = {
				-- Tabline
				tabs = {
					"tabs",
					show_modified_status = false,
				},
				term = function()
					return vim.o.ft == "toggleterm" and
						vim.fn.bufname():gsub(".*(#[0-9]*)", "Terminal %1") or
					""
				end,

				-- Statusline
				filename = {
					"filename",
					file_status = true,
					newfile_status = true,
					path = 0,
					symbols = {
						modified = "[+]",
						readonly = "[-]",
						newfile = "[*]",
						unnamed = "[No Name]",
					},
					-- Display oil dir
					fmt = function(str, ctx)
						if vim.o.ft == "oil" then
							local oil_path = vim.fn.fnamemodify(require("oil").get_current_dir(), ":~:.")
							local first = oil_path:sub(1,1)
							oil_path = (first ~= "~" and first ~= "/") and "./" .. oil_path or oil_path

							return " " .. oil_path
						else
							return str
						end
						return vim.o.ft == "oil" and
						str
					end,
				},
				-- Display cwd with an icon
				cwd = function()
					return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				end,
				pos= "%c:%l/%L" -- [Current byte]:[Current line]/[Total lines]
			}
			require("lualine").setup {
				options = {
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },

					refresh = {
						statusline = 500,
						tabline = 500,
					},
				},
				extensions = { "toggleterm" },

				tabline = {
					lualine_a = { components.tabs },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { components.term },
				},

				sections = {
					lualine_a = { components.filename },
					lualine_b = { "filetype", "fileformat" },
					lualine_c = { "encoding" },
					lualine_x = {},
					lualine_y = { components.cwd, "branch", "diff" },
					lualine_z = { components.pos },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = { components.filename },
					lualine_c = {},
					lualine_x = {},
					lualine_y = { components.pos },
					lualine_z = {},
				},
			}
		end,
	},
}
