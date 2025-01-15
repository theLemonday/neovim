return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	opts = {
		-- add any custom options here
	},
	keys = {
		{
			"<leader>ws",
			function()
				require("persistence").load()
			end,
			desc = "re[S]tore the [W]orkspace/session for the current directory",
		},
		{
			"<leader>wl",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "restore the [L]ast [W]orkspace/session",
		},
		{
			"<leader>wd",
			function()
				require("persistence").stop()
			end,
			desc = "quit and [D]elete [W]orkspace/session",
		},
	},
}
