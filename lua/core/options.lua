return {
	number = true,
	relativenumber = true,
	cursorline = true,
	ruler = false,

	incsearch = true,
	hlsearch = true,

	scrolloff = 4,
	sidescrolloff = 8,
	sidescroll = 12,
	wrap = false,

	listchars = {
		eol = "󰌑",
		tab = "|  ",
		trail = "~",
		nbsp = "+",
		extends = ">",
		precedes = "<",
	},

	tabstop = 4,
	shiftwidth = 4,
	cindent = true,

	mouse = "",

	splitright = true,
	splitbelow = true,

	laststatus = 2,
	showtabline = 1,

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
	whichwrap = "",
}
