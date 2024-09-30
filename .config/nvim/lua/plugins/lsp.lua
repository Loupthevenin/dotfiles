return {
    -- tools
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"stylua",
				"selene",
				"luacheck",
				"shellcheck",
				"shfmt",
				"css-lsp",
                "clangd",
				"clang-format",
                "python-lsp-server",
                "bash-language-server",
                "cmake-language-server",
			})
		end,
	},
	-- lsp servers
	{
		"neovim/nvim-lspconfig",
		init = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			keys[#keys + 1] = {
				"gd",
				function()
					-- DO NOT RESUSE WINDOW
					require("telescope.builtin").lsp_definitions({ reuse_win = false })
				end,
				desc = "Goto Definition",
				has = "definition",
			}
		end,
		opts = {
			inlay_hints = { enabled = false },
			---@type lspconfig.options
			servers = {
				cssls = {},
				tailwindcss = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
				},
				tsserver = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
					single_file_support = false,
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				},
				html = {},
				yamlls = {
					settings = {
						yaml = {
							keyOrdering = false,
						},
					},
				},
				lua_ls = {
					-- enabled = false,
					single_file_support = true,
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = {
								workspaceWord = true,
								callSnippet = "Both",
							},
							misc = {
								parameters = {
									-- "--log-level=trace",
								},
							},
							hint = {
								enable = true,
								setType = false,
								paramType = true,
								paramName = "Disable",
								semicolon = "Disable",
								arrayIndex = "Disable",
							},
							doc = {
								privateName = { "^_" },
							},
							type = {
								castNumberToInteger = true,
							},
							diagnostics = {
								disable = { "incomplete-signature-doc", "trailing-space" },
								-- enable = false,
								groupSeverity = {
									strong = "Warning",
									strict = "Warning",
								},
								groupFileStatus = {
									["ambiguity"] = "Opened",
									["await"] = "Opened",
									["codestyle"] = "None",
									["duplicate"] = "Opened",
									["global"] = "Opened",
									["luadoc"] = "Opened",
									["redefined"] = "Opened",
									["strict"] = "Opened",
									["strong"] = "Opened",
									["type-check"] = "Opened",
									["unbalanced"] = "Opened",
									["unused"] = "Opened",
								},
								unusedLocalExclude = { "_*" },
							},
							format = {
								enable = false,
								defaultConfig = {
									indent_style = "space",
									indent_size = "2",
									continuation_indent_size = "2",
								},
							},
						},
					},
				},
				clangd = {
					cmd = { "clangd", "--background-index", "--clang-tidy" },
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git", "compile_commands.json", "compile_flags.txt")(...)
					end,
					settings = {
						clangd = {
							arguments = { "--all-scopes-completion", "--suggest-missing-includes" },
						},
					},
				},
				pyright = {
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "strict",  -- Options: off, basic, strict
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
								diagnosticMode = "workspace",  -- Options: openFilesOnly, workspace
							},
						},
					},
				},
			},
			setup = {},
		},
	},
	-- Norminette format with clang formt + norminette diagnostics
	-- {
	-- 	"nvimtools/none-ls.nvim",
	-- 	event = "LazyFile",
	-- 	dependencies = { "mason.nvim" },
	-- 	init = function()
	-- 	  LazyVim.on_very_lazy(function()
	-- 		-- register the formatter with LazyVim
	-- 		LazyVim.format.register({
	-- 		  name = "none-ls.nvim",
	-- 		  priority = 200, -- set higher than conform, the builtin formatter
	-- 		  primary = true,
	-- 		  format = function(buf)
	-- 			return LazyVim.lsp.format({
	-- 			  bufnr = buf,
	-- 			  filter = function(client)
	-- 				return client.name == "null-ls"
	-- 			  end,
	-- 			})
	-- 		  end,
	-- 		  sources = function(buf)
	-- 			local ret = require("null-ls.sources").get_available(vim.bo[buf].filetype, "NULL_LS_FORMATTING") or {}
	-- 			return vim.tbl_map(function(source)
	-- 			  return source.name
	-- 			end, ret)
	-- 		  end,
	-- 		})
	-- 	  end)
	-- 	end,
	-- 	opts = function(_, opts)
	-- 	  local nls = require("null-ls")
	-- 	  opts.root_dir = opts.root_dir
	-- 		or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
	-- 	  opts.sources = vim.list_extend(opts.sources or {}, {
	-- 		nls.builtins.formatting.fish_indent,
	-- 		nls.builtins.diagnostics.fish,
	-- 		nls.builtins.diagnostics.norminette.with({
	-- 			command = "norminette",
	-- 		}),
	-- 		nls.builtins.formatting.stylua,
	-- 		nls.builtins.formatting.shfmt,
	-- 		nls.builtins.formatting.clang_format.with({
	-- 			extra_args = { "--assume-filename=" .. vim.fn.expand("~/.config/nvim/lua/craft/.clang-format") },
	-- 		}),
	-- 	  })
	-- 	end,
	--   },

}