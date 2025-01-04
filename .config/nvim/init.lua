if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")

-- header de 42
vim.cmd("source ~/.config/nvim/lua/craft/stdheader.vim")
vim.g.user42 = "ltheveni"
vim.g.mail42 = "ltheveni@student.42.fr"
