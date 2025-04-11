local pm = MiniDeps
pm.add({ source = "catppuccin/nvim", name = "catppuccin" })
pm.add({ source = 'folke/tokyonight.nvim', name = 'tokyonight' })
pm.add({ source = "Shatur/neovim-ayu", name = "ayu" })
-- pm.add({ source = 'zaldih/themery.nvim' })
-- local available_colorschemes = vim.fn.getcompletion("", "color")
-- local colorschemes = {}
-- for _, colorscheme in ipairs(available_colorschemes) do
-- 	table.insert(colorschemes, colorscheme)
-- end
-- require 'themery'.setup({
-- 	themes = colorschemes,
-- 	livePreview = true,
-- })
require 'mini.base16'.setup({
	palette = {
		base00 = '#112641',
		base01 = '#3a475e',
		base02 = '#606b81',
		base03 = '#8691a7',
		base04 = '#d5dc81',
		base05 = '#e2e98f',
		base06 = '#eff69c',
		base07 = '#fcffaa',
		base08 = '#ffcfa0',
		base09 = '#cc7e46',
		base0A = '#46a436',
		base0B = '#9ff895',
		base0C = '#ca6ecf',
		base0D = '#42f7ff',
		base0E = '#ffc4ff',
		base0F = '#00a5c5',
	},
	use_cterm = true,
	plugins = {
		default = true
	}
})
require 'ayu'.setup({})
require 'catppuccin'.setup({
	flavor = "auto",
	background = {
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
	term_colors = true,
})


vim.cmd.colorscheme "ayu"
