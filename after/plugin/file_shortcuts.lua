vim.keymap.set('i', '<C-r>f', '<C-r>=expand("%:t:r")<CR>', { desc = 'inse[R]t [F]ile-name' })
vim.keymap.set('i', '<C-r>m', "<C-r>=toupper(substitute(expand('%:t:r'), '_', '-', 'g'))<CR>", { desc = 'inse[R]t file-name uppercase replace' })

