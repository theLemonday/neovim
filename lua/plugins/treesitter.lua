local ensure_installed = {
	"ruby",
	"helm",
	"groovy",
	"gowork",
	"comment",
	"http",
	"templ",
	"svelte",
	"just",
	"bash",
	"c",
	"dockerfile",
	"go",
	"hcl",
	"html",
	"json",
	"json5",
	"jsonc",
	"lua",
	"luadoc",
	"markdown",
	"latex",
	"python",
	"terraform",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
	"css",
	"nix",
}

return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		-- event = { "VeryLazy" },
		-- cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		-- lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
		-- dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		opts = {
			ensure_installed = ensure_installed,
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby", "yaml" } },
			-- select = {
			-- 	enable = true,
			--
			-- 	-- Automatically jump forward to textobj, similar to targets.vim
			-- 	lookahead = true,
			--
			-- 	keymaps = {
			-- 		-- You can use the capture groups defined in textobjects.scm
			-- 		["af"] = "@function.outer",
			-- 		["if"] = "@function.inner",
			-- 		["ac"] = "@class.outer",
			-- 		-- You can optionally set descriptions to the mappings (used in the desc parameter of
			-- 		-- nvim_buf_set_keymap) which plugins like which-key display
			-- 		["ic"] = {
			-- 			query = "@class.inner",
			-- 			desc = "Select inner part of a class region",
			-- 		},
			-- 		-- You can also use captures from other query groups like `locals.scm`
			-- 		["as"] = {
			-- 			query = "@local.scope",
			-- 			query_group = "locals",
			-- 			desc = "Select language scope",
			-- 		},
			-- 	},
			-- 	-- You can choose the select mode (default is charwise 'v')
			-- 	--
			-- 	-- Can also be a function which gets passed a table with the keys
			-- 	-- * query_string: eg '@function.inner'
			-- 	-- * method: eg 'v' or 'o'
			-- 	-- and should return the mode ('v', 'V', or '<c-v>') or a table
			-- 	-- mapping query_strings to modes.
			-- 	selection_modes = {
			-- 		["@parameter.outer"] = "v", -- charwise
			-- 		["@function.outer"] = "V", -- linewise
			-- 		["@class.outer"] = "<c-v>", -- blockwise
			-- 	},
			-- 	-- If you set this to `true` (default is `false`) then any textobject is
			-- 	-- extended to include preceding or succeeding whitespace. Succeeding
			-- 	-- whitespace has priority in order to act similarly to eg the built-in
			-- 	-- `ap`.
			-- 	--
			-- 	-- Can also be a function which gets passed a table with the keys
			-- 	-- * query_string: eg '@function.inner'
			-- 	-- * selection_mode: eg 'v'
			-- 	-- and should return true or false
			-- 	include_surrounding_whitespace = true,
			-- },
			-- textobjects = {
			-- 	move = {
			-- 		enable = true,
			-- 		goto_next_start = {
			-- 			["]f"] = "@function.outer",
			-- 			["]c"] = "@class.outer",
			-- 		},
			-- 		goto_next_end = {
			-- 			["]F"] = "@function.outer",
			-- 			["]C"] = "@class.outer",
			-- 		},
			-- 		goto_previous_start = {
			-- 			["[f"] = "@function.outer",
			-- 			["[c"] = "@class.outer",
			-- 		},
			-- 		goto_previous_end = {
			-- 			["[F"] = "@function.outer",
			-- 			["[C"] = "@class.outer",
			-- 		},
			-- 	},
			-- },
		},
		-- config = function(_, opts)
		-- 	-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
		--
		-- 	-- Prefer git instead of curl in order to improve connectivity in some environments
		-- 	require("nvim-treesitter.install").prefer_git = true
		--
		-- 	---@diagnostic disable-next-line: missing-fields
		-- 	require("nvim-treesitter.configs").setup(opts)
		--
		-- 	-- There are additional nvim-treesitter modules that you can use to interact
		-- 	-- with nvim-treesitter. You should go explore a few and see what interests you:
		-- 	--
		-- 	--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
		-- 	--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
		-- 	--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		-- end,
	},
	-- {
	-- 	"nvim-treesitter/nvim-treesitter-textobjects",
	-- 	event = "VeryLazy",
	-- 	enabled = true,
	-- 	lazy = true,
	-- 	config = function()
	-- 		require("nvim-treesitter.configs").setup({
	-- 			textobjects = {
	-- 				select = {
	-- 					enable = true,
	--
	-- 					-- Automatically jump forward to textobj, similar to targets.vim
	-- 					lookahead = true,
	-- 				},
	-- 			},
	-- 		})
	-- 		require("vim.treesitter.language").register("markdown", "telekasten")
	-- 	end,
	-- },
	{ "towolf/vim-helm", ft = "helm" },
}
