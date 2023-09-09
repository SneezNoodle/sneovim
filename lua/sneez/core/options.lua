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
	foldlevelstart = 99,
	foldcolumn = "auto:3",
	foldmethod = "expr",
	-- Same as indent but include lines about and below
	foldexpr = "indent(v:lnum+1) > indent(v:lnum) ? '>' . (indent(v:lnum+1)/&tabstop) : (indent(v:lnum-1) > indent(v:lnum) ? '<' . (indent(v:lnum-1)/&tabstop) : (indent(v:lnum)/&tabstop))",
	-- Start line ... end line with indent preserved
	foldtext = "repeat(' ', indent(v:foldstart)) . trim(getline(v:foldstart)) . ' ... ' . trim(getline(v:foldend))",

	fillchars = {
		fold = " ",
		foldopen = "",
		foldclose = "",
		eob = " ",
	},
	listchars = {
		eol = "󰌑",
		tab = "│  ",
		trail = "·",
		nbsp = "-",
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
