-- Turn on DiffTool
vim.cmd('packadd! nvim.difftool')

-- Enable experimental UI feature.
require('vim._core.ui2').enable()


require("plugins.ai")
require("plugins.colorscheme")
require("plugins.editor")
require("plugins.formatting")
require("plugins.lsp")
