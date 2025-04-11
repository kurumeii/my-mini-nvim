local pm = MiniDeps
pm.add({
	source = "kevinhwang91/nvim-ufo",
	name = "nvim-fold",
	depends = {
		'kevinhwang91/promise-async',
		'luukvbaal/statuscol.nvim'
	}
})
local builtin = require("statuscol.builtin")
require 'statuscol'.setup({
	relculright = true,
	segments = {
		{ text = { builtin.foldfunc },      click = "v:lua.ScFa" },
		{ text = { "%s" },                  click = "v:lua.ScSa" },
		{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
	},
})
local ufo = require 'ufo'
ufo.setup({
	provider_selector = function()
		return {
			'treesitter',
			'indent'
		}
	end
})
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local k = vim.keymap
k.set('n', '-', ufo.closeFoldsWith, { desc = "Close fold under cursor", noremap = true })
k.set('n', '<C-->', ufo.closeAllFolds, { desc = "Close fold under cursor", noremap = true })
k.set('n', '=', ufo.openFoldsExceptKinds, { desc = "Open fold under cursor", noremap = true })
k.set('n', '<C->=', ufo.openAllFolds, { desc = "Open all folds under cursor", noremap = true })
k.set('n', 'K', function()
	local winid = ufo.peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end, { desc = "Peak insde" })
