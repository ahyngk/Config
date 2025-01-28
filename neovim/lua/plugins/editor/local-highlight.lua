local M = {}

M.setup = function()
	local config = {
		hlgroup = "IlluminatedWordText",
		insert_mode = false,
	}
    require("utils.setup").load_plugin("local-highlight", config)
end

return M
