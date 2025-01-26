local M = {}

M.setup = function()
    local config = {
		ignored_buftypes = {
			"nofile",
			"quickfix",
			"prompt",
		},
		ignored_filetypes = { "NvimTree" },
		default_amount = 3,
    }
    
    require("utils.setup").load_plugin("smart-splits", config)
end

return M