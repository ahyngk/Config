return {
	{
	  "goolord/alpha-nvim",
	  lazy = true,
	  event = "BufWinEnter",
	  config = function()
		require("plugins.ui.alpha").setup()
	  end,
	},
	{
	  "akinsho/bufferline.nvim",
	  lazy = true,
	  event = "VimEnter",
	  config = function()
		require("plugins.ui.bufferline").setup()
	  end,
	  dependencies = "nvim-tree/nvim-web-devicons"
	},
	{
		"ojroques/nvim-bufdel",
		lazy = true,
		cmd = { "BufDel", "BufDelAll", "BufDelOthers" },
		init = function()
		  vim.g.bufdel_no_plugin_maps = true
		end,
	},
	{
	  "j-hui/fidget.nvim",
	  lazy = true,
	  event = "LspAttach",
	  config = function()
		require("plugins.ui.fidget").setup()
	  end,
	},
	{
	  "nvim-lualine/lualine.nvim",
	  lazy = true,
	  event = { "BufReadPost", "BufAdd", "BufNewFile" },
	  config = function()
		require("plugins.ui.lualine").setup()
	  end,
	},
	{
	  "karb94/neoscroll.nvim",
	  lazy = true,
	  event = { "CursorHold", "CursorHoldI" },
	  config = function()
		require("plugins.ui.neoscroll").setup()
	  end,
	},
	{
	  "folke/paint.nvim",
	  lazy = true,
	  event = { "CursorHold", "CursorHoldI" },
	  config = function()
		require("plugins.ui.paint").setup()
	  end,
	},
	{
	  "mrjones2014/smart-splits.nvim",
	  lazy = true,
	  event = { "CursorHoldI", "CursorHold" },
	  config = function()
		require("plugins.ui.smart-splits").setup()
	  end,
	},
	{
	  "dstein64/nvim-scrollview",
	  lazy = true,
	  event = { "BufReadPost", "BufAdd", "BufNewFile" },
	  config = function()
		require("plugins.ui.scrollview").setup()
	  end,
	},
	{
	  "folke/edgy.nvim",
	  event = "VeryLazy",
	  config = function()
		require("plugins.ui.edgy").setup()
	  end,
	},
  }