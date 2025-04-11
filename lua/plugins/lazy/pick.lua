local win_config = function()
	local height = math.floor(0.618 * vim.o.lines)
	local width = math.floor(0.618 * vim.o.columns)
	return {
		anchor = 'NW',
		height = height,
		width = width,
		row = math.floor(0.5 * (vim.o.lines - height)),
		col = math.floor(0.5 * (vim.o.columns - width)),
	}
end

require 'mini.pick'.setup({
	options = {
		content_from_bottom = true,
		use_cache = true
	},
	window = {
		config = win_config
	}
})
require 'mini.fuzzy'.setup()
require 'mini.extra'.setup()

