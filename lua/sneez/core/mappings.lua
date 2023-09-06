return {
	n = {
		-- Saving/quitting
		["<Leader>s"] = { "<cmd>w<cr>", { desc = "Save" } },
		["<Leader>S"] = { "<cmd>wa<cr>", { desc = "Save all" } },
		["<Leader>q"] = { "<cmd>q<cr>", { desc = "Quit" } },
		["<Leader>Q"] = { "<cmd>qa<cr>", { desc = "Quit all" } },
		["<Leader><C-q>"] = { "<cmd>qa!<cr>", { desc = "Force quit all" } },

		-- Option toggles
		["<Leader>on"] = { "<cmd>set nu!<cr>", { desc = "Toggle line numbers" } },
		["<Leader>or"] = { "<cmd>set rnu!<cr>", { desc = "Toggle relative line numbers" } },
		["<Leader>ol"] = { "<cmd>set list!<cr>", { desc = "Toggle list (show hidden characters)" } },
		["<Leader>oh"] = { "<cmd>set hls!<cr>", { desc = "Toggle highlighting searches" } },

		["<Leader>H"] = { "<cmd>nohl<cr>", { desc = "Stop highlighting searches temporarily" } },

		-- Tabs
		["<Tab>"] = { "gt", { desc = "Next tab" } },
		["<S-Tab>"] = { "gT", { desc = "Previous tab" } },
		["<Leader>tn"] = { "<cmd>tabnew<cr>", { desc = "New tab" } },
		["<Leader>tc"] = { "<cmd>tabclose<cr>", { desc = "Close tab" } },

		-- Buffers
		["<Leader>bl"] = { "<cmd>ls<cr>", { desc = "List buffers" } },
		["<Leader>bL"] = { "<cmd>ls!<cr>", { desc = "List all buffers" } },
		["<Leader>ba"] = { "<C-^>", { desc = "Alternate buffer" } },
		["<Leader>bd"] = { "<cmd>bdel<cr>", { desc = "Delete current buffer" } },
		["<Leader>bD"] = { "<cmd>bdel!<cr>", { desc = "Force delete current buffer" } },

		-- View navigation
		["<A-w>"] = { "<C-w>", { desc = "Easier to press with my laptop keyboard" } },

		["<C-d>"] = { "<C-d>zz", { desc = "Centre view after jumping down" } },
		["<C-u>"] = { "<C-u>zz", { desc = "Centre view after jumping up" } },

		["<C-h>"] = { "<C-w>h", { desc = "Switch window left" } },
		["<C-j>"] = { "<C-w>j", { desc = "Switch window down" } },
		["<C-k>"] = { "<C-w>k", { desc = "Switch window up" } },
		["<C-l>"] = { "<C-w>l", { desc = "Switch window right" } },

		["<A-h>"] = { "4zh", { desc = "Pan left" } },
		["<A-j>"] = { "2<C-e>", { desc = "Pan down" } },
		["<A-k>"] = { "2<C-y>", { desc = "Pan up" } },
		["<A-l>"] = { "4zl", { desc = "Pan right" } },

		["<C-=>"] = { "<C-W>+", { desc = "Grow horizontal split" } },
		["<C-->"] = { "<C-W>-", { desc = "Shrink horizontal split" } },
		["<C-.>"] = { "<C-W>>", { desc = "Grow vertical split" } },
		["<C-,>"] = { "<C-W><", { desc = "Shrink vertical split" } },

		-- Config shortcut
		["<F1>"] = { "<cmd>tabnew | edit ~/.config/nvim/lua/<cr>", { desc = "Edit config" } },
	},
	i = {
		["<C-l>"] = { "<del>", { desc = "Delete (like <C-h>)" } },

		-- Use Alt+hjkl instead of arrow keys
		["<A-h>"] = { "<left>", { desc = "Move left" } },
		["<A-j>"] = { "<down>", { desc = "Move down" } },
		["<A-k>"] = { "<up>", { desc = "Move up" } },
		["<A-l>"] = { "<right>", { desc = "Move right" } },

		["<A-S-h>"] = { "<S-left>", { desc = "One word left" } },
		["<A-S-l>"] = { "<S-right>", { desc = "One word right" } },
	},
	c = {
		["<A-h>"] = { "<left>", { desc = "Move left" } },
		["<A-l>"] = { "<right>", { desc = "Move right" } },

		["<A-S-h>"] = { "<S-left>", { desc = "One word left" } },
		["<A-S-l>"] = { "<S-right>", { desc = "One word right" } },
	},
}
