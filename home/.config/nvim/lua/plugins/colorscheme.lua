vim.pack.add({
  "https://github.com/navarasu/onedark.nvim",
})

require("onedark").setup {
  style = "dark",
  term_colors = true,
}
require("onedark").load()

-- require("catppuccin").setup({
--   flavour = "mocha",
--   term_colors = true,
-- })
--
-- vim.cmd.colorscheme("catppuccin-nvim")
