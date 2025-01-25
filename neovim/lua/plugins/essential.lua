return {
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
        timeout = 3000,
        max_width = 60,
        render = "default",
      })
      vim.notify = require("notify")
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("plugins.essential.mason").setup()
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
}