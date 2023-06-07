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

require("lazy").setup({
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      vim.g.coc_global_extensions = {
        'coc-go',
        'coc-clangd',
        'coc-pyright',
        'coc-lua',
        'coc-sh',
        'coc-diagnostic',
        'coc-json',
        'coc-yaml',
        'coc-vimlsp',
        'coc-docker',
        'coc-sql',
        'coc-tsserver',
        'coc-html',
        'coc-htmlhint',
        'coc-css',
        'coc-vetur',
        'coc-emmet',
        'coc-gitignore',
        'coc-snippets',
        'coc-prettier',
        'coc-lists',
        'coc-git',
        'coc-highlight',
        'coc-translator',
        'coc-explorer',
        'coc-leetcode'
      }

      -- Coc-go mappings
      vim.api.nvim_set_keymap('n', '<leader>gi', ':CocCommand go.impl.cursor<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<leader>ga', ':CocCommand go.tags.add.prompt<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<leader>gr', ':CocCommand go.tags.remove.prompt<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<leader>gc', ':CocCommand go.tags.clear<CR>', { silent = true })

      -- Coc-explorer mappings
      vim.api.nvim_set_keymap('n', '<space>e', ':CocCommand explorer<CR>', { silent = true })

      -- Coc-translate mappings
      vim.api.nvim_set_keymap('n', 't', '<Plug>(coc-translator-e)', {})
      vim.api.nvim_set_keymap('v', 't', '<Plug>(coc-translator-ev)', {})

      -- Coc-git mappings
      vim.api.nvim_set_keymap('o', 'ig', '<Plug>(coc-git-chunk-inner)', { silent = true })
      vim.api.nvim_set_keymap('x', 'ig', '<Plug>(coc-git-chunk-inner)', { silent = true })
      vim.api.nvim_set_keymap('o', 'ag', '<Plug>(coc-git-chunk-outer)', { silent = true })
      vim.api.nvim_set_keymap('x', 'ag', '<Plug>(coc-git-chunk-outer)', { silent = true })
      vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-git-nextchunk)', { silent = true })
      vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-git-prevchunk)', { silent = true })
      vim.api.nvim_set_keymap('n', ']c', '<Plug>(coc-git-nextconflict)', { silent = true })
      vim.api.nvim_set_keymap('n', '[c', '<Plug>(coc-git-prevconflict)', { silent = true })
      vim.api.nvim_set_keymap('n', '<space>a', ':CocCommand git.chunkStage<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<space>u', ':CocCommand git.chunkUndo<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<space>p', ':CocCommand git.chunkInfo<CR>', { silent = true })

      -- Coc-rename mapping
      vim.api.nvim_set_keymap('n', 'cr', '<Plug>(coc-rename)', {})

      -- Apply codeAction mapping
      vim.api.nvim_set_keymap('x', '<CR>', '<Plug>(coc-codeaction-selected)', { silent = true })

      -- Code navigation mappings
      vim.g.coc_enable_locationlist = false
      vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
      vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })
      vim.api.nvim_set_keymap('n', 'gt', '<Plug>(coc-type-definition)', { silent = true })
      vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
      vim.cmd([[autocmd User CocLocationsChange CocList --auto-preview location]])

      -- Diagnostic jump mappings
      vim.api.nvim_set_keymap('n', ']d', '<Plug>(coc-diagnostic-next)', { silent = true })
      vim.api.nvim_set_keymap('n', '[d', '<Plug>(coc-diagnostic-prev)', { silent = true })

      -- Jump preview chunk
      vim.api.nvim_set_keymap('n', '<C-o>', '<Plug>(coc-float-jump)', { silent = true })

      -- Preview windows move
      vim.api.nvim_set_keymap('i', '<C-j>', 'coc#float#scroll(1)', { silent = true, expr = true })
      vim.api.nvim_set_keymap('i', '<C-k>', 'coc#float#scroll(0)', { silent = true, expr = true })

      -- Coclist
      vim.api.nvim_set_keymap('n', '<Space>c', ':CocCommand<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<Space>l', ':CocList<CR>', { silent = true })

      -- CocCommand
      vim.api.nvim_set_keymap('n', '<Space>d', ':CocList diagnostics<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<Space>f', ':CocList files<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<Space>w', ':CocList words<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<Space>g', ':CocList grep<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<Space>m', ':CocList mru -A<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<Space>b', ':CocList buffers<CR>', { silent = true })

      local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
      vim.api.nvim_set_keymap("i", "<TAB>",
        'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
        opts)
      vim.api.nvim_set_keymap("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
      function _G.check_back_space()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
      end

      -- Make <CR> to accept selected completion item or notify coc.nvim to format
      -- <C-g>u breaks current undo, please make your own choice
      vim.api.nvim_set_keymap("i", "<cr>",
        [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
      -- Multi cursors
      vim.api.nvim_set_keymap('n', '<C-s>', ':<C-u>call v:lua.select_current_word()<CR>', { silent = true, expr = true })
      vim.api.nvim_set_keymap('n', '<C-q>', '<Plug>(coc-cursors-word)', { silent = true })

      function _G.select_current_word()
        if not vim.b.coc_cursors_activated then
          return "<Plug>(coc-cursors-word)"
        end
        return "*<Plug>(coc-cursors-word):nohlsearch<CR>"
      end

      -- Use gh to show documentation in preview window
      function _G.show_docs()
        local cw = vim.fn.expand('<cword>')
        if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
          vim.api.nvim_command('h ' .. cw)
        elseif vim.api.nvim_eval('coc#rpc#ready()') then
          vim.fn.CocActionAsync('doHover')
        else
          vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
        end
      end

      vim.api.nvim_set_keymap("n", "gh", '<CMD>lua _G.show_docs()<CR>', { silent = true }) -- Show documentation

      -- Format and Import
      vim.api.nvim_set_keymap('n', '<Leader>f', ':call CocActionAsync("format")<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>i', ':call CocActionAsync("runCommand", "editor.action.organizeImport")<CR>',
        { silent = true })

      -- Autocmd
      vim.cmd([[autocmd BufWritePre *.go silent call CocAction('runCommand', 'editor.action.organizeImport')]])
      vim.cmd([[autocmd BufWritePre *.go silent call CocAction('runCommand', 'editor.action.formatDocument')]])
      vim.cmd([[autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')]])
      vim.cmd([[autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')]])
      vim.cmd([[autocmd CursorHold * silent call CocActionAsync('highlight')]])
    end
  },
  {
    "Yggdroot/indentLine",
    config = function()
      vim.g.indentLine_char = '|'
      vim.g.indentLine_first_char = '|'
      vim.g.indentLine_setColors = 0
      vim.g.indentLine_showFirstIndentLevel = 1
      vim.g.indentLine_bufTypeExclude = { 'help' }
      vim.g.indentLine_bufNameExclude = { '_.*', 'term://.*', 'man://.*' }
      vim.g.indentLine_fileTypeExclude = {
        'go',
        'txt',
        'help',
        'coc-explorer',
        'vista'
      }
    end
  },
  { "tpope/vim-repeat" },
  { "jiangmiao/auto-pairs" },
  { "tomtom/tcomment_vim", },
  { "lambdalisue/suda.vim", cmd = { "SudaWrite", "SudaRead" } },
  {
    "liuchengxu/vista.vim",
    config = function()
      vim.api.nvim_set_keymap('n', '<Space>v', ':Vista!!<CR>', { silent = true })
    end
  },
  {
    "voldikss/vim-floaterm",
    config = function()
      vim.g.floaterm_opener = "tabe"
      vim.g.floaterm_title = ""
      vim.g.floaterm_width = 0.77
      vim.g.floaterm_height = 0.90

      vim.api.nvim_set_keymap('n', '<C-g><CR>', ':FloatermNew zsh<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<C-g>p', ':FloatermToggle<CR>', { silent = true })
      vim.api.nvim_set_keymap('t', '<C-g>p', '<CMD>FloatermToggle<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<C-g>l', ':FloatermNew lazygit<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<C-g>r', ':FloatermNew ranger<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<C-g>n', ':FloatermNew neomutt<CR>', { silent = true })
      vim.api.nvim_set_keymap('n', '<C-g>h', ':FloatermNew htop<CR>', { silent = true })
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    dependencies = { "mzlogin/vim-markdown-toc" },
    ft = "markdown",
    cmd = { "MarkdownPreview" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_theme = 'light'
      vim.g.vmt_list_item_char = '-'
      vim.g.vmt_auto_update_on_save = 0
    end
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text" },
    config = function()
      require("dapui").setup {}
      require("nvim-dap-virtual-text").setup {}
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
      vim.api.nvim_set_keymap('n', '<Leader>db', [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]],
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<Leader>dc', [[<cmd>lua require'dap'.continue()<CR>]],
        { noremap = true, silent = true })
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    config = function()
      require("dap-go").setup {
        dap_configurations = {
          {
            -- Must be "go" or it will be ignored by the plugin
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
          },
        },
        -- delve configurations
        delve = {
          -- the path to the executable dlv which will be used for debugging.
          -- by default, this is the "dlv" executable on your PATH.
          path = "dlv",
          -- time to wait for delve to initialize the debug session.
          -- default to 20 seconds
          initialize_timeout_sec = 20,
          -- a string that defines the port to start delve debugger.
          -- default to string "${port}" which instructs nvim-dap
          -- to start the process in a random available port
          port = "${port}",
          -- additional args to pass to dlv
          args = {}
        },
      }
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      require("nvim-treesitter.configs").setup {
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
    end
  },
})
