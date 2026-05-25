vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/mfussenegger/nvim-lint",
})

-- Conform
require("conform").setup({
  format_on_save = { timeout_ms = 3000, lsp_fallback = "fallback" },
  formatters_by_ft = {
    lua = { "stylua" },
    markdown = { "prettierd", "prettier", stop_after_first = true },
    terraform = { "terraform_fmt", "tofu_fmt", stop_after_first = true },
    yaml = { "prettierd", "prettier", stop_after_first = true },
    ["_"] = { "trim_whitespace" },
  },
})

vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"

-- Nvim-lint
require("lint").linters_by_ft = {
  terraform = { "tflint", "terraform_validate" },
  tombi = { "tombi" },
  zsh = { "zsh" },
}

-- Nvim-lint
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require("lint").try_lint()

    -- You can call `try_lint` with a linter name or a list of names to always
    -- run specific linters, independent of the `linters_by_ft` configuration
    -- require("lint").try_lint("cspell")
  end,
})
