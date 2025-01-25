local M = {}

M.setup = function()
	local icons = {
		diagnostics = require("utils.icons").get("diagnostics"),
		documents = require("utils.icons").get("documents"),
		git = require("utils.icons").get("git"),
		ui = require("utils.icons").get("ui"),
	}

	local function open_nvim_tree()
        require("nvim-tree.api").tree.open()
        require("nvim-tree.api").tree.change_root(vim.fn.getcwd())
    end

	local config = {
		auto_reload_on_write = true,
		create_in_closed_folder = false,
		disable_netrw = true,
		hijack_cursor = true,
		hijack_netrw = true,
		hijack_unnamed_buffer_when_opening = true,
		open_on_tab = false,
		respect_buf_cwd = true,
		sort_by = "name",
		sync_root_with_cwd = true,
		update_cwd = false,
		prefer_startup_root = false,
		on_attach = function(bufnr)
			require("nvim-tree.api").config.mappings.default_on_attach(bufnr)
			vim.keymap.del("n", "<C-e>", { buffer = bufnr })
		end,
		view = {
			adaptive_size = false,
			centralize_selection = false,
			width = 30,
			side = "left",
			preserve_window_proportions = true,
			number = false,
			relativenumber = false,
			signcolumn = "yes",
			float = {
				enable = false,
				open_win_config = {
					relative = "editor",
					border = "rounded",
					width = 30,
					height = 30,
					row = 1,
					col = 1,
				},
			},
		},
		renderer = {
			add_trailing = false,
			group_empty = true,
			highlight_git = true,
			full_name = false,
			highlight_opened_files = "none",
			special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt" },
			symlink_destination = true,
			indent_markers = {
				enable = true,
				icons = {
					corner = "└ ",
					edge = "│ ",
					item = "│ ",
					none = "  ",
				},
			},
			root_folder_label = ":.:s?.*?/..?",
			icons = {
				webdev_colors = true,
				git_placement = "after",
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
				},
				padding = " ",
				symlink_arrow = " 󰁔 ",
				glyphs = {
					default = icons.documents.Default, --
					symlink = icons.documents.Symlink, --
					bookmark = icons.ui.Bookmark,
					git = {
						unstaged = icons.git.Mod_alt,
						staged = icons.git.Add, --󰄬
						unmerged = icons.git.Unmerged,
						renamed = icons.git.Rename, --󰁔
						untracked = icons.git.Untracked, -- "󰞋"
						deleted = icons.git.Remove, --
						ignored = icons.git.Ignore, --◌
					},
					folder = {
						arrow_open = icons.ui.ArrowOpen,
						arrow_closed = icons.ui.ArrowClosed,
						-- arrow_open = "",
						-- arrow_closed = "",
						default = icons.ui.Folder,
						open = icons.ui.FolderOpen,
						empty = icons.ui.EmptyFolder,
						empty_open = icons.ui.EmptyFolderOpen,
						symlink = icons.ui.SymlinkFolder,
						symlink_open = icons.ui.FolderOpen,
					},
				},
			},
		},
		hijack_directories = {
			enable = true,
			auto_open = true,
		},
		update_focused_file = {
			enable = true,
			update_root = true,
			ignore_list = {},
		},
		filters = {
			dotfiles = false,
			custom = { ".DS_Store" },
			exclude = {},
		},
		actions = {
			use_system_clipboard = true,
			change_dir = {
				enable = true,
				global = false,
			},
			open_file = {
				quit_on_open = false,
				resize_window = false,
				window_picker = {
					enable = true,
					chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
					exclude = {
						buftype = {
							"help",
							"nofile",
							"prompt",
							"quickfix",
							"terminal",
						},
						filetype = {
							"dap-repl",
							"diff",
							"fugitive",
							"fugitiveblame",
							"git",
							"notify",
							"NvimTree",
							"Outline",
							"qf",
							"TelescopePrompt",
							"toggleterm",
							"undotree",
						},
					},
				},
			},
			remove_file = {
				close_window = true,
			},
		},
		diagnostics = {
			enable = false,
			show_on_dirs = false,
		},
		filesystem_watchers = {
			enable = true,
			debounce_delay = 100,
		},
		git = {
			enable = true,
			ignore = false,
			show_on_dirs = true,
			timeout = 500,
		},
		trash = {
			cmd = "gio trash",
			require_confirm = true,
		},
		live_filter = {
			prefix = "[FILTER]: ",
			always_show_folders = true,
		},
		log = {
			enable = false,
			truncate = false,
			types = {
				all = false,
				config = false,
				copy_paste = false,
				dev = false,
				diagnostics = false,
				git = false,
				profile = false,
				watcher = false,
			},
		},
	}

    require("utils.setup").load_plugin("nvim-tree", config)
end

return M