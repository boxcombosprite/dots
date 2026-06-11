vim.pack.add { 'https://github.com/j-hui/fidget.nvim' }
require('fidget').setup {
  progress = {
    suppress_on_insert = true,
    ignore_done_already = true,
    display = {
      render_limit = 12,
      done_ttl = 2,
    },
  },
}
