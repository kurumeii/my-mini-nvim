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
require 'mini.cursorword'.setup({
	delay = 200
})
require 'mini.trailspace'.setup()
require 'plugins.lazy.git'
require 'plugins.lazy.snippets'
require 'plugins.lazy.lsp'
require 'plugins.lazy.pick'
