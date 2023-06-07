-- Theme
vim.cmd('colorscheme gruvbox')

-- Leader key
vim.g.mapleader = ","

-- Providers
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.loaded_python_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Clipboard
vim.g.clipboard = {
  name = 'xsel_override',
  copy = {
    ['+'] = 'xsel --input --clipboard',
    ['*'] = 'xsel --input --primary',
  },
  paste = {
    ['+'] = 'xsel --output --clipboard',
    ['*'] = 'xsel --output --primary',
  },
  cache_enabled = 0,
}
