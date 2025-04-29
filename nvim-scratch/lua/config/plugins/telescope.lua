return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		tag = '0.1.8',
		dependencies = { 
			'nvim-lua/plenary.nvim', 
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }  
		},
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "ivy"
					}
				},
				extensions = { fzf = {} }
			})
			require('telescope').load_extension('fzf')
			local telescope_builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fd", telescope_builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fg", telescope_builtin.git_files, { desc = "Telescope find git files" })
			vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, { desc = "Telescope find all buffers" })
			vim.keymap.set("n", "<leader>nc", function() telescope_builtin.find_files({ cwd = vim.fn.stdpath("config") }) end)
		end,
	},
}
