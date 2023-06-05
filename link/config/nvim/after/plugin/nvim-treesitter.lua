local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  sync_install = false,
  auto_install = true,
  ignore_install = {
    "json",
    "vim"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner"
      },
    },
  },
}
