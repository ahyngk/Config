return {
    {
      "folke/which-key.nvim",
      keys = {
        { "gb", "<cmd>Git blame<CR>", desc = "Git blame" },
        { "s", "<cmd>Flash<CR>", desc = "Flash jump" },

        -- Window navigation
        { "<C-h>", "<C-w>h", desc = "Move to left window" },
        { "<C-l>", "<C-w>l", desc = "Move to right window" },
        { "<C-j>", "<C-w>j", desc = "Move to down window" },
        { "<C-k>", "<C-w>k", desc = "Move to up window" },

        -- Buffer navigation
        { "<S-h>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
        { "<S-q>", "<cmd>BufDel<CR>", desc = "Close buffer" },
        
        -- Terminal mode mappings
        { "<C-h>", [[<C-\><C-n><C-w>h]], mode = "t", desc = "Move to left window" },
        { "<C-j>", [[<C-\><C-n><C-w>j]], mode = "t", desc = "Move to bottom window" },
        { "<C-k>", [[<C-\><C-n><C-w>k]], mode = "t", desc = "Move to top window" },
        { "<C-l>", [[<C-\><C-n><C-w>l]], mode = "t", desc = "Move to right window" },
      },
      config = function()
        local wk = require("which-key")
        wk.setup()
        
        wk.register({
          -- Git mappings
          g = {
            name = "Git",
            b = { "<cmd>Git blame<CR>", "Git blame" },
            s = { "<cmd>Gitsigns stage_hunk<CR>", "Stage hunk" },
            r = { "<cmd>Gitsigns reset_hunk<CR>", "Reset hunk" },
            d = { "<cmd>DiffviewOpen<CR>", "Diff view" },
            h = { function() require('gitsigns').blame_line{full=true} end, "Blame line" },
          },
          
          -- Find mappings
          f = {
            name = "Find",
            f = { "<cmd>Telescope find_files<CR>", "Find files" },
            g = { "<cmd>Telescope live_grep<CR>", "Live grep" },
            b = { "<cmd>Telescope buffers<CR>", "Buffers" },
            h = { "<cmd>Telescope help_tags<CR>", "Help tags" },
          },
          
          -- Buffer mappings
          b = {
            name = "Buffer",
            d = { "<cmd>BufDel<CR>", "Delete buffer" },
            n = { "<cmd>BufferLineCycleNext<CR>", "Next buffer" },
            p = { "<cmd>BufferLineCyclePrev<CR>", "Previous buffer" },
            e = { "<cmd>enew<CR>", "New empty buffer" },
          },
  
          -- LSP mappings
          -- l = {
          --   name = "LSP",
          --   d = { "<cmd>Lspsaga peek_definition<CR>", "Peek definition" },
          --   D = { "<cmd>Lspsaga goto_definition<CR>", "Goto definition" },
          --   r = { "<cmd>Lspsaga rename<CR>", "Rename" },
          --   a = { "<cmd>Lspsaga code_action<CR>", "Code action" },
          --   f = { function() vim.lsp.buf.format() end, "Format" },
          -- },
          
          -- Terminal mappings
          t = {
            name = "Terminal",
            t = { "<cmd>ToggleTerm<CR>", "Toggle terminal" },
            f = { "<cmd>ToggleTerm direction=float<CR>", "Float terminal" },
          },
  
          -- File explorer
          e = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
          
          -- Trouble   
          -- x = {
          --   name = "Trouble",
          --   x = { "<cmd>TroubleToggle<CR>", "Toggle trouble" },
          --   w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace diagnostics" },
          --   d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Document diagnostics" },
          -- },
          c = {
            name = "Cscope",
            s = { "<cmd>Cscope find s <C-R>=expand('<cword>')<CR><CR>", "Find symbol" },
            g = { "<cmd>Cscope find g <C-R>=expand('<cword>')<CR><CR>", "Find definition" },
            c = { "<cmd>Cscope find c <C-R>=expand('<cword>')<CR><CR>", "Find callers" },
            d = { "<cmd>Cscope find d <C-R>=expand('<cword>')<CR><CR>", "Find callees" },
            t = { "<cmd>Cscope find t <C-R>=expand('<cword>')<CR><CR>", "Find text" },
            e = { "<cmd>Cscope find e <C-R>=expand('<cword>')<CR><CR>", "Find egrep" },
            f = { "<cmd>Cscope find f <C-R>=expand('<cfile>')<CR><CR>", "Find file" },
            i = { "<cmd>Cscope find i <C-R>=expand('<cfile>')<CR><CR>", "Find includes" },
          }

        }, { prefix = "<leader>" })
      end,
      lazy = true,
      event = "VeryLazy",
    }
  }