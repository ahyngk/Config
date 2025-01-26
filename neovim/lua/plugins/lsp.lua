return {
    {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      config = function()
        require("plugins.lsp.mason-lspconfig").setup()
      end,
    },
  }
  