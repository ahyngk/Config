local M = {}

M.setup = function()
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    -- 기본 설정
    mason_lspconfig.setup({
        ensure_installed = {
            "pyright",
            "clangd",
        },
    })

    -- LSP 서버 설정
    lspconfig.pyright.setup({})
    lspconfig.clangd.setup({
        keys = {
            { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
        },
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "-j=4",
            "--header-insertion=iwyu",
        },
        "--function-arg-placeholders",
        filetypes = { "c", "cpp" },
        root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
        single_file_support = true,
        settings = {
            clangd = {
                fallbackFlags = { "-Wall" },
            },
        },
    })
end

return M