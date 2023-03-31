local function Keymap(mode, lhs, funcs, desc )
  local options = { noremap = true }
  if desc then
      desc = 'LSP: ' .. desc
  end
  vim.keymap.set(mode, lhs, funcs, options)
end

Keymap('n', '<leader>t', ':VimwikiToggleListItem<CR>', 'Toggle list item')
Keymap('i', '<C-g>t', os.date(), "Insert Date")

-- nnoremap <leader>t :VimwikiToggleListItem<CR>
