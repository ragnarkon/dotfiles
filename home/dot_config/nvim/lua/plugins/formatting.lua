vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/mfussenegger/nvim-lint",
})

-- Conform
require("conform").setup({
  format_on_save = {
    timeout_ms = 3000,
    lsp_fallback = "fallback",
  },
  formatters_by_ft = {
    terraform = { "terraform_fmt" },
    yaml = { "prettierd", "prettier", stop_after_first = true },
    ["_"] = { "trim_whitespace" },
  },
})

-- Nvim-lint
require("lint").linters_by_ft = {}
