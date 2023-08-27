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

			local kind_icons = {
				Text = "󰉿 ",
				Snippet = " ",
				Keyword = " ",
				Variable = " ",
				Field = " ",
				Function = "󰡱 ",
				Method = " ",
				Enum = " ",
				Class = " ",
				Struct = " ",
				Interface = " ",
				Module = "󰘦 ",
			}

			-- Main setup
			cmp.setup {
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
					["<C-Enter>"] = cmp.mapping(cmp.mapping.complete(), { "i", "s", "c" }),

					["<C-h>"] = cmp.mapping(cmp.mapping.abort(), { "i", "s", "c" }),
					["<C-l>"] = cmp.mapping(cmp.mapping.confirm { select = true }, { "i", "s", "c" }),

					["<C-j>"] = cmp.mapping(
						cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
						{ "i", "s", "c" }
					),
					["<C-k>"] = cmp.mapping(
						cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
						{ "i", "s", "c" }
					),

					["<A-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "s" }),
					["<A-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "s" }),

					["<A-l>"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<A-h>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
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

			-- LSPConfig setup is in its own config file
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		confit = true,
	},
}
