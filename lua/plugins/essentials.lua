local func = {}
function func.init(pm)
  require 'mini.ai'.setup()
  -- require 'mini.animate'.setup()
	
  require 'mini.icons'.setup()
  require 'mini.tabline'.setup()
  require 'mini.statusline'.setup()
  require 'mini.basics'.setup({
    options = {
      extra_ui = true,
    }
  })
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

  local notif = require('mini.notify')
  notif.setup()
  vim.notify = notif.make_notify()
  pm.add({
    source = 'neovim/nvim-lspconfig',
    depends = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' }
  })
	  require 'mason'.setup()
  local lspConfig = require 'lspconfig'
  require 'mason-lspconfig'.setup({
    ensured_installed = {
      'lua_ls',
      'biome',
      'ts_ls',
      'cssls',
      'ast_grep'
    },
    automatic_install = true,
    handlers = {
      function(server_name)
        lspConfig[server_name].setup {}
      end
    }
  })
end

return func
