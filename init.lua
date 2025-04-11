-- Mini.nvim lib
local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		'git', 'clone', '--filter=blob:none',
		'https://github.com/echasnovski/mini.nvim', mini_path
	}
	vim.fn.system(clone_cmd)
	vim.cmd('packadd mini.nvim | helptags ALL')
	vim.cmd('echo "Installed `mini.vim`" | redraw')
end

require('mini.deps').setup({ path = { package = path_package } })

MiniDeps.now(function()
	require 'plugins.essentials'
	require 'plugins.clues'
	require 'plugins.colorschemes'
end)

MiniDeps.later(function()
	require 'mini.ai'.setup()
	require 'mini.operators'.setup()
	require 'mini.comment'.setup()
	require 'mini.surround'.setup()
	require 'mini.bracketed'.setup()
	require 'mini.jump'.setup()
	require 'mini.pairs'.setup()
	require 'mini.hipatterns'.setup()
	require 'mini.bufremove'.setup()
	require 'mini.indentscope'.setup()
	require 'mini.cursorword'.setup()
	require 'mini.trailspace'.setup()
	require 'plugins.lazy.git'
	require 'plugins.lazy.snippets'
	require 'plugins.lazy.lsp'
	require 'plugins.lazy.pick'
	require 'plugins.lazy.fold'
end)

require 'options'
require 'keymaps'
