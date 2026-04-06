vim.pack.add({
  "https://github.com/mason-org/mason-lspconfig.nvim", -- dependency for mason.nvim
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",

  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", -- dependency for nvim-treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

require("nvim-treesitter").setup({
  -- TODO: This may not actually do anything these days
  ensure_installed = {
    "bash",
    "c",
    "dockerfile",
    "git_config",
    "git_rebase",
    "go",
    "gomod",
    "gosum",
    "json",
    "lua",
    "markdown",
    "python",
    "vim",
    "yaml",
    "zsh",
  },

  auto_install = true,

  intent = {
    enable = true,
  },
})
