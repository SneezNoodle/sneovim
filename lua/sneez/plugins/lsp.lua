return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- Setup mason-lspconfig before lspconfig
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup { ensure_installed = { "lua_ls" } }

			-- Set default config for lspconfig
			local default_config = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Add cmp capabilities
				on_attach = function(client, bufnr)
					client.server_capabilities.semanticTokensProvider = nil -- Let treesitter handle syntax highlighting (except it breaks every 5 minutes)
				end,
			}
			local lspconfig = require("lspconfig")
			lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, default_config)

			-- Use config from respective file
			mason_lspconfig.setup_handlers {
				function(server_name)
					local has_config, config = pcall(require, "lsp-settings." .. server_name)
					if not has_config then
						config = { } -- Use defaults
					end
					lspconfig[server_name].setup(config)
				end
			}

			-- LSP support for vim.api.nvim_*
			require("neodev").setup()

			-- Disable intrusive diagnostics
			vim.diagnostic.config {
				virtual_text = false,
				signs = false,
				underline = true,
			}

			-- Load lsp mappings
			local prefix = "<Leader>l"
			require("sneez.utils.load").mappings {
				n = {
					[prefix .. "d"] = {
						function()
							vim.diagnostic.open_float { focus = false }
						end,
						{ desc = "Open floating diagnostic" },
					},
					[prefix .. "r"] = {
						function()
							vim.lsp.buf.rename()
						end,
						{ desc = "Rename symbol" },
					},
					[prefix .. "D"] = {
						function()
							vim.lsp.buf.definition()
						end,
						{ desc = "Go to definition" },
					},
					[prefix .. "s"] = {
						function()
							vim.lsp.buf.signature_help()
						end,
						{ desc = "View signature" },
					},
					[prefix .. "a"] = {
						function()
							vim.lsp.buf.code_action()
						end,
						{ desc = "View signature" },
					},
				},
			}
		end,
	},
}
