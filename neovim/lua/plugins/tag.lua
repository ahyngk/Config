return {
    {
        "ludovicchabant/vim-gutentags",
        config = function()
            -- 캐시 디렉토리 생성
            local cache_dir = vim.fn.expand('~/.cache/nvim/ctags')
            if vim.fn.isdirectory(cache_dir) == 0 then
                vim.fn.mkdir(cache_dir, 'p')
            end

            -- gutentags 설정
            vim.g.gutentags_modules = {"ctags", "cscope_maps"}
            vim.g.gutentags_cscope_build_inverted_index_maps = 1
            vim.g.gutentags_project_root = {'.gdbinit', '.git'}
            vim.g.gutentags_add_default_project_roots = 0
            
            -- ctags 추가 인자
            vim.g.gutentags_ctags_extra_args = {
                '--c-kinds=+px',
                '--tag-relative=yes'
            }
            
            -- 캐시 디렉토리 설정
            vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/nvim/ctags')
            vim.g.gutentags_auto_add_cscope = 1
            
            -- 파일 제외 패턴
            vim.g.gutentags_ctags_exclude = {
                '.git', '.build', 'stub_*', '.*', '*_err_code*.h', '*_stdout_code.h'
            }

            -- 파일 검색 명령어
            vim.g.gutentags_file_list_command = 'find . ! \\( -type d \\( -name ".build" -o -name ".git" \\) -prune \\) ! \\( -type f \\( -name "stub_*" -o -name ".*" -o -name "*_err_code*.h" -o -name "*_stdout_code.h" \\) \\) -type f \\( -name "*.[chly]" -o -name "*.list" -o -name "*.pl" -o -name "*.error" -o -name "*.stdout" -o -name "Jam*" -o -name "*.py" \\)'

            -- 추가 설정
            vim.g.gutentags_define_advanced_commands = 1
            vim.g.gutentags_generate_on_missing = 1
            vim.g.gutentags_generate_on_new = 1
            vim.g.gutentags_generate_on_write = 1
        end
    },
    {
        "dhananjaylatkar/cscope_maps.nvim",
        lazy = true,
        event = { "BufReadPost", "BufAdd", "BufNewFile" },
        dependencies = {
            "folke/which-key.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("cscope_maps").setup({
                disable_maps = false,
                skip_input_prompt = false,
                prefix = "<leader>c",
                cscope = {
                    db_file = vim.fn.expand("$TB_HOME/src/cscope.out"),
                    exec = "cscope",
                    picker = "telescope",
                    skip_comments = true,
                    full_match = true,
                    auto_load = true,
                    relative_paths = true,
                    project_rooter = {
                        enable = true,
                        change_cwd = false,
                    },
                },
            })
        end,
    },
}