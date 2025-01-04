-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})

-- Formate on save for 42 norminette
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.c", "*.h" },
	callback = function()
		local current_file = vim.fn.expand("%")
		os.execute("c_formatter_42 " .. current_file)
		vim.cmd("edit!")
	end,
})
