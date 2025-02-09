local M = {}

M.setup = function()
    local config = {
		highlights = {
			{
				filter = { filetype = "lua" },
				pattern = "%s*%-%-%-%s*(@%w+)",
				hl = "Constant",
			},
			{
				filter = { filetype = "python" },
				pattern = "%s*([_%w]+:)",
				hl = "Constant",
			},
		},
    }
    
    require("utils.setup").load_plugin("paint", config)
end

return M