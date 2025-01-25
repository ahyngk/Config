local M = {}

M.setup = function()
    local config = {
        signs = {
            add = { text = "┃" },
            change = { text = "┃" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
            untracked = { text = "┆" },
        },
        auto_attach = true,
        signcolumn = true,
        sign_priority = 6,
        update_debounce = 100,
        word_diff = false,
        current_line_blame = true,
        current_line_blame_opts = { 
            delay = 1000,
            virt_text = true,
            virtual_text_pos = "eol"
        },
        diff_opts = { internal = true },
        watch_gitdir = { follow_files = true }
    }

    require("utils.setup").load_plugin("gitsigns", config)
end

return M