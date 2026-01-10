return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "rust",
      "lua",
      "vim",
      "python",
      "html",
      "css",
      "latex",
    },
  },
}
