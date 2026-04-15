-- deps:
-- nvim-lua/plenary.nvim
-- nvim-tree/nvim-web-devicons
-- MunifTanjim/nui.nvim

vim.pack.add { {
  src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
  version = vim.version.range '*',
} }
require('neo-tree').setup {
  window = {
    position = 'right',
  },
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}

vim.keymap.set('n', '\\', '<cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })
