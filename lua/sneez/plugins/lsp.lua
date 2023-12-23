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
			local default_config = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Add cmp capabilities
				on_attach = function(client, bufnr)
					client.server_capabilities.semanticTokensProvider = nil -- Let treesitter handle syntax highlighting (except it breaks every 5 minutes)
				end,
			}

			-- Setup mason-lspconfig before lspconfig
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup { ensure_installed = { "lua_ls" } }

			-- Set default config for lspconfig
			local lspconfig = require("lspconfig")
			lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, default_config)

			-- Set up installed servers
			local server_configs = require("sneez.lsp-settings")
			mason_lspconfig.setup_handlers {
				function(server_name)
					lspconfig[server_name].setup(server_configs[server_name] or {})
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
			vim.keymap.set("n", prefix .. "e", function()
					vim.diagnostic.open_float { focus = false }
				end, { desc = "Open floating diagnostic" })
			vim.keymap.set("n", prefix .. "r", function()
					vim.lsp.buf.rename()
				end, { desc = "Rename symbol" })
			vim.keymap.set("n", prefix .. "d", function()
					vim.lsp.buf.definition()
				end, { desc = "Go to definition" })
			vim.keymap.set("n", prefix .. "s", function()
					vim.lsp.buf.signature_help()
				end, { desc = "View signature" })
			vim.keymap.set("n", prefix .. "a", function()
					vim.lsp.buf.code_action()
				end, { desc = "Code action" })
		end,
	},
}
