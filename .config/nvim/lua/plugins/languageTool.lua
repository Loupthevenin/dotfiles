return {
	{
		"dpelle/vim-LanguageTool",
		ft = { "markdown", "text" },
		config = function()
			vim.g.languagetool_jar = "/Users/loup/languagetool/LanguageTool-6.6/languagetool-commandline.jar"
			vim.g.languagetool_lang = "fr"
			vim.g.languagetool_disable_rules = ""
			vim.opt.encoding = "utf-8"
			vim.opt.fileencoding = "utf-8"
		end,
	},
}
