--- @diagnostic disable-next-line: missing-fields
require("tokyonight").setup({
    style = "night",
    transparent = false,
    terminal_colors = true,
})

vim.cmd.colorscheme("tokyonight")
