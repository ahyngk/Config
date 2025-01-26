local M = {}

M.setup = function()
    local nvim_lsp = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local get_option = require("utils.setup").get_option

    require("lspconfig.ui.windows").default_options.border = "rounded"
    require("utils.setup").load_plugin("mason-lspconfig", {
        ensure_installed = get_option("servers"),
    })

    local diagnostics = get_option("diagnostics")
    vim.diagnostic.config({
        virtual_text = diagnostics.virtual_text,
        signs = diagnostics.signs,
        underline = diagnostics.underline,
        update_in_insert = diagnostics.update_in_insert,
        float = diagnostics.float_opts,
        severity_sort = true,
    })

    local function load_handlers()
        local handlers = {}
        local scan = require('plenary.scandir')

        local custom_handlers_path = vim.fn.stdpath("config") .. "/lua/custom/handlers"
        local default_handlers_path = vim.fn.stdpath("config") .. "/lua/plugins/lsp/handlers"

        local function load_from_path(path)
            local files = {}
            local ok, scanned = pcall(scan.scan_dir, path, {
                depth = 1,
                search_pattern = "%.lua$"
            })
            if ok then
                files = scanned
            end
            return files
        end

        local custom_files = load_from_path(custom_handlers_path)
        for _, file in ipairs(custom_files) do
            local filename = vim.fn.fnamemodify(file, ':t:r')
            local ok, handler = pcall(require, "custom.handlers." .. filename)
            if ok then
                handlers[filename] = handler
                vim.notify("Loaded custom LSP handler: " .. filename, vim.log.levels.INFO)
            end
        end

        local default_files = load_from_path(default_handlers_path)
        for _, file in ipairs(default_files) do
            local filename = vim.fn.fnamemodify(file, ':t:r')
            if not handlers[filename] then
                local ok, handler = pcall(require, "plugins.lsp.handlers." .. filename)
                if ok then
                    handlers[filename] = handler
                    vim.notify("Loaded default LSP handler: " .. filename, vim.log.levels.INFO)
                end
            end
        end

        return handlers
    end

    local loaded_handlers = load_handlers()
    mason_lspconfig.setup_handlers(loaded_handlers)
end

return M