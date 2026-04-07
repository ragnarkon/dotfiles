vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason-lspconfig.nvim", -- dependency for mason.nvim
  "https://github.com/mason-org/mason.nvim",

  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", -- dependency for nvim-treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "lua_ls",
  },
})

-- LSP Server overrides
vim.lsp.config("bashls", { filetypes = { "sh", "bash", "zsh" } }) -- Tell bashls to check zsh
