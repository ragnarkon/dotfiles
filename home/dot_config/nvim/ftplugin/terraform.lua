-- Treesitter for syntax highlighting
require("nvim-treesitter").install({ "terraform", "hcl" })
vim.treesitter.start()

-- Language server
require("mason-lspconfig").setup({ ensure_installed = { "terraformls", "tflint" } })
vim.lsp.enable("terraformls")

require("helm-ls").setup()
