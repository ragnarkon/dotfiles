vim.pack.add({
  -- Dependencies
  "https://github.com/nvim-lua/plenary.nvim", -- dependency for todo-comments
  "https://github.com/nvim-tree/nvim-web-devicons", -- dependency for barbar, fzf-lua, lualine
  "https://github.com/nvim-mini/mini.nvim", -- dependency for something
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",

  -- Plugins
  "https://github.com/folke/trouble.nvim",
  "https://github.com/lewis6991/gitsigns.nvim", -- Also a dependency for barbar
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/romgrk/barbar.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
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

-- Telescope
require("telescope").setup()
require("telescope").load_extension("fzf")
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').find_files, { desc = "Telescope find files" })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files, { desc = "Telescope find git files" })
vim.keymap.set('n', '<leader>rg', require('telescope.builtin').live_grep, { desc = "Telescope live grep" })

require("which-key").setup({
  preset = "helix",
})
