local opts = {
	number = true,
	relativenumber = true,
	cursorline = true,
	ruler = false,
	incsearch = true,
	hlsearch = false,
	laststatus = 2,
	-- showtabline = 1, -- Currently set by lualine
	showmode = false,

	tabstop = 4,
	shiftwidth = 4,
	cindent = true,

	splitright = true,
	splitbelow = true,

	wrap = false,
	whichwrap = "",
	scrolloff = 4,
	sidescrolloff = 4,
	sidescroll = 12,

	mouse = "",

	backup = true,
	writebackup = true,
	backupdir = vim.fn.stdpath("state") .. "/backups//",

	foldenable = true,
	foldmethod = "manual",
	foldclose = "all",
	foldlevelstart = 0,
	foldcolumn = "auto:9",
	-- Start line with indent preserved and arrow
	foldtext = "repeat(' ', indent(v:foldstart)) . trim(getline(v:foldstart)) . ' 󰦸'",

	fillchars = {
		fold = " ",
		foldopen = "",
		foldclose = "",
		eob = " ",
	},
	listchars = {
		eol = "󰌑",
		tab = "│--",
		multispace = "│···",
		trail = "·",
		nbsp = "-",
		extends = "",
		precedes = "",
	},

	sessionoptions = {
		"blank",
		"buffers",
		"curdir",
		"folds",
		"help",
		"localoptions",
		"options",
		"tabpages",
		"terminal",
		"winsize",
	},
	viewoptions = {
		"folds",
		"cursor",
		"curdir",
	},

	completeopt = { "menu", "noinsert" },

	virtualedit = { },
}

return {
	load = function()
		for opt, value in pairs(opts) do
			vim.opt[opt] = value
		end
	end,
}
