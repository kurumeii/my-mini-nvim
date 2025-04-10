-- Lazy load plugins only when needed
local func = {}
function func.init(pm)
	require 'mini.ai'.setup()
	require 'mini.operators'.setup()
	require 'mini.comment'.setup()
	require 'mini.surround'.setup()
	require 'mini.bracketed'.setup()
	require 'mini.jump'.setup()
	require 'mini.pairs'.setup()
	require 'mini.diff'.setup()
	require 'mini.bufremove'.setup()
	require 'mini.cursorword'.setup({
		delay = 200
	})
	MiniIcons.tweak_lsp_kind('append')
	local snip = require 'mini.snippets'
	snip.setup({
		snippets = {
			snip.gen_loader.from_lang()
		}
	})

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
		ensured_installed = { "lua", "c", "vim", "vimdoc", "query", "git_rebase", "diff", "gitcommit"},
		auto_install = true,
	})
	vim.opt.foldmethod = 'expr'
	vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
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
			'cssls',
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
							telemetry = { enable = false}
						}
					},
					on_init = function (client)
						local nvim_settings = {
							runtime = {
								verions = "LuaJIT"
							},
							diagnostics = {
								globals = {'vim'}
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
end

return func
