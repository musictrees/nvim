require('telescope').setup({})
require('telescope').load_extension('fzf')

--- keymaps ---
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fd', builtin.find_files)

-- edit neovim files
vim.keymap.set('n', '<leader>en', function ()
    builtin.find_files {
        cwd = vim.fn.stdpath("config")
    }
end)

-- f search
vim.keymap.set('n', '<leader>fs', builtin.live_grep)

-- f buffers
vim.keymap.set('n', '<leader>fw', builtin.buffers)

-- f help
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
