return function()
	vim.cmd([[
	augroup Sneez
	au!
	" Highlight yanked text
	au TextYankPost * silent! lua vim.highlight.on_yank { higroup = "Search" }
	augroup END
	]])
end
