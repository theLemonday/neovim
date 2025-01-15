return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
			-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
			vim.api.nvim_create_autocmd("TermOpen", {
				pattern = "term://*",
				callback = function()
					local opts = { buffer = 0 }
					vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
					vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
					vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
					vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
					vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
					vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
					vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
				end,
			})

			require("toggleterm").setup({})
		end,
		cmd = { "ToggleTerm" },
		keys = {
			{ "<leader>tt", '<Cmd>exe v:count1 . "ToggleTerm"<CR>', desc = "[T]oggle [T]erminal" },
		},
	},
}
