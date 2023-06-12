-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lazy.nvim
require("lazy").setup({
  {
    "Yggdroot/indentLine",
    config = function()
      vim.g.indentLine_char = "|"
      vim.g.indentLine_first_char = "|"
      vim.g.indentLine_setColors = 0
      vim.g.indentLine_showFirstIndentLevel = 1
      vim.g.indentLine_bufTypeExclude = { "help" }
      vim.g.indentLine_bufNameExclude = { "_.*", "term://.*", "man://.*" }
      vim.g.indentLine_fileTypeExclude = {
        "go",
        "help",
        "vista"
      }
    end
  },
  {
    "echasnovski/mini.indentscope",
    config = function()
      require("mini.indentscope").setup {
        mappings = {
          -- Textobjects
          object_scope = "il",
          object_scope_with_border = "al",

          -- Motions (jump to respective border line; if not present - body line)
          goto_top = "]l",
          goto_bottom = "[l",
        },
        -- Which character to use for drawing scope indicator
        symbol = "|",
      }
      -- Disabled
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "vista", "help" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "go",
          "gomod",
          "gosum",
          "python",
          "lua",
          "bash",
          "markdown",
          "javascript",
          "html",
          "css",
          "vue"
        },
        sync_install = false,
        auto_install = false,
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
    end
  },
  {
    "neoclide/coc.nvim",
    branch = "release",
    event = "VeryLazy",
    config = function()
      vim.g.coc_global_extensions = {
        "coc-marketplace",
        "coc-clangd",
        "coc-pyright",
        "coc-lua",
        "coc-sh",
        "coc-diagnostic",
        "coc-json",
        "coc-yaml",
        "coc-vimlsp",
        "coc-docker",
        "coc-sql",
        "coc-tsserver",
        "coc-html",
        "coc-htmlhint",
        "coc-css",
        "coc-vetur",
        "coc-emmet",
        "coc-gitignore",
        "coc-snippets",
        "coc-prettier",
        "coc-lists",
        "coc-git",
        "coc-pairs",
        "coc-highlight",
        "coc-translator",
        "coc-leetcode"
      }

      -- Coc-translate mappings
      vim.keymap.set("n", "t", "<Plug>(coc-translator-e)", {})
      vim.keymap.set("v", "t", "<Plug>(coc-translator-ev)", {})

      -- Coc-git mappings
      vim.keymap.set({ "o", "x" }, "ig", "<Plug>(coc-git-chunk-inner)", { silent = true })
      vim.keymap.set({ "o", "x" }, "ag", "<Plug>(coc-git-chunk-outer)", { silent = true })
      vim.keymap.set("n", "[g", "<Plug>(coc-git-nextchunk)", { silent = true })
      vim.keymap.set("n", "]g", "<Plug>(coc-git-prevchunk)", { silent = true })
      vim.keymap.set("n", "[c", "<Plug>(coc-git-nextconflict)", { silent = true })
      vim.keymap.set("n", "]c", "<Plug>(coc-git-prevconflict)", { silent = true })
      vim.keymap.set("n", "<space>a", ":CocCommand git.chunkStage<CR>", { silent = true })
      vim.keymap.set("n", "<space>u", ":CocCommand git.chunkUndo<CR>", { silent = true })
      vim.keymap.set("n", "<space>p", ":CocCommand git.chunkInfo<CR>", { silent = true })

      -- Coc-rename mapping
      vim.keymap.set("n", "cr", "<Plug>(coc-rename)", {})

      -- Apply codeAction mapping
      vim.keymap.set("x", "<CR>", "<Plug>(coc-codeaction-selected)", { silent = true })

      -- Code navigation mappings
      vim.g.coc_enable_locationlist = false
      vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true })
      vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true })
      vim.keymap.set("n", "gt", "<Plug>(coc-type-definition)", { silent = true })
      vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true })

      -- Diagnostic jump mappings
      vim.keymap.set("n", "[d", "<Plug>(coc-diagnostic-next)", { silent = true })
      vim.keymap.set("n", "]d", "<Plug>(coc-diagnostic-prev)", { silent = true })

      -- Jump preview chunk
      vim.keymap.set("n", "<C-o>", "<Plug>(coc-float-jump)", { silent = true })

      -- Preview windows move
      vim.api.nvim_set_keymap("i", "<C-j>", "coc#float#scroll(1)", { silent = true, expr = true })
      vim.api.nvim_set_keymap("i", "<C-k>", "coc#float#scroll(0)", { silent = true, expr = true })

      -- Coclist
      vim.keymap.set("n", "<Space>c", ":CocCommand<CR>", { silent = true })
      vim.keymap.set("n", "<Space>l", ":CocList<CR>", { silent = true })

      -- CocCommand
      vim.keymap.set("n", "<Space>d", ":CocList diagnostics<CR>", { silent = true })
      vim.keymap.set("n", "<Space>f", ":CocList files<CR>", { silent = true })
      vim.keymap.set("n", "<Space>w", ":CocList words<CR>", { silent = true })
      vim.keymap.set("n", "<Space>g", ":CocList grep<CR>", { silent = true })
      vim.keymap.set("n", "<Space>m", ":CocList mru -A<CR>", { silent = true })
      vim.keymap.set("n", "<Space>b", ":CocList buffers<CR>", { silent = true })

      -- Make <CR> to accept selected completion item or notify coc.nvim to format
      local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
      vim.api.nvim_set_keymap("i", "<CR>",
        [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

      -- Multi cursors
      vim.keymap.set("n", "<C-s>", "<Plug>(coc-cursors-word)*", { silent = true })
      vim.keymap.set("n", "<Enter>", "<Plug>(coc-cursors-word)", { silent = true })

      -- Use gh to show documentation in preview window
      function _G.show_docs()
        local cw = vim.fn.expand("<cword>")
        if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
          vim.api.nvim_command("h " .. cw)
        elseif vim.api.nvim_eval("coc#rpc#ready()") then
          vim.fn.CocActionAsync("doHover")
        else
          vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
        end
      end

      vim.keymap.set("n", "gh", ":lua _G.show_docs()<CR>", { silent = true }) -- Show documentation

      -- Import and Format
      vim.keymap.set("n", "<Leader>f", ":call CocActionAsync('format')<CR>", { silent = true })
      vim.keymap.set("n", "<Leader>i", ":call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>",
        { silent = true })

      -- Autocmds
      vim.api.nvim_create_augroup("CocGroup", {})

      -- Auto preview location
      vim.api.nvim_create_autocmd("User", {
        group = "CocGroup",
        pattern = "CocLocationsChange",
        command = "CocList --auto-preview location",
        desc = "Auto preview location"
      })

      -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
      vim.api.nvim_create_autocmd("CursorHold", {
        group = "CocGroup",
        command = "silent call CocActionAsync('highlight')",
        desc = "Highlight symbol under cursor on CursorHold"
      })
      -- Setup formatexpr specified filetype(s)
      vim.api.nvim_create_autocmd("FileType", {
        group = "CocGroup",
        pattern = "typescript,json",
        command = "setl formatexpr=CocAction('formatSelected')",
        desc = "Setup formatexpr specified filetype(s)."
      })
      -- Update signature help on jump placeholder
      vim.api.nvim_create_autocmd("User", {
        group = "CocGroup",
        pattern = "CocJumpPlaceholder",
        command = "call CocActionAsync('showSignatureHelp')",
        desc = "Update signature help on jump placeholder"
      })
      -- Auto import for go
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = "CocGroup",
        pattern = "*.go",
        command = "silent call CocAction('runCommand', 'editor.action.organizeImport')",
        desc = "Auto import for go"
      })
      -- Auto format for go
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = "CocGroup",
        pattern = "*.go",
        command = "silent call CocAction('runCommand', 'editor.action.formatDocument')",
        desc = "Auto format for go"
      })
    end
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "leoluz/nvim-dap-go",
    },
    keys = "<Leader>d",
    config = function()
      require("dapui").setup()
      require("nvim-dap-virtual-text").setup()
      require("dap-go").setup()

      -- Auto open dapui
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Breakpoint and continue
      vim.keymap.set("n", "<Leader>db", ":DapToggleBreakpoint<CR>",
        { noremap = true, silent = true })
      vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>",
        { noremap = true, silent = true })
    end
  },
  {
    "liuchengxu/vista.vim",
    keys = "<Space>v",
    config = function()
      vim.g["vista#renderer#enable_icon"] = 0
      vim.g.vista_stay_on_open = 0
      vim.g.vista_echo_cursor = 0
      vim.g.vista_default_executive = "coc"
      vim.g.vista_update_on_text_changed = 1
      vim.g.vista_update_on_text_changed_delay = 500
      vim.keymap.set("n", "<Space>v", ":Vista!!<CR>", { silent = true })
    end
  },
  {
    "olexsmir/gopher.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "go",
    config = function()
      require("gopher").setup {
        commands = {
          go = "go",
          gomodifytags = "gomodifytags",
          gotests = "~/go/bin/gotests", -- also you can set custom command path
          impl = "impl",
          iferr = "iferr",
        },
      }
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    dependencies = { "mzlogin/vim-markdown-toc" },
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_theme = "light"
      vim.g.vmt_list_item_char = "-"
      vim.g.vmt_auto_update_on_save = 0
    end
  },
  {
    "echasnovski/mini.surround",
    keys = { "s", "ds", "cs", "v", "V", "<C-v>" },
    config = function()
      require("mini.surround").setup {
        mappings = {
          add = "s",           -- Add surrounding in Normal and Visual modes
          delete = "ds",       -- Delete surrounding
          find = "",           -- Find surrounding (to the right)
          find_left = "",      -- Find surrounding (to the left)
          highlight = "",      -- Highlight surrounding
          replace = "cs",      -- Replace surrounding
          update_n_lines = "", -- Update `n_lines`

          suffix_last = "",    -- Suffix to search with "prev" method
          suffix_next = "",    -- Suffix to search with "next" method
        },
        silent = true,
      }
    end
  },
  {
    "echasnovski/mini.align",
    keys = { "ga", "v", "V", "<C-v>" },
    config = function()
      require("mini.align").setup {
        silent = true
      }
    end
  },
  {
    "numToStr/Comment.nvim",
    keys = { "gc", "gb", "v", "V", "<C-v>" },
    config = function()
      require("Comment").setup()
    end
  },
  {
    "voldikss/vim-floaterm",
    keys = "<C-g>",
    config = function()
      vim.g.floaterm_opener = "vsplit"
      vim.g.floaterm_title = ""
      vim.g.floaterm_width = 0.77
      vim.g.floaterm_height = 0.90

      -- Open apps
      vim.keymap.set("t", "<C-g>p", "<CMD>FloatermToggle<CR>", { silent = true })
      vim.keymap.set("n", "<C-g>p", ":FloatermToggle<CR>", { silent = true })
      vim.keymap.set("n", "<C-g><CR>", ":FloatermNew zsh<CR>", { silent = true })
      vim.keymap.set("n", "<C-g>l", ":FloatermNew lazygit<CR>", { silent = true })
      vim.keymap.set("n", "<C-g>r", ":FloatermNew ranger<CR>", { silent = true })
      vim.keymap.set("n", "<C-g>n", ":FloatermNew neomutt<CR>", { silent = true })
      vim.keymap.set("n", "<C-g>h", ":FloatermNew htop<CR>", { silent = true })
    end
  },
})
