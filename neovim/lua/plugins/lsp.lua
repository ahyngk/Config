return {
    {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      config = function()
        require("plugins.lsp.mason-lspconfig").setup()
      end,
    },
    {
      "saghen/blink.cmp",
      event = "InsertEnter",
      enabled = true,
      version = "v0.10.0",
      config = function()
        require("plugins.lsp.blink-cmp").setup()
      end,
    },
  }
  