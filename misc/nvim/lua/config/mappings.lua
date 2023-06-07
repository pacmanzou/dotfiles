-- Mappings
vim.api.nvim_set_keymap('', 'g', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'z', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 's', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'Q', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'S', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', 'Z', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '[', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', ']', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-q>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-o>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-g>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-t>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-x>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-y>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-z>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-\\>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-]>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-^>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-_>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<CR>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<BS>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>', '<nop>', { noremap = true, silent = true })

-- Windows focus
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })

-- Cursor move
vim.api.nvim_set_keymap('n', '<C-e>', '$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-a>', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', '<C-e>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', '<C-y>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gg', 'gg', { noremap = true, silent = true })

-- Focus move
vim.api.nvim_set_keymap('n', 'zh', 'zt', { noremap = true })
vim.api.nvim_set_keymap('n', 'zm', 'zz', { noremap = true })
vim.api.nvim_set_keymap('n', 'zl', 'zb', { noremap = true })

-- Visual select
vim.api.nvim_set_keymap('n', 'gV', 'ggVG$', { noremap = true, silent = true })

-- Windows exchange
vim.api.nvim_set_keymap('n', '<C-w>t', '<C-w>T', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>h', '<C-w>H', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>j', '<C-w>J', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>k', '<C-w>K', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>l', '<C-w>L', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>o', '<C-w>o', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-w>=', '<C-w>=', { noremap = true, silent = true })

-- Fold
vim.api.nvim_set_keymap('n', 'zo', 'zO', { noremap = true })
vim.api.nvim_set_keymap('n', 'zO', 'zR', { noremap = true })
vim.api.nvim_set_keymap('n', 'zc', 'zC', { noremap = true })
vim.api.nvim_set_keymap('n', 'zC', 'zM', { noremap = true })

-- Tab switch
vim.api.nvim_set_keymap('n', '<tab>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<s-tab>', ':tabprevious<CR>', { noremap = true, silent = true })

-- Copy name, path, directory
vim.api.nvim_set_keymap('n', 'yn', ':let @+=expand("%")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'yp', ':let @+=expand("%:p")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'yd', ':let @+=getcwd()<CR>', { noremap = true, silent = true })

-- Jumps
vim.api.nvim_set_keymap('n', '<C-n>', '<C-i>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-p>', '<C-o>', { noremap = true, silent = true })

-- Substitute
vim.api.nvim_set_keymap('n', '<Space>s', ':%s///gI<left><left><left><left>', {})
vim.api.nvim_set_keymap('v', '<Space>s', ':s///gI<left><left><left><left>', {})

-- Set x delete without copying
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'X', '"_D', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'x', '"_x', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'X', '"_X', { noremap = true, silent = true })

-- Quickily +, -
vim.api.nvim_set_keymap('n', '+', '<C-a>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '-', '<C-x>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '+', 'g<C-a>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '-', 'g<C-x>', { noremap = true, silent = true })

-- Hlsearch
vim.api.nvim_set_keymap('n', '<esc>', ':set nohlsearch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<enter>', ':set hlsearch<CR>', { noremap = true, silent = true })

-- Misc
vim.api.nvim_set_keymap('n', 'q:', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Q', '@q', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '>', '>>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<', '<<', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gf', '<C-w>gf', { noremap = true, silent = true })

-- Insert mode mappings
vim.api.nvim_set_keymap('i', '<C-@>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<C-q>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<C-r>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<C-o>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<C-s>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<C-g>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<C-j>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<C-k>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<C-l>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<C-z>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<C-x>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<C-v>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<C-\\>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<C-]>', '<nop>', {})
vim.api.nvim_set_keymap('i', '<C-f>', '<right>', {})
vim.api.nvim_set_keymap('i', '<C-b>', '<left>', {})
vim.api.nvim_set_keymap('i', '<C-d>', '<delete>', {})
vim.api.nvim_set_keymap('i', '<C-h>', '<backspace>', {})
vim.api.nvim_set_keymap('i', '<C-a>',
  vim.api.nvim_replace_termcodes(
    "<C-o>^", true, false, true),
  { noremap = true }
)
vim.api.nvim_set_keymap('i', '<C-e>',
  vim.api.nvim_replace_termcodes(
    "<C-o>$", true, false, true),
  { noremap = true }
)
vim.api.nvim_set_keymap('i', '<C-l>',
  vim.api.nvim_replace_termcodes(
    "<C-o>zt", true, false, true),
  { noremap = true }
)

-- Command-line mode mappings
vim.api.nvim_set_keymap('c', '<C-q>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<C-r>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<C-t>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<C-y>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<C-o>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<C-s>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<C-g>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<C-j>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<C-k>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<C-l>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<C-z>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<C-x>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<C-v>', '<nop>', {})
vim.api.nvim_set_keymap('c', '<C-a>', '<home>', {})
vim.api.nvim_set_keymap('c', '<C-e>', '<end>', {})
vim.api.nvim_set_keymap('c', '<C-f>', '<right>', {})
vim.api.nvim_set_keymap('c', '<C-b>', '<left>', {})
vim.api.nvim_set_keymap('c', '<C-d>', '<delete>', {})
