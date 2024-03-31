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
vim.o.guicursor = "n-v-c:block25," ..
    "i-ci-ve:ver25," ..
    "r-cr:hor20," ..
    "o:hor50," ..
    "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor," ..
    "sm:block-blinkwait175-blinkoff150-blinkon175"
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.listchars = "tab:| ,trail:▫"
vim.o.list = true
vim.o.magic = true
vim.o.mouse = "a"
vim.o.hls = false
vim.o.timeout = false
vim.o.number = true
vim.o.scrolloff = 5
vim.o.shiftwidth = 2
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
vim.o.writebackup = false

-- StatusLine depends on coc.nvim
vim.o.statusline = "%!luaeval('StatusLine()')"

function StatusLine()
  local res = ""
  res = res .. "%f %h%w%m%r  " .. Diagnostic()
  res = res .. "%=" .. GitBranch() .. GitStaus() .. "          "
  res = res .. "%l,%c%V          %P"
  return res
end

function GitBranch()
  local res = vim.g.coc_git_status or ""
  return res
end

function GitStaus()
  local res = vim.b.coc_git_status or ""
  return res
end

function Diagnostic()
  local info = vim.b.coc_diagnostic_info or {}
  local msgs = {}

  if vim.tbl_isempty(info) then return "" end

  if info["error"] and info["error"] > 0 then
    table.insert(msgs, " " .. info["error"] .. " ")
  end
  if info["warning"] and info["warning"] > 0 then
    table.insert(msgs, " " .. info["warning"] .. " ")
  end
  if info["hint"] and info["hint"] > 0 then
    table.insert(msgs, "󱟇 " .. info["hint"] .. " ")
  end
  if info["info"] and info["info"] > 0 then
    table.insert(msgs, " " .. info["info"])
  end
  return table.concat(msgs)
end
