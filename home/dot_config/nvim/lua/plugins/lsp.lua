vim.pack.add({
  -- Dependencies
  "https://github.com/mason-org/mason-lspconfig.nvim", -- dependency for mason.nvim
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", -- dependency for nvim-treesitter

  -- Plugins
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
})

-- Treesitter
-- FIXME: This is wrong, but we're gonna roll with it for now because nvim-treesitter is archived anyway.
require("nvim-treesitter").setup()
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "lua_ls",
  },
})

-- LSP Server overrides
vim.lsp.config("bashls", { filetypes = { "sh", "bash", "zsh" } }) -- Tell bashls to check zsh
vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
  severity_sort = true,
})
