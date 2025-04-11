local pm = MiniDeps
require 'mini.completion'.setup()
pm.add({
	source = 'nvim-treesitter/nvim-treesitter',
	checkout = 'master',
	monitor = 'main',
	hooks = {
		post_checkout = function() vim.cmd('TSUpdate') end,
	}
})

require('nvim-treesitter.configs').setup({
	highlight = {
		enable = true
	},
	ensure_installed = { "lua", "vim", "vimdoc", "query", "git_rebase", "diff", "gitcommit" },
	auto_install = true,
})
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()lazy."
-- vim.cmd([[ set nofoldenable]])
pm.add({
	source = 'neovim/nvim-lspconfig',
	depends = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' }
})
require 'mason'.setup()
require 'mason-lspconfig'.setup({
	ensure_installed = {
		'lua_ls',
		'vimls',
		'biome',
		'ts_ls',
		'ast_grep',
	},
	automatic_installation = true,
	handlers = {
		function(server_name)
			require 'lspconfig'[server_name].setup {}
		end,
		lua_ls = function()
			require 'lspconfig'.lua_ls.setup({
				settings = {
					Lua = {
						telemetry = { enable = false }
					}
				},
				on_init = function(client)
					local nvim_settings = {
						runtime = {
							verions = "LuaJIT"
						},
						diagnostics = {
							globals = { 'vim' }
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								vim.fn.stdpath('config')
							}
						},
					}

					client.config.settings.Lua = vim.tbl_deep_extend(
						'force',
						client.config.settings.Lua,
						nvim_settings
					)
				end
			})
		end
	}
})

