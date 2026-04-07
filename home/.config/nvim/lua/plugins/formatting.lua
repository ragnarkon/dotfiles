vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/mfussenegger/nvim-lint",
})

-- Conform
require("conform").setup({
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = "fallback",
  },
})

-- Lint
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
