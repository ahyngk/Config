return {
    -- LSP 서버 설정
    servers = {
        "clangd",    -- C/C++
        "lua_ls",    -- Lua
        "pyright",   -- Python
        "tsserver",  -- TypeScript/JavaScript
    },
    
    diagnostics = {
        virtual_text = true,               -- 가상 텍스트 진단 표시
        level = "Warning",                 -- 진단 레벨
        signs = true,                      -- 진단 기호 표시
        underline = true,                  -- 진단 밑줄 표시
        update_in_insert = false,          -- 입력 중 업데이트
        float_opts = {                     -- 진단 플로팅 창 옵션
            border = "rounded",
            max_width = 80,
        },
    },
    
}