local M = {}

-- 캐시 디렉토리 설정
local function create_cache_dir()
    local cache_dir = vim.fn.expand("~/.cache/nvim")
    local data_dir = {
        cache_dir .. "/backup",
        cache_dir .. "/swap",
        cache_dir .. "/spell",
        cache_dir .. "/view",
        cache_dir .. "/undo",
    }

    -- 필요한 디렉토리 생성
    for _, dir in pairs(data_dir) do
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p", 0700)
        end
    end

    return cache_dir
end

-- 공통 옵션 설정
function M.setup_options()
    local cache_dir = create_cache_dir()

    local global_local = {
        -- Cache & backup related
        backupdir = cache_dir .. "/backup/",
        directory = cache_dir .. "/swap/",
        spellfile = cache_dir .. "/spell/en.uft-8.add",
        viewdir = cache_dir .. "/view/",
        undodir = cache_dir .. "/undo/",

        -- Line numbers & display
        number = true,
        relativenumber = false,
        colorcolumn = "80",
        cursorline = true,
        cursorcolumn = true,
        signcolumn = "yes",
        
        -- Indentation
        autoindent = true,
        tabstop = 4,
        shiftwidth = 4,
        expandtab = true,
        smarttab = true,
        
        -- File handling
        autoread = true,
        autowrite = true,
        autochdir = true,
        backup = false,
        swapfile = false,
        undofile = true,

        -- Search & completion
        ignorecase = true,
        smartcase = true,
        incsearch = true,
        inccommand = "nosplit",
        completeopt = "menuone,noselect,popup",

        -- Visual
        termguicolors = true,
        list = true,
        listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
        
        -- Path & tags
        tagrelative = true,
        tags = table.concat({
            "./tags;",
            "tags",
            vim.fn.expand("$TB_HOME/src/tags")
        }, ","),
    }

    for name, value in pairs(global_local) do
        vim.opt[name] = value
    end
end

-- Tag와 Path 관련 설정
function M.setup_tags_and_paths()
    local tb_home = vim.fn.expand("$TB_HOME/src")

    local function get_all_subdirs(path)
        local handle = io.popen('find "' .. path .. '" -type d')
        if not handle then return {} end
        
        local paths = {}
        for dir in handle:lines() do
            table.insert(paths, dir)
        end
        handle:close()
        
        return paths
    end

    local all_dirs = get_all_subdirs(tb_home)
    vim.opt.path:append(table.concat(all_dirs, ","))
end

-- Trailing Space 하이라이트 설정
function M.setup_trailing_space()
    vim.api.nvim_create_autocmd({"ColorScheme"}, {
        pattern = "*",
        callback = function()
            vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "#3E3E3E" })
            vim.fn.matchadd("TrailingWhitespace", "\\s\\+$")
        end,
    })
end

-- 사용자 정의 명령어 설정
function M.setup_commands()
    -- Trailing space 제거
    vim.api.nvim_create_user_command('Trail', function()
        vim.cmd([[%s/\s\+$//e]])
    end, {})

    -- 빈 줄 제거
    vim.api.nvim_create_user_command('Line', function()
        vim.cmd([[g/^$/d]])
    end, {})
end

-- Global 변수 설정
function M.setup_globals()
    -- Python provider
    vim.g.python3_host_prog = "/usr/bin/python3"
    
    -- Netrw style
    vim.g.netrw_liststyle = 3
    
    -- Additional globals
    vim.g.snacks_animate = false
end

-- 모든 설정을 한 번에 적용하는 함수
function M.setup()
    M.setup_options()
    M.setup_tags_and_paths()
    M.setup_trailing_space()
    M.setup_commands()
    M.setup_globals()
end

return M