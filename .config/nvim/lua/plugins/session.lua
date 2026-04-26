return {
	{
		"rmagatti/auto-session",
		lazy = false,
		keys = {
			-- Will use Telescope if installed or a vim.ui.select picker otherwise
			{ "<leader>ls", "<cmd>AutoSession search<CR>", desc = "[L]ist session" },
			{ "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session" },
			{ "<leader>wa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
		},

		---enables autocomplete for opts
		---@module "auto-session"
		---@type AutoSession.Config
		opts = {
			session_lens = {
				picker = "telescope",
				mappings = {
					-- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
					delete_session = { "i", "<C-d>" },
					alternate_session = { "i", "<C-s>" },
					copy_session = { "i", "<C-y>" },
				},

				picker_opts = {
					-- For Telescope, you can set theme options here, see:
					-- https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt#L112
					-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/themes.lua
					--
					-- border = true,
					-- layout_config = {
					--   width = 0.8, -- Can set width and height as percent of window
					--   height = 0.5,
					-- },

					-- For Snacks, you can set layout options here, see:
					-- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#%EF%B8%8F-layouts
					--
					-- preset = "dropdown",
					-- preview = false,
					-- layout = {
					--   width = 0.4,
					--   height = 0.4,
					-- },
				},
				load_on_setup = true,
			},
		},
	},
}
