local pm = MiniDeps
local notif = require('mini.notify')
notif.setup()
vim.notify = notif.make_notify()
require 'mini.animate'.setup()
require 'mini.icons'.setup()
require 'mini.tabline'.setup()
require 'mini.statusline'.setup()
require 'mini.basics'.setup()
require 'mini.files'.setup()
pm.add({
	source = "max397574/better-escape.nvim",
	name = "better_esc",
})
require 'better_escape'.setup()
