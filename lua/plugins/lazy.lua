local func = {} 
function func.init(pm)

require 'mini.ai'.setup()
require 'mini.comment'.setup()
require 'mini.surround'.setup()
require 'mini.bracketed'.setup()
require 'mini.jump'.setup()
require 'mini.pairs'.setup()
require 'mini.cursorword'.setup({
	delay = 200
})
local snip = require 'mini.snippets'
snip.setup({
	snippets = {
		snip.gen_loader.from_lang()
	}
})
require 'mini.completion'.setup()
-- Treesitter
pm.add({
	source = 'nvim-treesitter/nvim-treesitter',
	checkout = 'master',
	monitor = 'main',
	hooks = {
		post_checkout = function () vim.cmd('TSUpdate') end,
	}
})
require('nvim-treesitter.configs').setup()
end

return func
