require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive"
  },
  view = {
    width = 25,
    side = "left"
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true
      },
    },
  },
  filters = {
    dotfiles = true
  },
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = {
      enable = true
    },
  },
})
