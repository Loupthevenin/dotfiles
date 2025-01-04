-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Keymaps are automatically loaded on the VeryLazy event
-- Add any additional keymaps here

-- pas interessant
-- local discipline = require("craft.discipline")
-- discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- remap esc to jj for easier access
keymap.set("i", "jj", "<Esc>", { noremap = false })

-- Do things without affecting the registers COPY
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit<CR>")
keymap.set("n", "<tab>", ":tabnext<CR>", opts)
keymap.set("n", "<s-tab>", ":tabprev<CR>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- For searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

-----------
-- Obsidian
-----------

--- Path vers coffre Obsidian
local obsidian_vault_dir = "~/obsidian/Loup"

-- navigate to vault
keymap.set("n", "<leader>oo", ":cd " .. obsidian_vault_dir .. "<cr>", { silent = true })

-- create note
keymap.set("n", "<leader>on", function()
	vim.cmd("ObsidianNew")

	vim.schedule(function()
		local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
		if first_line and vim.startswith(first_line, "#") then
			vim.api.nvim_buf_set_lines(0, 0, 1, false, {})
		end
	end)
end, opts)
-- strip date from note title and whitespace
vim.keymap.set("n", "<leader>of", ":s/^# \\d\\{12\\} \\(.*\\)$/# \\1/<CR>", opts)

-- convert note to template
keymap.set("n", "<leader>ot", ":ObsidianTemplate <cr>")
keymap.set("n", "<leader>otn", ":ObsidianTemplate Template-Note<cr>")

-- search for files in full vault
keymap.set("n", "<leader>os", function()
	require("fzf-lua").files({
		cwd = obsidian_vault_dir,
	})
end, { silent = true })
keymap.set("n", "<leader>oz", function()
	require("fzf-lua").live_grep({
		cwd = obsidian_vault_dir,
	})
end, { silent = true })
