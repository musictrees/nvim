-- disabling netrw for nvim-tree compatibility
-- has to be at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- setup for VScode usage
if vim.g.vscode then
  vim.pack.add({
    { src = 'https://github.com/junegunn/vim-easy-align' },
    { src = 'https://github.com/nvim-mini/mini.nvim' },
  })

  require('mini.surround').setup()
  require('mini.ai').setup()
  vim.keymap.set({ "n", "x" }, "ga", "<Plug>(EasyAlign)", { remap = true, desc = "EasyAlign" })

  vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
  })

  require('config.options')
  require('config.remaps')
  return
end

-- cache lua files for speed
vim.loader.enable()

-- builds fzf from source for better telescope performance
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
  -- UI
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/romgrk/barbar.nvim' },
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },

  -- telescope
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
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

  -- JSX/TSX auto-close and rename tags
  { src = 'https://github.com/windwp/nvim-ts-autotag' },

  -- rust: Cargo.toml dependency versions
  { src = 'https://github.com/saecki/crates.nvim' },

  -- utils
  { src = 'https://github.com/nvim-mini/mini.nvim' },
  { src = 'https://github.com/junegunn/vim-easy-align' },

  -- themes
  { src= 'https://github.com/folke/tokyonight.nvim.git' },

  -- mason installs the necessary language servers for LSP
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
})

require('config.autocmd')
require('config.lsp')
require('config.options')
require('config.remaps')
require('config.themes')

require('plugins.barbar')
require('plugins.blink')
require('plugins.mini')
require('plugins.nvim-tree')
require('plugins.telescope')
