local M = {}

M.setup = function()
	local config = {
		opts = {
			enable_close = true, -- Auto close tags
			enable_rename = true, -- Auto rename pairs of tags
			enable_close_on_slash = false, -- Auto close on trailing </
		},
	}
    require("utils.setup").load_plugin("nvim-ts-autotag", config)
end

return M
