return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        cmd = "Telescope",
        config = function()
            require("plugins.tool.telescope").setup()
        end,
        dependencies = {
          "jvgrootveld/telescope-zoxide",
          "debugloop/telescope-undo.nvim",
          "nvim-telescope/telescope-frecency.nvim",
          "nvim-telescope/telescope-live-grep-args.nvim",
          { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
      },
	{
	  "tpope/vim-fugitive",
	  lazy = true,
	  cmd = { "Git", "G" },
	},
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        config = function()
            require("plugins.tool.gitsigns").setup()
        end,
    },
	{
	  "Bekaboo/dropbar.nvim",
	  lazy = false,
	  config = function()
        require("plugins.tool.dropbar").setup()
	  end,
	  dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-fzf-native.nvim",
	  },
	},
	{
	  "nvim-tree/nvim-tree.lua",
	  lazy = true,
	  cmd = {
		"NvimTreeToggle",
		"NvimTreeOpen",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeRefresh",
	  },
	  config = function()
		require("plugins.tool.nvim-tree").setup()
	  end,
	},
	{
	  "ibhagwan/smartyank.nvim",
	  lazy = true,
	  event = "BufReadPost",
	  config = function()
		require("plugins.tool.smartyank").setup()
	  end,
	},
	{
	  "akinsho/toggleterm.nvim",
	  lazy = true,
	  cmd = {
		"ToggleTerm",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
		"ToggleTermSendVisualLines",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualSelection",
	  },
	  config = function()
		require("plugins.tool.toggleterm").setup()
	  end,
	},
	{
	  "folke/trouble.nvim",
	  lazy = true,
	  cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
	  config = function()
		require("plugins.tool.trouble").setup()
	  end,
	},
	{
	  "folke/which-key.nvim",
	  lazy = true,
	  event = { "CursorHold", "CursorHoldI" },
	  config = function()
		require("plugins.tool.which-key").setup()
	  end,
	},
	{
	  "gelguy/wilder.nvim",
	  lazy = true,
	  event = "CmdlineEnter",
	  config = function()
		require("plugins.tool.wilder").setup()
	  end,
	  dependencies = { "romgrk/fzy-lua-native" },
	},
    {
        "sindrets/diffview.nvim",
        lazy = true,
        cmd = { "DiffviewOpen", "DiffviewClose" },
        config = function()
            require("plugins.tool.diffview").setup()
        end,
    },
  }