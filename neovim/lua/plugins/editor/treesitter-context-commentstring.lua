local M = {}

M.setup = function()
    local config = {
		-- Whether to update the `commentstring` on the `CursorHold` autocmd
		enable_autocmd = false,
	}
    require("utils.setup").load_plugin("ts_context_commentstring", config)
end

return M