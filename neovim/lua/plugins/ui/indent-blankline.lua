local M = {}

M.setup = function()
	local highlight = {
        "RainbowRed", "RainbowYellow", "RainbowBlue",
        "RainbowOrange", "RainbowGreen", "RainbowViolet", "RainbowCyan",
    }

    local hooks = require "ibl.hooks"
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)

	local nodes = {
		c = {
			"case_statement",
			"compound_literal_expression",
			"enumerator_list",
			"field_declaration_list",
			"initializer_list",
			"init_declarator",
		},
		cmake = {
			"block_def",
			"foreach_loop",
			"function_def",
			"if_condition",
			"macro_def",
			"normal_command",
			"while_loop",
		},
		cpp = {
			"case_statement",
			"compound_literal_expression",
			"condition_clause",
			"enumerator_list",
			"field_declaration_list",
			"field_initializer_list",
			"init_declarator",
			"initializer_list",
			"namespace_definition",
		},
		css = {
			"block",
			"declaration",
		},
		dot = {
			"block",
			"attr_list",
		},
		go = {
			"call_expression",
			"communication_case",
			"const_declaration",
			"default_case",
			"expression_case",
			"import_declaration",
			"literal_value",
			"parameter_list",
			"struct_type",
			"type_case",
			"type_declaration",
			"var_declaration",
		},
		html = {
			"start_tag",
			"self_closing_tag",
		},
		java = {
			"annotation_argument_list",
			"annotation_type_body",
			"argument_list",
			"array_initializer",
			"class_body",
			"constructor_body",
			"element_value_array_initializer",
			"enum_body",
			"formal_parameters",
			"interface_body",
			"method_invocation",
			"switch_block",
		},
		javascript = {
			"arguments",
			"array",
			"binary_expression",
			"call_expression",
			"class_body",
			"export_clause",
			"formal_parameters",
			"jsx_expression",
			"jsx_self_closing_element",
			"named_imports",
			"object",
			"object_pattern",
			"parenthesized_expression",
			"return_statement",
			"switch_case",
			"switch_default",
			"switch_statement",
			"template_substitution",
			"ternary_expression",
		},
		lua = {
			"arguments",
			"field",
			"method_index_expression",
			"return_statement",
			"table_constructor",
		},
		python = {
			"binary_operator",
			"case_clause",
			"concatenated_string",
			"for_statement",
			"generator_expression",
			"if_statement",
			"import_from_statement",
			"lambda",
			"list_pattern",
			"match_statement",
			"parenthesized_expression",
			"try_statement",
			"tuple_pattern",
			"while_statement",
			"with_statement",
		},
		query = {
			"list",
			"predicate",
		},
		scss = {
			"block",
			"declaration",
			"each_statement",
			"mixin_statement",
			"while_statement",
		},
		sql = {
			"case",
			"column_definitions",
			"cte",
			"insert",
			"select",
			"subquery",
			"when_clause",
		},
		ssh_config = {
			"host_declaration",
			"match_declaration",
		},
		toml = {
			"array",
			"inline_table",
		},
		typescript = {
			"arguments",
			"array",
			"binary_expression",
			"call_expression",
			"class_body",
			"enum_declaration",
			"export_clause",
			"formal_parameters",
			"interface_declaration",
			"named_imports",
			"object",
			"object_pattern",
			"object_type",
			"parenthesized_expression",
			"return_statement",
			"switch_case",
			"switch_default",
			"switch_statement",
			"template_substitution",
			"ternary_expression",
		},
		vue = {
			"start_tag",
		},
		xml = {
			"element",
		},
	}

	local config = {
		enabled = true,
		debounce = 200,
		indent = {
			char = "│",
			tab_char = "│",
			smart_indent_cap = true,
			priority = 2,
		},
		whitespace = { remove_blankline_trail = true },
		-- Note: The `scope` field requires treesitter to be set up
		scope = {
			enabled = true,
			highlight = highlight,
			char = "┃",
			show_start = false,
			show_end = false,
			injected_languages = true,
			priority = 1000,
			include = {
				node_type = {
					c = nodes.c,
					cmake = nodes.cmake,
					cpp = nodes.cpp,
					css = nodes.css,
					dot = nodes.dot,
					html = nodes.html,
					java = nodes.java,
					javascript = nodes.javascript,
					lua = nodes.lua,
					luau = nodes.lua,
					objc = nodes.c,
					python = nodes.python,
					query = nodes.query,
					scss = nodes.scss,
					sql = nodes.sql,
					ssh_config = nodes.ssh_config,
					toml = nodes.toml,
					typescript = nodes.typescript,
					vue = nodes.vue,
					xml = nodes.xml,
				},
			},
		},
		exclude = {
			buftypes = {
				"help",
				"nofile",
				"prompt",
				"quickfix",
				"terminal",
			},
			filetypes = {
				"",
				"alpha",
				"bigfile",
				"checkhealth",
				"dap-repl",
				"diff",
				"fugitive",
				"fugitiveblame",
				"git",
				"gitcommit",
				"help",
				"log",
				"markdown",
				"notify",
				"NvimTree",
				"Outline",
				"qf",
				"TelescopePrompt",
				"text",
				"toggleterm",
				"undotree",
				"vimwiki",
			},
		},
	}

    vim.g.rainbow_delimiters = { highlight = highlight }
    require("utils.setup").load_plugin("ibl", config)
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return M