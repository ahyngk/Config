local M = {}

M.load_plugin = function(plugin_name, default_config)
    local ok, custom_config = pcall(require, "customs." .. plugin_name)
    local plugin = require(plugin_name)
    
    if ok then
        if type(custom_config) == "table" then
            local final_config = vim.tbl_deep_extend("force", default_config, custom_config)
            plugin.setup(final_config)
        elseif type(custom_config) == "function" then
            local final_config = custom_config(default_config)
            plugin.setup(final_config)
        end
    else
        if plugin and plugin.setup then
            plugin.setup(default_config)
        end
    end
end

M.get_option = function(option_name)
    local ok, custom_options = pcall(require, "custom.configs.options")
    if ok and custom_options[option_name] ~= nil then
        return custom_options[option_name]
    end
    
    local default_options = require("configs.options")
    return default_options[option_name]
end

return M