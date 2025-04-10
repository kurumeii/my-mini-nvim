-- Immediately load plugins
local func = {}
function func.init(pm)
	local notif = require('mini.notify')
	notif.setup()
	vim.notify = notif.make_notify()
	require 'mini.ai'.setup()
	require 'mini.animate'.setup()
	require 'mini.icons'.setup()
	require 'mini.tabline'.setup()
	require 'mini.statusline'.setup()
	require 'mini.basics'.setup({
		options = {
			extra_ui = true,
		}
	})
	require 'mini.files'.setup({
		windows = {
			preview = true
		}
	})
	pm.add({
		source = "max397574/better-escape.nvim",
		name = "better_esc",
	})
	require 'better_escape'.setup()
	pm.add({ source = "catppuccin/nvim", name = "catppuccin" })
	pm.add({ source = "Shatur/neovim-ayu", name = "ayu" })
	require 'ayu'.setup({})
	-- require 'catppuccin'.setup({
	-- 	flavor = "auto",
	-- 	background = {
	-- 		light = "latte",
	-- 		dark = "mocha",
	-- 	},
	-- 	transparent_background = true,
	-- 	term_colors = true,
	-- })
	vim.cmd.colorscheme "ayu"
	local miniclue = require 'mini.clue'
	miniclue.setup({
		triggers = {
			-- Leader triggers
			{ mode = 'n', keys = '<Leader>' },
			{ mode = 'x', keys = '<Leader>' },

			-- Built-in completion
			{ mode = 'i', keys = '<C-x>' },

			-- `g` key
			{ mode = 'n', keys = 'g' },
			{ mode = 'x', keys = 'g' },

			-- Marks
			{ mode = 'n', keys = "'" },
			{ mode = 'n', keys = '`' },
			{ mode = 'x', keys = "'" },
			{ mode = 'x', keys = '`' },

			-- Registers
			{ mode = 'n', keys = '"' },
			{ mode = 'x', keys = '"' },
			{ mode = 'i', keys = '<C-r>' },
			{ mode = 'c', keys = '<C-r>' },

			-- Window commands
			{ mode = 'n', keys = '<C-w>' },

			-- `z` key
			{ mode = 'n', keys = 'z' },
			{ mode = 'x', keys = 'z' },

			-- Bracketed Commands
			{ mode = 'n', keys = '[' },
			{ mode = 'n', keys = ']' },

		},

		clues = {
			-- Enhance this by adding descriptions for <Leader> mapping groups
			miniclue.gen_clues.builtin_completion(),
			miniclue.gen_clues.g(),
			miniclue.gen_clues.marks(),
			miniclue.gen_clues.registers(),
			miniclue.gen_clues.windows(),
			miniclue.gen_clues.z(),
		},
	})
end

return func
