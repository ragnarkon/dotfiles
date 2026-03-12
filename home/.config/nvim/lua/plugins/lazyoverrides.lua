return {

	-- Hide LazyVim launch screen
	{
		"snacks.nvim",
		opts = {
			dashboard = { enabled = false },
			picker = {
				hidden = true,
				sources = {
					files = {
						hidden = true, -- Show hidden/dotfiles
					},
				},
			},
		},
	},

	-- Classic command bar
	{
		"noice.nvim",
		opts = {
			cmdline = {
				enabled = false,
			},
			messages = {
				enabled = false,
			},
		},
	},

	{
		"blink.cmp",
		opts = {
			keymap = { preset = "super-tab" },
		},
	},
}
