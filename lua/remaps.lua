-- yank/paste
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("x", ".", ":normal .<CR>", { noremap = true, silent = true })

-- quickix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- <C-Del> mimics regular ctrl + del deletion
vim.keymap.set('i', '<C-Del>', '<C-o>dw')

-- terminal
-- Leave terminal mode with a double Esc (a single Esc is passed to the program)
vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n>]])

vim.keymap.set('n', '<leader>tt', function()
    vim.cmd('botright 5split | terminal')
    vim.cmd.startinsert()
end, { desc = 'Open terminal' })

-- move command (similar to vs code alt)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append line below with J keeps cursos in place
vim.keymap.set("n", "J", "mzJ`z")

-- ctrl d and ctrl u (half page jumping) keeps cursor in place
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- searching terms keeps cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- <leader> s starts a file replace with the word youre currently on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- easy source and execute of commands
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

----- BreadOnPenguins mappings -----
-- buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")
vim.keymap.set("n", "<leader>q", ":BufferClose<CR>")
vim.keymap.set("n", "<leader>Q", ":BufferClose!<CR>")
vim.keymap.set("n", "<leader>U", "::bufdo bd<CR>") --close all
vim.keymap.set('n', '<leader>vs', ':vsplit<CR>:bnext<CR>') --ver split + open next buffer

-- buffer position nav + reorder
vim.keymap.set('n', '<AS-h>', '<Cmd>BufferMovePrevious<CR>')
vim.keymap.set('n', '<AS-l>', '<Cmd>BufferMoveNext<CR>')
vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>')
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>')

-- windows - ctrl nav, fn resize
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<F5>", ":resize +2<CR>")
vim.keymap.set("n", "<F6>", ":resize -2<CR>")
vim.keymap.set("n", "<F7>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<F8>", ":vertical resize -2<CR>")
