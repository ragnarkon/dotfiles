vim.pack.add({
  -- Dependencies
  "https://github.com/nvim-lua/plenary.nvim", -- dependency for todo-comments
  "https://github.com/nvim-tree/nvim-web-devicons", -- dependency for bufferline, fzf-lua, lualine
  "https://github.com/nvim-mini/mini.nvim", -- dependency for something
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",

  -- Plugins
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/lewis6991/gitsigns.nvim", -- Also a dependency for barbar
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/folke/todo-comments.nvim",
  "https://github.com/folke/trouble.nvim",
  "https://github.com/folke/which-key.nvim",
})

-- Oil
require("oil").setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Snacks
require("snacks").setup({
  indent = { enabled = true },
  statuscolumn = { enabled = true },
})

require("gitsigns").setup({
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" },
  },
  signs_staged = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
  },
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
    layout_strategy = "flex",
    layout_config = { width = 0.95 },
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

vim.keymap.set("n", "<leader><space>", require("telescope.builtin").find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", vim.find_files_from_project_git_root, { desc = "Telescope find git files" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>rg", require("telescope.builtin").live_grep, { desc = "Telescope live grep" })

-- Telescope fzf native
-- FIXME: This doesn't seem to work for whatever reason
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
      vim.system({ "make" }, { cwd = ev.data.path }):wait()
    end
  end,
})

-- Todo Comments
require("todo-comments").setup()

-- Trouble
require("trouble").setup({
  modes = {
    lsp = {
      win = { position = "right" },
    },
  },
})
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble diagnostics" })
vim.keymap.set(
  "n",
  "<leader>xX",
  "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  { desc = "Trouble diagnostics (Curr Buffer)" }
)

-- which-key
require("which-key").setup({
  preset = "helix",
})
vim.keymap.set("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
