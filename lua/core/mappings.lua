return {
	n = {
		-- Saving/quitting
		["<Leader>s"] = { "<cmd>w<cr>", { desc = "Save" } },
		["<Leader>S"] = { "<cmd>wa<cr>", { desc = "Save all" } },
		["<Leader>q"] = { "<cmd>q<cr>", { desc = "Quit" } },
		["<Leader>Q"] = { "<cmd>qa<cr>", { desc = "Quit all" } },
		["<Leader><C-q>"] = { "<cmd>qa!<cr>", { desc = "Force quit all" } },

		-- Option toggles
		["<Leader>or"] = { "<cmd>set rnu!<cr>", { desc = "Toggle relative numbers", silent = true } },
		["<Leader>ol"] = { "<cmd>set list!<cr>", { desc = "Toggle list", silent = true } },
		["<Leader>oh"] = { "<cmd>set hls!<cr>", { desc = "Toggle highlighting searches", silent = true } },

		["<Escape>"] = { "<cmd>nohl<cr>", { desc = "Toggle list", silent = true } },

		-- Tabs
		["<Tab>"] = { "gt", { desc = "Next tab" } },
		["<S-Tab>"] = { "gT", { desc = "Previous tab" } },
		["<Leader>tn"] = { "<cmd>tabnew<cr>", { desc = "New tab" } },
		["<Leader>tc"] = { "<cmd>tabclose<cr>", { desc = "Close tab" } },
		["<Leader>tL"] = { "<cmd>+tabmove<cr>", { desc = "Move tab right" }, },
		["<Leader>tH"] = { "<cmd>-tabmove<cr>", { desc = "Move tab left" }, },

		-- Buffers
		["<Leader>bl"] = { "<cmd>ls<cr>", { desc = "List buffers" } },
		["<Leader>bL"] = { "<cmd>ls!<cr>", { desc = "List all buffers" } },
		["<Leader>ba"] = { "<C-^>", { desc = "Alternate buffer" } },
		["<Leader>bd"] = { "<cmd>bdel<cr>", { desc = "Delete current buffer" } },
		["<Leader>bD"] = { "<cmd>bdel!<cr>", { desc = "Force delete current buffer" } },

		-- View navigation
		["<A-w>"] = { "<C-w>", { desc = "Easier to press with my laptop keyboard" } },

		["<C-d>"] = { "<C-d>M", { desc = "Centre cursor after jumping down" } },
		["<C-u>"] = { "<C-u>M", { desc = "Centre cursor after jumping up" } },

		["<C-h>"] = { "<C-w>h", { desc = "Switch window left" } },
		["<C-j>"] = { "<C-w>j", { desc = "Switch window down" } },
		["<C-k>"] = { "<C-w>k", { desc = "Switch window up" } },
		["<C-l>"] = { "<C-w>l", { desc = "Switch window right" } },

		["<A-h>"] = { "zh", { desc = "Pan left" } },
		["<A-j>"] = { "<C-e>", { desc = "Pan down" } },
		["<A-k>"] = { "<C-y>", { desc = "Pan up" } },
		["<A-l>"] = { "zl", { desc = "Pan right" } },

		["<C-=>"] = { "<C-W>+", { desc = "Grow horizontal split" } },
		["<C-->"] = { "<C-W>-", { desc = "Shrink horizontal split" } },
		["<C-.>"] = { "<C-W>>", { desc = "Grow vertical split" } },
		["<C-,>"] = { "<C-W><", { desc = "Shrink vertical split" } },

		-- Config shortcut
		["<F1>"] = { "<cmd>tabnew | edit ~/.config/nvim/lua/<cr>", { desc = "Edit config" }, },
	},
	i = {
		["<C-l>"] = { "<del>", { desc = "Delete (like <C-h>)" } },

		-- Use Alt+hjkl instead of arrow keys
		["<A-h>"] = { "<left>", { desc = "Move left" } },
		["<A-j>"] = { "<down>", { desc = "Move down" } },
		["<A-k>"] = { "<up>", { desc = "Move up" } },
		["<A-l>"] = { "<right>", { desc = "Move right" } },
	},
	c = {
		["<A-h>"] = { "<left>", { desc = "Move left" } },
		["<A-l>"] = { "<right>", { desc = "Move right" } },
	},
	t = {
		["<Esc>"] = { "<C-\\><C-n>", { desc = "Esc to exit terminal (like all other modes)" } },
	},
}

