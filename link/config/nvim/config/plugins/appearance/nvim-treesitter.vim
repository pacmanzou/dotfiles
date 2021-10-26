lua << EOF
require("nvim-treesitter.install").prefer_git = true
require'nvim-treesitter.configs'.setup {
ensure_installed = {
    "go",
    "gomod",
    "python",
    "bash",
    "vim",
    "json",
    "javascript",
    "html",
    "css",
    "vue"
    },
    highlight = {
        enable = true
      },
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = {"darkorange", "darkgray"}
  },
    textsubjects = {
        enable = true,
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer'
        },
    },
}
EOF
