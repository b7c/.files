return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
    vim.keymap.set('n', '<leader>t', ':NvimTreeFocus<enter>')
    vim.keymap.set('n', '<leader>T', ':NvimTreeToggle<enter>')
  end,
}
