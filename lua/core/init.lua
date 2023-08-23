local load = require("utils.load")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

load.options(require("core.options"))
load.mappings(require("core.mappings"))

