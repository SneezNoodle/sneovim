local load = require("sneez.utils.load")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

load.options(require("sneez.core.options"))
load.mappings(require("sneez.core.mappings"))
load.autocmds(require("sneez.core.autocmds"))
