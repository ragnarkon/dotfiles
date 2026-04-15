vim.pack.add({"https://github.comqvalentin/helm-ls.nvim"})

require("helm-ls").setup()
require('nvim-treesitter').install({ "helm" })
