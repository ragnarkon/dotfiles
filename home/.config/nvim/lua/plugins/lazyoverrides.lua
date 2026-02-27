return {

	-- Hide LazyVim launch screen
	{
		"snacks.nvim",
		opts = {
			dashboard = { enabled = false },
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
}
