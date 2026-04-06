vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim", -- dependency for todo-comments
  "https://github.com/folke/todo-comments.nvim",
  
  "https://github.com/nvim-tree/nvim-web-devicons", -- dependency for lualine & fzf-lua
  "https://github.com/nvim-lualine/lualine.nvim",

  "https://github.com/ibhagwan/fzf-lua",

  "https://github.com/lewis6991/gitsigns.nvim",

  "https://github.com/folke/trouble.nvim",

  "https://github.com/folke/snacks.nvim",

  "https://github.com/folke/which-key.nvim",
})

-- Todo Comments
require("todo-comments").setup()

-- Lualine
require("lualine").setup({
  always_show_tabline = false,
  tabline = {
    lualine_c = { { "buffers", mode = 2 } },
  },
})

-- Snacks
require("snacks").setup({
  explorer = { enabled = true },
  indent = { enabled = true },
  statuscolumn = { enabled = false },
})
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })

require("which-key").setup({
  preset = "helix",
})
