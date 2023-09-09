local opts = {
	number = true,
	relativenumber = true,
	cursorline = true,
	ruler = false,
	incsearch = true,
	hlsearch = false,
	wrap = false,
	cindent = true,
	splitright = true,
	splitbelow = true,

	tabstop = 4,
	shiftwidth = 4,
	laststatus = 2,
	showtabline = 1,
	scrolloff = 4,
	sidescrolloff = 4,
	sidescroll = 12,

	whichwrap = "",
	mouse = "",

	listchars = {
		eol = "󰌑",
		tab = "|  ",
		trail = "~",
		nbsp = "+",
		extends = ">",
		precedes = "<",
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
