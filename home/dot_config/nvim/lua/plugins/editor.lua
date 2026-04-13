vim.pack.add({
  -- Dependencies
  "https://github.com/nvim-lua/plenary.nvim", -- dependency for todo-comments
  "https://github.com/nvim-tree/nvim-web-devicons", -- dependency for barbar, fzf-lua, lualine
  "https://github.com/nvim-mini/mini.nvim", -- dependency for something
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",

  -- Plugins
  "https://github.com/lewis6991/gitsigns.nvim", -- Also a dependency for barbar
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/romgrk/barbar.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/folke/which-key.nvim",
})

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
local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

telescope.setup({
	defaults = {
		-- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = vimgrep_arguments,
	},
	pickers = {
		find_files = {
			hidden = true,
			find_command = { "rg", "--files", "--color", "never", "-g", "!.git" },
		},
	},
})
require("telescope").load_extension("fzf")

function vim.find_files_from_project_git_root()
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end
  require("telescope.builtin").find_files(opts)
end

vim.keymap.set('n', '<leader><space>', require('telescope.builtin').find_files, { desc = "Telescope find files" })
vim.keymap.set('n', '<leader>fg', vim.find_files_from_project_git_root, { desc = "Telescope find git files" })
vim.keymap.set('n', '<leader>rg', require('telescope.builtin').live_grep, { desc = "Telescope live grep" })
vim.keymap.set('n', '<leader>xx', require('telescope.builtin').diagnostics, { desc = "Telescope diagnostics" })

require("which-key").setup({
  preset = "helix",
})
