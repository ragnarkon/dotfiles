return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diag)
          local icons = LazyVim.config.icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- optional but recommended
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          build = (build_cmd ~= "cmake") and "make"
            or "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
          enabled = build_cmd ~= nil,
        },
    },
    keys = {
      { "<leader>-", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    },
  },
}
