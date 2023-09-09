return function()
	vim.cmd([[
	augroup Sneez
	au!
	" Highlight yanked text
	au TextYankPost * silent! lua vim.highlight.on_yank { higroup = "Search" }
	" Run foldexpr upon leaving insert mode (why is this not the default)
	au InsertLeave * normal zx
	augroup END
	]])
end
