return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-git",
			"L3MON4D3/LuaSnip",
		},

		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			vim.g.autocomplete_enabled = true

			local kind_icons = {
				Text = "󰉿 ",
				Snippet = " ",
				Keyword = " ",
				Variable = " ",
				Field = " ",
				Property = " ",
				Function = "󰡱 ",
				Method = " ",
				Enum = " ",
				Class = " ",
				Struct = " ",
				Interface = " ",
				Module = "󰘦 ",
				File = "󰈙 ",
			}

			-- Main setup
			cmp.setup {
				enabled = vim.g.autocomplete_enabled,
				snippet = {
					expand = function(args) -- Use LuaSnip
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = {
						border = "single",
					},
					documentation = {
						border = "single",
					},
				},
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				formatting = {
					format = function(entry, vim_item)
						vim_item.kind = kind_icons[vim_item.kind] or vim_item.kind
						return vim_item
					end,
				},
				mapping = {
					-- Toggle cmp menu
					["<C-space>"] = cmp.mapping(function()
						if cmp.visible() then cmp.abort() else cmp.complete() end
					end, { "i", "s", "c" }),

					["<C-e>"] = cmp.mapping(cmp.mapping.confirm { select = true }, { "i", "s", "c" }),

					["<C-j>"] = cmp.mapping(
						cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
						{ "i", "s", "c" }
					),
					["<C-k>"] = cmp.mapping(
						cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
						{ "i", "s", "c" }
					),

					["<C-A-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "s" }),
					["<C-A-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "s" }),

					["<C-n>"] = cmp.mapping(function()
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						 else
							vim.print("No further snippet tags")
						end
					end, { "i", "s" }),
					["<C-p>"] = cmp.mapping(function()
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							vim.print("No previous snippet tags")
						end
					end, { "i", "s" }),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, { -- Use buffer completion if there are no lsp or snippet results
					{ name = "buffer" },
				}),
				experimental = {
					ghost_text = true,
				},
			}

			-- Filetype setup
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "git" },
				}, {
					{ name = "buffer" },
				}),
			})

			-- Cmdline setup
			cmp.setup.cmdline({ "/", "?" }, {
				sources = {
					{ name = "buffer" },
				},
			})
			cmp.setup.cmdline(":", {
				sources = cmp.config.sources({
					{ name = "cmdline" },
				}, {
					{ name = "path" },
				}),
			})

			vim.opt.pumheight = 15
			vim.keymap.set({"n", "i", "v"}, "<C-A-space>", function()
				vim.g.autocomplete_enabled = not vim.g.autocomplete_enabled
				cmp.setup({ enabled = vim.g.autocomplete_enabled })
			end, { desc = "Toggle CMP autocompletion" })
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		config = true,
	},
}
