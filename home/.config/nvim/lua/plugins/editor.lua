vim.pack.add({
  -- Dependencies
  "https://github.com/nvim-lua/plenary.nvim", -- dependency for todo-comments
  "https://github.com/nvim-tree/nvim-web-devicons", -- dependency for barbar, fzf-lua, lualine

  -- Plugins
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/folke/trouble.nvim",
  "https://github.com/lewis6991/gitsigns.nvim", -- Also a dependency for barbar
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/romgrk/barbar.nvim",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/folke/which-key.nvim",
})

-- Trouble
require("trouble").setup({
  modes = {
    lsp = {
      win = { position = "right" },
    },
  }
})
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", {desc = "Diagnostics (Trouble)" })

-- Todo Comments
require("todo-comments").setup()

-- Lualine
require("lualine").setup({
  -- always_show_tabline = false,
  -- tabline = {
  --   lualine_c = { { "buffers", mode = 2 } },
  -- },
})

-- BarBar
require("barbar").setup({
  auto_hide = 1,
})

-- Snacks
require("snacks").setup({
  bigfile = { enabled = false },
  dashboard = { enabled = false },
  explorer = { enabled = true },
  indent = { enabled = true },
  input = { enabled = false },
  picker = { enabled = true },
  notifier = { enabled = false },
  quickfile = { enabled = false },
  scope = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  words = { enabled = false },
})
-- Snacks Explorer keymaps
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })

require("which-key").setup({
  preset = "helix",
})
