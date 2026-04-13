vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
})

-- Conform
require("conform").setup({
  format_on_save = {
    timeout_ms = 3000,
    lsp_fallback = "fallback",
  },
  formatters_by_ft = {
    terraform = { "terraform_fmt" },
    ["_"] = { "trim_whitespace" },
  },
})
