local M = {}

M.setup = function()
    local icons = {
        ui = require("utils.icons").get("ui", true),
        misc = require("utils.icons").get("misc", true),
    }
    
    local config = {
        ui = {
            icons = {
                package_pending = icons.ui.Modified_alt,
                package_installed = icons.ui.Check,
                package_uninstalled = icons.misc.Ghost,
            },
            keymaps = {
                toggle_server_expand = "<CR>",
                install_server = "i",
                update_server = "u",
                check_server_version = "c",
                update_all_servers = "U",
                check_outdated_servers = "C",
                uninstall_server = "X",
                cancel_installation = "<C-c>",
            },
        },
    }
    
    require("utils.setup").load_plugin("mason", config)
end

return M