-- Mappings
vim.keymap.set("", "g", "<nop>", { noremap = true, silent = true })
vim.keymap.set("", "z", "<nop>", { noremap = true, silent = true })
vim.keymap.set("", "s", "<nop>", { noremap = true, silent = true })
vim.keymap.set("", "Q", "<nop>", { noremap = true, silent = true })
vim.keymap.set("", "S", "<nop>", { noremap = true, silent = true })
vim.keymap.set("", "Z", "<nop>", { noremap = true, silent = true })
vim.keymap.set("", "[", "<nop>", { noremap = true, silent = true })
vim.keymap.set("", "]", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-q>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-o>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-g>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-x>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-y>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-z>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-\\>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-]>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-^>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-_>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<CR>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<BS>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<Space>", "<nop>", { noremap = true, silent = true })

-- Windows focus
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })

-- Cursor move
vim.keymap.set({ "n", "v", "o" }, "<C-e>", "$", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "o" }, "<C-a>", "^", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "o" }, "gg", "gg", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "J", "<C-e>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "K", "<C-y>", { noremap = true, silent = true })

-- Focus move
vim.keymap.set("n", "zh", "zt", { noremap = true })
vim.keymap.set("n", "zm", "zz", { noremap = true })
vim.keymap.set("n", "zl", "zb", { noremap = true })

-- Visual select
vim.keymap.set("n", "gV", "ggVG$", { noremap = true, silent = true })

-- Windows exchange
vim.keymap.set("n", "<C-w>t", "<C-w>T", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>h", "<C-w>H", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>j", "<C-w>J", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>k", "<C-w>K", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>l", "<C-w>L", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>o", "<C-w>o", { noremap = true, silent = true })
vim.keymap.set("n", "<C-w>=", "<C-w>=", { noremap = true, silent = true })

-- Fold
vim.keymap.set("n", "zo", "zO", { noremap = true })
vim.keymap.set("n", "zO", "zR", { noremap = true })
vim.keymap.set("n", "zc", "zC", { noremap = true })
vim.keymap.set("n", "zC", "zM", { noremap = true })

-- Tab switch
vim.keymap.set("n", "<tab>", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<s-tab>", ":tabprevious<CR>", { noremap = true, silent = true })

-- Copy name, path
vim.keymap.set("n", "yn", ":let @+=expand('%')<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "yp", ":let @+=expand('%:p')<CR>", { noremap = true, silent = true })

-- Jumps
vim.keymap.set("n", "<C-n>", "<C-i>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", "<C-o>", { noremap = true, silent = true })

-- Substitute
vim.keymap.set("n", "<Space>s", ":%s///gI<left><left><left><left>", {})
vim.keymap.set("v", "<Space>s", ":s///gI<left><left><left><left>", {})

-- Set x delete without copying
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "X", '"_D', { noremap = true, silent = true })

-- Quickily +, -
vim.keymap.set({ "n", "v" }, "+", "<C-a>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "-", "<C-x>", { noremap = true, silent = true })

-- Hlsearch
vim.keymap.set("n", "<Space>h", ":lua Toggle_hls()<CR>", { noremap = true, silent = true })

function Toggle_hls()
  if vim.o.hlsearch then
    vim.api.nvim_command("set nohlsearch")
  else
    vim.api.nvim_command("set hlsearch")
  end
end

-- Misc
vim.keymap.set("n", "q:", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "gf", "<C-w>gf", { noremap = true, silent = true })
vim.keymap.set("n", "gp", "%", { noremap = true, silent = true })
vim.keymap.set("n", "Q", "@q", { noremap = true, silent = true })
vim.keymap.set("n", ">", ">>", { noremap = true, silent = true })
vim.keymap.set("n", "<", "<<", { noremap = true, silent = true })
vim.keymap.set("n", "Y", "y$", { noremap = true, silent = true })
vim.keymap.set("t", "<C-s>", "<nop>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-o>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Insert mode mappings
vim.api.nvim_set_keymap("i", "<C-@>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-q>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-r>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-o>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-s>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-g>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-j>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-k>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-l>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-z>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-x>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-v>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-\\>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-]>", "<nop>", {})
vim.api.nvim_set_keymap("i", "<C-f>", "<right>", {})
vim.api.nvim_set_keymap("i", "<C-b>", "<left>", {})
vim.api.nvim_set_keymap("i", "<C-d>", "<delete>", {})
vim.api.nvim_set_keymap("i", "<C-h>", "<backspace>", {})
vim.api.nvim_set_keymap("i", "<C-a>", "<C-o>^", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-e>", "<C-o>$", { noremap = true })

-- Command-line mode mappings
vim.api.nvim_set_keymap("c", "<C-q>", "<nop>", {})
vim.api.nvim_set_keymap("c", "<C-r>", "<nop>", {})
vim.api.nvim_set_keymap("c", "<C-t>", "<nop>", {})
vim.api.nvim_set_keymap("c", "<C-y>", "<nop>", {})
vim.api.nvim_set_keymap("c", "<C-o>", "<nop>", {})
vim.api.nvim_set_keymap("c", "<C-s>", "<nop>", {})
vim.api.nvim_set_keymap("c", "<C-g>", "<nop>", {})
vim.api.nvim_set_keymap("c", "<C-j>", "<nop>", {})
vim.api.nvim_set_keymap("c", "<C-k>", "<nop>", {})
vim.api.nvim_set_keymap("c", "<C-l>", "<nop>", {})
vim.api.nvim_set_keymap("c", "<C-z>", "<nop>", {})
vim.api.nvim_set_keymap("c", "<C-x>", "<nop>", {})
vim.api.nvim_set_keymap("c", "<C-v>", "<nop>", {})
vim.api.nvim_set_keymap("c", "<C-a>", "<home>", {})
vim.api.nvim_set_keymap("c", "<C-e>", "<end>", {})
vim.api.nvim_set_keymap("c", "<C-f>", "<right>", {})
vim.api.nvim_set_keymap("c", "<C-b>", "<left>", {})
vim.api.nvim_set_keymap("c", "<C-d>", "<delete>", {})
