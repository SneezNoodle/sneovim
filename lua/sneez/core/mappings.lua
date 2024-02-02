local mode_mappings = {
	n = {
		-- Saving/quitting
		["<Leader>w"] = { "<cmd>w<cr>", { desc = "Save" } },
		["<Leader>W"] = { "<cmd>wa<cr>", { desc = "Save all" } },
		["<Leader>q"] = { "<cmd>q<cr>", { desc = "Quit" } },
		["<Leader>Q"] = { "<cmd>qa<cr>", { desc = "Quit all" } },
		["<Leader><C-q>"] = { "<cmd>qa!<cr>", { desc = "Force quit all" } },

		-- Option toggles
		["<Leader>on"] = { "<cmd>set nu!<cr>", { desc = "Toggle line numbers" } },
		["<Leader>or"] = { "<cmd>set rnu!<cr>", { desc = "Toggle relative line numbers" } },
		["<Leader>ol"] = { "<cmd>set list!<cr>", { desc = "Toggle list (show hidden characters)" } },
		["<Leader>oh"] = { "<cmd>set hls!<cr>", { desc = "Toggle highlighting searches" } },

		-- Editing
		["<Leader>h"] = { "<cmd>nohl<cr>", { desc = "Stop highlighting searches temporarily" } },
		["<Leader><Tab>"] = { "<cmd>execute 's/^[\\t]*/'.repeat('\\t', v:count)<cr>", { desc = "Set indent level" } },

		-- Tabs
		["<A-]>"] = { "gt", { desc = "Next tab" } },
		["<A-[>"] = { "gT", { desc = "Previous tab" } },
		["<A-}>"] = { "<cmd>tabmove +1<cr>", { desc = "Move tab left" } },
		["<A-{>"] = { "<cmd>tabmove -1<cr>", { desc = "Move tab right" } },
		["<A-n>"] = { "<cmd>tabnew<cr>", { desc = "New tab" } },
		["<A-c>"] = { "<cmd>tabclose<cr>", { desc = "Close tab" } },

		-- Buffers
		["<Leader>bl"] = { "<cmd>ls<cr>", { desc = "List buffers" } },
		["<Leader>bL"] = { "<cmd>ls!<cr>", { desc = "List all buffers" } },
		["<Leader>bd"] = { "<cmd>exec 'bdel'.v:count>0?v:count:''<cr>", { desc = "Delete current buffer" } },
		["<Leader>bD"] = { "<cmd>exec 'bdel!'.v:count>0?v:count:''<cr>", { desc = "Force delete current buffer" } },

		-- View navigation
		["<C-h>"] = { "<C-w>h", { desc = "Switch window left" } },
		["<C-j>"] = { "<C-w>j", { desc = "Switch window down" } },
		["<C-k>"] = { "<C-w>k", { desc = "Switch window up" } },
		["<C-l>"] = { "<C-w>l", { desc = "Switch window right" } },

		["<A-h>"] = { "4zh", { desc = "Pan left" } },
		["<A-j>"] = { "2<C-e>", { desc = "Pan down" } },
		["<A-k>"] = { "2<C-y>", { desc = "Pan up" } },
		["<A-l>"] = { "4zl", { desc = "Pan right" } },

		["<A-=>"] = { "<C-W>+", { desc = "Grow horizontal split" } },
		["<A-->"] = { "<C-W>-", { desc = "Shrink horizontal split" } },
		["<A-.>"] = { "<C-W>>", { desc = "Grow vertical split" } },
		["<A-,>"] = { "<C-W><", { desc = "Shrink vertical split" } },
		["<A-0>"] = { "<C-W>=", { desc = "Evenly distribute screen space" } },

		-- Place shortcuts
		["<F1>"] = { "<cmd>exec 'tabnew | tcd ' . stdpath('config') . '/lua/sneez/ | edit .'<cr>", { desc = "Edit config" } },
		["<F2>"] = { "<cmd>exec 'tabnew | tcd ' . &backupdir . ' | edit .'<cr>", { desc = "Edit backups" } },
		["<F3>"] = { "<cmd>exec 'tabnew | tcd ' . &viewdir . ' | edit .'<cr>", { desc = "Edit views" } },
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

		["<A-t>"] = { function()
			local cur = vim.fn.getcurpos() or { 0, 1, 1 }
			local tag = vim.fn.input("Tag: ")
			vim.api.nvim_buf_set_text(0, cur[2]-1, cur[3]-1, cur[2]-1, cur[3]-1, { "<"..tag..">".."</"..tag..">" })
			vim.fn.cursor(cur[2], cur[3]+#tag+2) -- Move between tags
		end, { desc = "Insert markup tags" } },
		["<A-T>"] = { function()
			local cur = vim.fn.getcurpos() or { 0, 1, 1 }
			local tag = vim.fn.input("Tag: ")
			vim.api.nvim_buf_set_text(0, cur[2]-1, cur[3]-1, cur[2]-1, cur[3]-1, { "<"..tag..">", "</"..tag..">" })
			vim.cmd("normal! O")
		end, { desc = "Insert markup tags" } },
	},
	v = {
		["<Leader><Tab>"] = { "<cmd>execute '\'<,\'>s/^[\\t]*/'.repeat('\\t', v:count)<cr>", { desc = "Set indent level" } },
	},
	c = {
		["<A-h>"] = { "<left>", { desc = "Move left" } },
		["<A-l>"] = { "<right>", { desc = "Move right" } },
		["<A-k>"] = { "<up>", { desc = "Previous command in history" } },
		["<A-j>"] = { "<down>", { desc = "Next command in history" } },

		["<A-S-h>"] = { "<S-left>", { desc = "One word left" } },
		["<A-S-l>"] = { "<S-right>", { desc = "One word right" } },
	},
}

return {
	load = function()
		for mode, maps in pairs(mode_mappings) do
			for key, mapping in pairs(maps) do
				-- Add each char in modes to a table for vim.keymap.set()
				local modes = {}
				for i = 1, #mode do table.insert(modes, string.sub(mode, i, i)) end

				vim.keymap.set(modes, key, mapping[1], mapping[2] or {})
			end
		end
	end
}
