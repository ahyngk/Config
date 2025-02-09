return {
	{
        "HiPhish/rainbow-delimiters.nvim",
        lazy = true,
        config = function()
            require("plugins.editor.rainbow-delimiters").setup()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        config = function()
            require("plugins.editor.indent-blankline").setup()
        end,
        dependencies = { "HiPhish/rainbow-delimiters.nvim" },
    },
    {
        "folke/todo-comments.nvim",
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        config = function()
          require("plugins.editor.todo-comments").setup()
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "m4xshen/autoclose.nvim",
        lazy = true,
        event = "InsertEnter",
        config = function()
          require("plugins.editor.autoclose").setup()
        end,
    },
	{
        "tzachar/local-highlight.nvim",
        lazy = true,
        event = { "BufReadPost", "BufAdd", "BufNewFile" },
        config = function()
            require("plugins.editor.local-highlight").setup()
        end,
    },
    {
        "brenoprata10/nvim-highlight-colors",
        lazy = true,
        event = { "CursorHold", "CursorHoldI" },
        config = function()
            require("plugins.editor.nvim-highlight-colors").setup()
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("plugins.editor.treesitter").setup()
            vim.cmd([[
                TSBufEnable highlight
                autocmd BufEnter * TSBufEnable highlight
            ]])
        end,
        dependencies = {
            "andymass/vim-matchup",
            "mfussenegger/nvim-treehopper",
            "nvim-treesitter/nvim-treesitter-textobjects",
            {
                "windwp/nvim-ts-autotag",
                config = function()
                    require("plugins.editor.ts-autotag").setup()
                end,
            },
            {
                "nvim-treesitter/nvim-treesitter-context",
                config = function()
                    require("plugins.editor.treesitter-context").setup()
                end,
            },
            {
                "JoosepAlviste/nvim-ts-context-commentstring",
                config = function()
                    require("plugins.editor.treesitter-context-commentstring").setup()
                end,
            },
        },
    },
  }