local opts = {
	number = true,
	relativenumber = true,
	cursorline = true,
	ruler = false,
	incsearch = true,
	hlsearch = false,
	laststatus = 2,
	showtabline = 1, -- Currently set by lualine

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

	foldenable = true,
	foldmethod = "manual",
	foldclose = "all",
	foldlevelstart = 0,
	foldcolumn = "auto:9",
	-- Start line with indent preserved and arrow
	foldtext = "repeat(' ', indent(v:foldstart)) . trim(getline(v:foldstart)) . '... 󰦸'",

	fillchars = {
		fold = " ",
		foldopen = "",
		foldclose = "",
		eob = " ",
	},
	listchars = {
		eol = " ",
		tab = "│  ",
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

	completeopt = { "menu", "noinsert" },

	virtualedit = { "block" },
}

return function()
	for opt, value in pairs(opts) do
		vim.opt[opt] = value
	end
end
