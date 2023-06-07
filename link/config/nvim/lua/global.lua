-- Theme
vim.cmd('colorscheme gruvbox')

-- Encoding
vim.scriptencoding = 'utf-8'

-- Leader key
vim.g.mapleader = ","

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

-- Yank highlight
vim.cmd([[
    augroup HighlightOnYank
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=700}
    augroup END
]])

-- Keep last cursor
vim.cmd([[
    augroup RestoreCursorOnBufRead
        autocmd!
        autocmd BufReadPost * if line("\'\"") > 1 && line("\'\"") <= line("$") | exe "normal! g\'\"" | endif
    augroup END
]])

-- The ft is empty, map <C-n>, <C-p> <nop>
vim.cmd([[
        autocmd BufEnter * lua if vim.fn.index({'', ' '}, vim.bo.filetype) ~= -1 then vim.api.nvim_buf_set_keymap(0, 'n', '<C-n>', '<nop>', {}) vim.api.nvim_buf_set_keymap(0, 'n', '<C-p>', '<nop>', {}) end
]])
