vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
      local cmd = vim.fn.has('win32') == 1
        and { 'cmd', '/c', 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
        or { 'make' }
      vim.system(cmd, { cwd = ev.data.path }):wait()
    end
  end,
})

-- all of the git clone sources are here
vim.pack.add({
    { src = 'https://github.com/junegunn/vim-easy-align' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },

    -- telescope
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },
    { src = 'https://github.com/nvim-telescope/telescope.nvim', version = vim.version.range('*')} ,

    -- LSP and programming --
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
    { src = 'https://github.com/folke/lazydev.nvim' },
    { src = 'https://github.com/saghen/blink.lib' },
    { src = 'https://github.com/saghen/blink.cmp' },
    { src = 'https://github.com/rafamadriz/friendly-snippets' },

    -- Formatting
    { src = 'https://github.com/stevearc/conform.nvim' },

    -- git signs
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },

    -- JSX/TSX auto-close and rename tags
    { src = 'https://github.com/windwp/nvim-ts-autotag' },

    -- rust: Cargo.toml dependency versions
    { src = 'https://github.com/saecki/crates.nvim' },

    -- motions
    { src = 'https://github.com/nvim-mini/mini.nvim' },

    -- themes
    { src= 'https://github.com/folke/tokyonight.nvim.git' },

    -- mason installs the necessary language servers for LSP
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
})

-- terminal
vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

-- mini modules (i still dont know in which file to put these)
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.statusline').setup()
require('mini.icons').setup()

-- vim-easy-align (remap = true is required for <Plug> mappings)
vim.keymap.set({ "n", "x" }, "ga", "<Plug>(EasyAlign)", { remap = true, desc = "EasyAlign" })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
            if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end
    end,
})

require('lsp')
require('navigation')
require('nvim_opts')
require('remaps')
require('themes')
