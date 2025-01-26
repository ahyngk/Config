return function(server, opts)
    require("lspconfig").clangd.setup({
        cmd = {
            "clangd",
            "--background-index",           -- 백그라운드 인덱싱은 유지
            "--clang-tidy=0",              -- clang-tidy 비활성화로 성능 향상
            "--header-insertion=never",
            "--completion-style=bundled",   -- detailed 대신 bundled 사용으로 성능 향상
            "-j=2",                        -- 동시 작업 수를 2로 제한
            "--query-driver=/usr/bin/gcc-4*,/usr/bin/gcc",
            "--malloc-trim",               -- 메모리 사용 최적화
            "--pch-storage=memory",        -- 메모리에 PCH 저장
            "--limit-references=1000",     -- 참조 검색 제한
            "--limit-results=20",          -- 결과 수 제한
            "--cache-dir=/tmp/clangd",     -- 캐시 디렉토리 지정
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = require("lspconfig.util").root_pattern(
            "compile_commands.json",
            "compile_flags.txt",
            "Makefile",
            ".git"
        ),
        single_file_support = true, 
        
        capabilities = opts.capabilities,
        
        on_attach = function(client, bufnr)
            local function buf_set_keymap(...)
                vim.api.nvim_buf_set_keymap(bufnr, ...)
            end
            
            local opts = { noremap = true, silent = true }
            buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
            buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
            buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
            buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
            
            if opts.on_attach then
                opts.on_attach(client, bufnr)
            end
        end,
        
        settings = {
            clangd = {
                fallbackFlags = {
                    "-std=gnu89",
                    "-Wall",
                    "-Wextra",
                    "-fgnu89-inline",
                    "-D_GNU_SOURCE", 
                },
            },
        },
    })
end