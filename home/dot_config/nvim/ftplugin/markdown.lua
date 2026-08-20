-- Treesitter for syntax highlighting
require("nvim-treesitter").install({ "markdown" })
vim.treesitter.start()

require("markdown-plus").setup()
