return {
	{
		"ludovicchabant/vim-gutentags",
		config = function()
			require("configs.editor.ctags")()
		end
	},
	{
		"dhananjaylatkar/cscope_maps.nvim",
		lazy = true,
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		dependencies = {
			"folke/which-key.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("configs.editor.cscope")()
		end,
	},
}