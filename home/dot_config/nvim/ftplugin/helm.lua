-- Treesitter for syntax highlighting
require("nvim-treesitter").install({ "helm", "yaml" })
vim.treesitter.start()

-- Language server
require("mason-lspconfig").setup({ ensure_installed = { "helm_ls" } })
vim.lsp.enable("helm_ls")

require("helm-ls").setup()
