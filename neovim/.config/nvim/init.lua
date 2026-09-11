vim.cmd.colorscheme 'lunaperche'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- options
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'single', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  virtual_text = true, -- text at end of line
  virtual_lines = false, -- lines under
  jump = { float = true }, -- open float when jumping through diags
}

-- keybinds
local map = vim.keymap.set
do
  map('n', '<Esc>', '<cmd>nohlsearch<CR>')
  map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
  map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
  map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
  map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
  map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

  -- make window nav easier
  map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

  map('n', '<leader>ql', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix [L]ist' })
  map('n', '<leader>qf', vim.diagnostic.open_float, { desc = 'Open [Q]uickfix [F]loat' })

  -- kinda emacs in ins
  map('i', '<C-a>', '<C-o>^', { noremap = true })
  map('i', '<C-e>', '<C-o>$')
  map('i', '<C-f>', '<Right>')
  map('i', '<C-b>', '<Left>')

  -- window shite
  map({ 'n', 'x' }, '<C-w>,', ':vertical resize -2<CR>', { noremap = true, silent = true })
  map({ 'n', 'x' }, '<C-w>.', ':vertical resize +2<CR>', { noremap = true, silent = true })
  map({ 'n', 'x' }, '<C-w>-', ':resize -2<CR>', { noremap = true, silent = true })
  map({ 'n', 'x' }, '<C-w>+', ':resize +2<CR>', { noremap = true, silent = true })
  map({ 'n', 'x' }, '<C-w>=', '<C-w>=', { noremap = true, silent = true })

  -- nav
  map('n', '<C-d>', '<C-d>zz')
  map('n', '<C-u>', '<C-u>zz')
  map('n', '<C-f>', '<C-f>zz')
  map('n', '<C-b>', '<C-b>zz')

  -- move lines
  map('v', 'J', ":m '>+1<CR>gv")
  map('v', 'K', ":m '<-2<CR>gv")

  map('n', 'J', 'mzJ`z', { desc = 'join lines and keep cursor position' })

  -- reselect after indent
  map('v', '<', '<gv')
  map('v', '>', '>gv')
end

require('vim._core.ui2').enable()

-- autocommands
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- plugin hooks
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
      vim.cmd 'TSUpdate'
    end

    if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then vim.system({ 'make' }, { cwd = ev.data.path }) end

    if name == 'LuaSnip' and (kind == 'install' or kind == 'update') then vim.system({ 'make', 'install_jsregexp' }, { cwd = ev.data.path }) end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
