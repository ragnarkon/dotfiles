-- Treesitter for syntax highlighting
require("nvim-treesitter").install({ "markdown", "html", "yaml" })
vim.treesitter.start()

require("render-markdown").setup({
  completions = { lsp = { enabled = true } },
  latex = { enabled = false },
})
