-- Turn on DiffTool
vim.cmd("packadd! nvim.difftool")

-- Enable experimental UI feature.
require("vim._core.ui2").enable()

vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
  -- "https://github.com/romgrk/barbar.nvim",
  "https://github.com/akinsho/bufferline.nvim",
})

-- Lualine
require("lualine").setup({
  -- always_show_tabline = false,
  -- tabline = {
  --   lualine_c = { { "buffers", mode = 2 } },
  -- },
})

-- BarBar
-- require("barbar").setup({
--   auto_hide = 1,
--   icons = {
--     buffer_index = "superscript",
--   },
-- })
-- vim.keymap.set("n", "<leader>b", require("barbar.api").pick_buffer, { desc = "Barbar Magic Pick" })

-- Bufferline
require("bufferline").setup({
  options = {
    style_preset = require("bufferline").style_preset.no_italic,
    always_show_bufferline = false,
    diagnostics = "nvim_lsp",
    indicator = {
      style = "underline",
    },
  },
})
vim.keymap.set("n", "<leader>b", ":BufferLinePick<cr>", { desc = "BufferLine Pick" })


