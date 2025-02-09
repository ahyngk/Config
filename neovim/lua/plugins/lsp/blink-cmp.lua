local M = {}

M.setup = function()
    local config = {
        signature = { enabled = false },
        keymap = {
            preset = "super-tab",
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
        },
    }

    require("utils.setup").load_plugin("blink.cmp", config)
end

return M