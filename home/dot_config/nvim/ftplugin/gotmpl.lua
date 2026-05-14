-- Treesitter for syntax highlighting
require("nvim-treesitter").install({ "gotmpl" })

-- Start treesitter
vim.treesitter.start()

-- Set injection query
vim.treesitter.query.set(
  "gotmpl",
  "injections",
  [[
    ; extends
    ((text) @injection.content
      (#inject-go-tmpl!)
      (#set! injection.combined))
  ]]
)
