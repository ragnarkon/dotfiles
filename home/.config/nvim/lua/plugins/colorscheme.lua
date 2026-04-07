vim.pack.add({
  "https://github.com/navarasu/onedark.nvim"
})

require("onedark").setup {
  style = "dark",
  term_colors = true,
}
require("onedark").load()
