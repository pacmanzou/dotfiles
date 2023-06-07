-- Settings
vim.o.autochdir = true
vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.expandtab = true
vim.o.encoding = "utf-8"
vim.o.fileencodings = "utf-8"
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.listchars = "tab:| ,trail:▫"
vim.o.list = true
vim.o.magic = true
vim.o.matchpairs = "<:>,《:》,（:）,【:】,“:”,‘:’"
vim.o.mouse = "a"
vim.o.hls = false
vim.o.timeout = false
vim.o.number = true
vim.o.scrolloff = 5
vim.o.shiftwidth = 2
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.tabstop = 2
vim.o.updatetime = 100
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("data") .. "undo"
vim.o.writebackup = false

-- StatusLine with coc.nvim
vim.api.nvim_command("augroup statusline")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command("autocmd WinEnter,BufEnter * setlocal statusline=%!luaeval('StatusLine()')")
vim.api.nvim_command("augroup END")

function StatusLine()
  local s = ''
  s = s .. '%f %h%w%m%r  ' .. StatusDiagnostic()
  s = s .. '%=' .. StatusGit() .. '          '
  s = s .. '%l,%c%V          %P'
  return s
end

function StatusGit()
  local status = vim.b.coc_git_status or ''
  return status
end

function StatusDiagnostic()
  local info = vim.b.coc_diagnostic_info or {}
  local msgs = {}

  if vim.tbl_isempty(info) then return '' end

  if info['error'] and info['error'] > 0 then
    table.insert(msgs, 'E' .. info['error'] .. ' ')
  end
  if info['hint'] and info['hint'] > 0 then
    table.insert(msgs, 'H' .. info['hint'] .. ' ')
  end
  if info['info'] and info['info'] > 0 then
    table.insert(msgs, 'I' .. info['info'] .. ' ')
  end
  if info['warning'] and info['warning'] > 0 then
    table.insert(msgs, 'W' .. info['warning'])
  end
  return table.concat(msgs)
end
