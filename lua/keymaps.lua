local k = vim.keymap
-- mini tree filemap
k.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<CR>', { desc = "Open explore" })
-- Buffer remap
k.set('n', '<leader>bl', '<cmd>lua MiniBracketed.buffer("forward")<CR>', { desc = "[B]uffer (l) ->" })
k.set('n', '<leader>bh', '<cmd>lua MiniBracketed.buffer("backward")<CR>', { desc = "[B]uffer (h) <-" })
k.set('n', '<leader>bL', '<cmd>lua MiniBracketed.buffer("last")<CR>', { desc = "[B]uffer (L) ->>" })
k.set('n', '<leader>bH', '<cmd>lua MiniBracketed.buffer("first")<CR>', { desc = "[B]uffer (H) <<-" })
k.set('n', '<leader>bc', '<cmd>lua MiniBufremove.delete(0, false)<CR>', { desc = "[Buffer] [C]lose (x)" })
k.set('n', '<leader>bw', '<cmd>lua MiniBufremove.wipeou()<CR>', { desc = "[Buffer] [W]ipeout (x-all)" })
k.set('n', '<leader>bf', '<cmd>lua vim.lsp.buf.format()<cr>', {
	desc = "[B]uffer [F]ormat"
})
-- Themerey remap
k.set('n', '<leader>t', '<cmd>Themery<CR>', { desc = "Open colorscheme/theme menu" })
-- Qol remap
k.set('n', '<C-q>', '<cmd>q<CR>')
k.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
k.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
k.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
k.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
k.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
k.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
k.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
k.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
k.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
k.set('n', '-','zC', { desc = "Close fold under cursor", noremap = true} )
k.set('n', '=','zO', { desc = "Open fold under cursor", noremap = true} )
