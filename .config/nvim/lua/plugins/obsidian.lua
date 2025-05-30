return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "test",
				path = "/Users/loup/Library/Mobile Documents/iCloud~md~obsidian/Documents/Loup",
			},
		},
		notes_subdir = "05 - Fleeting",
		new_notes_location = "notes_subdir",

		note_id_func = function(title)
			if string.sub(title, 1, 1) == "!" then
				return string.sub(title, 2)
			else
				local date_str = os.date("%Y%m%d%H%M")
				local suffix = ""
				if title ~= nil and title ~= "" then
					suffix = title
				else
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return date_str .. " " .. suffix
			end
		end,

		ui = { enable = false },

		disable_frontmatter = true,
		templates = {
			subdir = "99 - Meta/Templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},

		daily_notes = {
			folder = "06 - Daily",
			date_format = "%Y-%m-%d",
			template = "99 - Meta/Templates/Template-Daily",
		},
	},
}
