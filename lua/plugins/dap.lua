return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			-- virtual text for the debugger
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
			{
				"leoluz/nvim-dap-go",
				opts = {},
			},
			"mfussenegger/nvim-dap-python",
		},
		keys = {
			{ "<leader>du", function() require("dapui").toggle({}) end, desc = "[D]ebug [U]I" },
			{
				"<leader>de",
				function() require("dapui").eval() end,
				desc = "[D]ebug [E]val",
				mode = { "n", "v" },
			},
			{
				"<leader>dB",
				function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
				desc = "Breakpoint Condition",
			},
			{
				"<leader>db",
				function() require("dap").toggle_breakpoint() end,
				desc = "[D]ebug Toggle [B]reakpoint",
			},
			{
				"<leader>dc",
				function() require("dap").continue() end,
				desc = "[D]ebug Run/[C]ontinue",
			},
			-- {
			-- 	"<leader>da",
			-- 	function() require("dap").continue({ before = get_args }) end,
			-- 	desc = "Run with Args",
			-- },
			{ "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
			{
				"<leader>dg",
				function() require("dap").goto_() end,
				desc = "Go to Line (No Execute)",
			},
			{ "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
			{ "<leader>dj", function() require("dap").down() end, desc = "Down" },
			{ "<leader>dk", function() require("dap").up() end, desc = "Up" },
			{ "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
			{ "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
			{ "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
			{ "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
			{ "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
			{ "<leader>ds", function() require("dap").session() end, desc = "Session" },
			{ "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
			{ "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
		},
		opts = {},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup(opts)
			dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open({}) end
			dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close({}) end
			dap.listeners.before.event_exited["dapui_config"] = function() dapui.close({}) end

			-- Highlight current debug line
			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

			-- setup dap config by VsCode launch.json file
			local vscode = require("dap.ext.vscode")
			local json = require("plenary.json")
			vscode.json_decode = function(str) return vim.json.decode(json.json_strip_comments(str)) end

			dap.adapters.bashdb = {
				type = "executable",
				command = "bashdb",
				name = "bashdb",
			}

			dap.configurations.sh = {
				{
					type = "bashdb",
					request = "launch",
					name = "Launch file",
					showDebugOutput = true,
					pathBashdb = vim.fn.stdpath("data")
						.. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
					pathBashdbLib = vim.fn.stdpath("data")
						.. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
					trace = true,
					file = "${file}",
					program = "${file}",
					cwd = "${workspaceFolder}",
					pathCat = "cat",
					pathBash = "/bin/bash",
					pathMkfifo = "mkfifo",
					pathPkill = "pkill",
					args = {},
					env = {},
					terminalKind = "integrated",
				},
			}
		end,
	},
}
