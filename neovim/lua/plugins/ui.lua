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
	  "j-hui/fidget.nvim",
	  lazy = true,
	  event = "LspAttach",
	  config = function()
		require("plugins.ui.fidget").setup()
	  end,
	},
	{
	  "HiPhish/rainbow-delimiters.nvim",
	  lazy = true,
	  config = function()
		require("plugins.ui.rainbow-delimiters").setup()
	  end,
	},
	{
	  "lukas-reineke/indent-blankline.nvim",
	  lazy = true,
	  event = { "CursorHold", "CursorHoldI" },
	  config = function()
		require("plugins.ui.indent-blankline").setup()
	  end,
	  dependencies = { "HiPhish/rainbow-delimiters.nvim" },
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
	  "folke/todo-comments.nvim",
	  lazy = true,
	  event = { "CursorHold", "CursorHoldI" },
	  config = function()
		require("plugins.ui.todo-comments").setup()
	  end,
	  dependencies = { "nvim-lua/plenary.nvim" },
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