local M = {}

M.setup = vim.schedule_wrap(function()
	vim.api.nvim_set_option_value("foldmethod", "manual", {})
	
	local ts_install = require('nvim-treesitter.install')
    ts_install.compilers = { 
        require('utils.setup').get_option("treesitter_compiler"),
        require('utils.setup').get_option("treesitter_compiler_cpp")
      }
    ts_install.command_extra_args = require('utils.setup').get_option("treesitter_compiler_args")
	ts_install.prefer_git = true
   
	local config = {
	  ensure_installed = require('utils.setup').get_option("treesitter_install_lang"),
	  highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	  },
	  textobjects = {
		select = {
		  enable = true,
		  lookahead = true,
		  keymaps = {
			["af"] = "@function.outer",
			["if"] = "@function.inner", 
			["ac"] = "@class.outer",
			["ic"] = "@class.inner",
		  },
		},
		move = {
		  enable = true,
		  set_jumps = true,
		  goto_next_start = {
			["]["] = "@function.outer",
			["]m"] = "@class.outer",
		  },
		  goto_next_end = {
			["]]"] = "@function.outer",
			["]M"] = "@class.outer",
		  },
		  goto_previous_start = {
			["[["] = "@function.outer",
			["[m"] = "@class.outer",
		  },
		  goto_previous_end = {
			["[]"] = "@function.outer",
			["[M"] = "@class.outer",
		  },
		},
	  },
	  indent = { enable = true },
	  matchup = { enable = true },
	  compiler = {
		cc = "gcc",
		cflags = {
		  "-std=c99",
		  "-fPIC",
		}
	  },
	}
    require("utils.setup").load_plugin("treesitter", config)
end
)
return M