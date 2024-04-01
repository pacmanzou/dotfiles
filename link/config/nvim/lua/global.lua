-- Theme
vim.api.nvim_command("colorscheme gruvbox")

-- Encoding
vim.scriptencoding = "utf-8"

-- Leader key
vim.g.mapleader = ","

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Providers
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.loaded_python_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Clipboard
vim.g.clipboard = {
  name = "xsel_override",
  copy = {
    ["+"] = "xsel --input --clipboard",
    ["*"] = "xsel --input --primary",
  },
  paste = {
    ["+"] = "xsel --output --clipboard",
    ["*"] = "xsel --output --primary",
  },
  cache_enabled = 0,
}

-- Yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  command = "lua vim.highlight.on_yank{higroup='Visual', timeout=700}"
})

-- Enter write mode when opening terminal
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  command = "startinsert"
})

-- The ft is empty, map <C-n>, <C-p> <nop>
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.index({ "", " " }, vim.bo.filetype) ~= -1 then
      vim.api.nvim_buf_set_keymap(0, "n", "<C-n>", "<nop>", {})
      vim.api.nvim_buf_set_keymap(0, "n", "<C-p>", "<nop>", {})
    end
  end,
})

-- Keep last cursor
vim.api.nvim_create_autocmd("BufRead", {
  callback = function(opts)
    vim.api.nvim_create_autocmd("BufWinEnter", {
      once = true,
      buffer = opts.buf,
      callback = function()
        local ft = vim.bo[opts.buf].filetype
        local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
        if
            not (ft:match("commit") and ft:match("rebase"))
            and last_known_line > 1
            and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
        then
          vim.api.nvim_feedkeys([[g`"]], "nx", false)
        end
      end,
    })
  end,
})
