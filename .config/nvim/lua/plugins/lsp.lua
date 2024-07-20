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
                "python-lsp-server",
                "bash-language-server",
                "cmake-language-server",
			})
		end,
	},

}