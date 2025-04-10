local k = vim.keymap
k.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
k.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
k.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
k.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
k.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
k.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
k.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
k.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
k.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- mini tree filemap
k.set('n', '<leader>e', '<cmd>lua MiniFiles.open()<CR>', { desc = "Open explore" })
-- Buffer remap
k.set('n', '<leader>bn', '<cmd>lua MiniBracketed.buffer("forward")<CR>', { desc = "[B]uffer [N]ext ->" })
k.set('n', '<leader>bp', '<cmd>lua MiniBracketed.buffer("backward")<CR>', { desc = "[B]uffer [P]revious <-" })
k.set('n', '<leader>bf', '<cmd>lua MiniBracketed.buffer("first")<CR>', { desc = "[B]uffer [F]irst" })
k.set('n', '<leader>bl', '<cmd>lua MiniBracketed.buffer("last")<CR>', { desc = "[B]uffer [L]ast" })
k.set('n', '<leader>bc', '<cmd>lua MiniBufremove.delete(0, false)<CR>', { desc = "[Buffer] [C]lose (x)" })
