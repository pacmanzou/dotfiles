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
  {
    "echasnovski/mini.indentscope",
    config = function()
      require("mini.indentscope").setup {
        mappings = {
          -- Textobjects
          object_scope = 'il',
          object_scope_with_border = 'al',

          -- Motions (jump to respective border line; if not present - body line)
          goto_top = '[l',
          goto_bottom = ']l',
        },
        -- Which character to use for drawing scope indicator
        symbol = '|',
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
        'coc-pairs',
        'coc-highlight',
        'coc-translator',
        'coc-explorer',
        'coc-leetcode'
      }

      -- Coc-go mappings
      vim.keymap.set('n', '<leader>gi', ':CocCommand go.impl.cursor<CR>', { silent = true })
      vim.keymap.set('n', '<leader>ga', ':CocCommand go.tags.add.prompt<CR>', { silent = true })
      vim.keymap.set('n', '<leader>gr', ':CocCommand go.tags.remove.prompt<CR>', { silent = true })
      vim.keymap.set('n', '<leader>gc', ':CocCommand go.tags.clear<CR>', { silent = true })

      -- Coc-explorer mappings
      vim.keymap.set('n', '<space>e', ':CocCommand explorer<CR>', { silent = true })

      -- Coc-translate mappings
      vim.keymap.set('n', 't', '<Plug>(coc-translator-e)', {})
      vim.keymap.set('v', 't', '<Plug>(coc-translator-ev)', {})

      -- Coc-git mappings
      vim.keymap.set({ 'o', 'x' }, 'ig', '<Plug>(coc-git-chunk-inner)', { silent = true })
      vim.keymap.set({ 'o', 'x' }, 'ag', '<Plug>(coc-git-chunk-outer)', { silent = true })
      vim.keymap.set('n', ']g', '<Plug>(coc-git-nextchunk)', { silent = true })
      vim.keymap.set('n', '[g', '<Plug>(coc-git-prevchunk)', { silent = true })
      vim.keymap.set('n', ']c', '<Plug>(coc-git-nextconflict)', { silent = true })
      vim.keymap.set('n', '[c', '<Plug>(coc-git-prevconflict)', { silent = true })
      vim.keymap.set('n', '<space>a', ':CocCommand git.chunkStage<CR>', { silent = true })
      vim.keymap.set('n', '<space>u', ':CocCommand git.chunkUndo<CR>', { silent = true })
      vim.keymap.set('n', '<space>p', ':CocCommand git.chunkInfo<CR>', { silent = true })

      -- Coc-rename mapping
      vim.keymap.set('n', 'cr', '<Plug>(coc-rename)', {})

      -- Apply codeAction mapping
      vim.keymap.set('x', '<CR>', '<Plug>(coc-codeaction-selected)', { silent = true })

      -- Code navigation mappings
      vim.g.coc_enable_locationlist = false
      vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
      vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
      vim.keymap.set('n', 'gt', '<Plug>(coc-type-definition)', { silent = true })
      vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
      vim.cmd([[autocmd User CocLocationsChange CocList --auto-preview location]])

      -- Diagnostic jump mappings
      vim.keymap.set('n', ']d', '<Plug>(coc-diagnostic-next)', { silent = true })
      vim.keymap.set('n', '[d', '<Plug>(coc-diagnostic-prev)', { silent = true })

      -- Jump preview chunk
      vim.keymap.set('n', '<C-o>', '<Plug>(coc-float-jump)', { silent = true })

      -- Preview windows move
      vim.api.nvim_set_keymap('i', '<C-j>', 'coc#float#scroll(1)', { silent = true, expr = true })
      vim.api.nvim_set_keymap('i', '<C-k>', 'coc#float#scroll(0)', { silent = true, expr = true })

      -- Coclist
      vim.keymap.set('n', '<Space>c', ':CocCommand<CR>', { silent = true })
      vim.keymap.set('n', '<Space>l', ':CocList<CR>', { silent = true })

      -- CocCommand
      vim.keymap.set('n', '<Space>d', ':CocList diagnostics<CR>', { silent = true })
      vim.keymap.set('n', '<Space>f', ':CocList files<CR>', { silent = true })
      vim.keymap.set('n', '<Space>w', ':CocList words<CR>', { silent = true })
      vim.keymap.set('n', '<Space>g', ':CocList grep<CR>', { silent = true })
      vim.keymap.set('n', '<Space>m', ':CocList mru -A<CR>', { silent = true })
      vim.keymap.set('n', '<Space>b', ':CocList buffers<CR>', { silent = true })

      -- TAB like C-n, C-p
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
      vim.api.nvim_set_keymap("i", "<cr>",
        [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

      -- Multi cursors
      vim.keymap.set('n', '<C-s>', '<Plug>(coc-cursors-word)*', { silent = true })
      vim.keymap.set('n', '<C-q>', "<Plug>(coc-cursors-word)", { silent = true })

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

      vim.keymap.set("n", "gh", '<CMD>lua _G.show_docs()<CR>', { silent = true }) -- Show documentation

      -- Format and Import
      vim.keymap.set('n', '<Leader>f', ':call CocActionAsync("format")<CR>', { silent = true })
      vim.keymap.set('n', '<Leader>i', ':call CocActionAsync("runCommand", "editor.action.organizeImport")<CR>',
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
    "iamcco/markdown-preview.nvim",
    dependencies = { "mzlogin/vim-markdown-toc" },
    ft = "markdown",
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
    keys = "<Leader>d",
    config = function()
      require("dapui").setup {}
      require("nvim-dap-virtual-text").setup {}

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
      vim.keymap.set('n', '<Leader>db', [[<cmd>lua require'dap'.toggle_breakpoint()<CR>]],
        { noremap = true, silent = true })
      vim.keymap.set('n', '<Leader>dc', [[<cmd>lua require'dap'.continue()<CR>]],
        { noremap = true, silent = true })
    end
  },
  {
    "leoluz/nvim-dap-go",
    keys = "<Leader>d",
    config = function()
      require("dap-go").setup()
    end
  },
  {
    "echasnovski/mini.surround",
    keys = { "s", "d", "c", "v", "V", "C-v" },
    config = function()
      require("mini.surround").setup {
        mappings = {
          add = 's',           -- Add surrounding in Normal and Visual modes
          delete = 'ds',       -- Delete surrounding
          find = '',           -- Find surrounding (to the right)
          find_left = '',      -- Find surrounding (to the left)
          highlight = '',      -- Highlight surrounding
          replace = 'cs',      -- Replace surrounding
          update_n_lines = '', -- Update `n_lines`

          suffix_last = '',    -- Suffix to search with "prev" method
          suffix_next = '',    -- Suffix to search with "next" method
        },
        silent = false,
      }
    end
  },
  {
    "echasnovski/mini.align",
    keys = { "g", "v", "V", "C-v" },
    config = function()
      require("mini.align").setup {
        silent = true
      }
    end
  },
  {
    "numToStr/Comment.nvim",
    keys = { "g", "v", "V", "C-v" },
    config = function()
      require("Comment").setup()
    end
  },
  { "lambdalisue/suda.vim", cmd = { "SudaWrite", "SudaRead" } },
  {
    "liuchengxu/vista.vim",
    keys = "<Space>v",
    config = function()
      vim.keymap.set('n', '<Space>v', ':Vista!!<CR>', { silent = true })
    end
  },
  {
    "voldikss/vim-floaterm",
    keys = "<C-g>",
    config = function()
      vim.g.floaterm_opener = "tabe"
      vim.g.floaterm_title = ""
      vim.g.floaterm_width = 0.77
      vim.g.floaterm_height = 0.90

      -- Open apps
      vim.keymap.set('n', '<C-g><CR>', ':FloatermNew zsh<CR>', { silent = true })
      vim.keymap.set('n', '<C-g>p', ':FloatermToggle<CR>', { silent = true })
      vim.keymap.set('t', '<C-g>p', '<CMD>FloatermToggle<CR>', { silent = true })
      vim.keymap.set('n', '<C-g>l', ':FloatermNew lazygit<CR>', { silent = true })
      vim.keymap.set('n', '<C-g>r', ':FloatermNew ranger<CR>', { silent = true })
      vim.keymap.set('n', '<C-g>n', ':FloatermNew neomutt<CR>', { silent = true })
      vim.keymap.set('n', '<C-g>h', ':FloatermNew htop<CR>', { silent = true })
    end
  },
})
