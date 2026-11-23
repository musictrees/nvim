-- Enable syntax highlighting
vim.cmd("syntax on")

-- Better colors
vim.opt.termguicolors = true

-- Add line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Columns used for the line number
vim.opt.numberwidth = 4

-- Highlights the matched text pattern when searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Open splits intuitively
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Navigate buffers without losing unsaved work
vim.opt.hidden = true

-- Save undo history
vim.opt.undofile = true

-- Enable mouse support
vim.opt.mouse = "a"

-- Case insensitive search unless capital letters are used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Start scrolling when 8 lines from top or bottom
vim.opt.scrolloff = 8

-- nerd fonts
vim.g.have_nerd_font = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- render whitespace
vim.opt.list = true
vim.opt.listchars = {
  space = "·",
  tab = "»·",
  trail = "·",
  lead = "·",
  nbsp = "␣",
}

-- no line wrap -> leader W to toggle
vim.opt.wrap = false

-- vertical ruler
vim.opt.colorcolumn = "80"

----- BreadOnPenguins options ------
-- highlight cursor line
vim.opt.cursorline = true

-- faster and smoother scrolling
vim.opt.ttyfast = true
vim.opt.smoothscroll = true

-- window titlebar
vim.opt.title = true

