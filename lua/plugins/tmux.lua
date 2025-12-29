return {
  -- "aserowy/tmux.nvim",
  -- lazy = false,
  -- opts = {
  --   copy_sync = {
  --     redirect_to_clipboard = true,
  --   },
  -- },
  "alexghergh/nvim-tmux-navigation",
  opts = {},
  lazy = false,
  keys = {
    {
      "<C-h>",
      "<cmd>NvimTmuxNavigateLeft<cr>",
      desc = "Tmux navigate to left pane",
    },
    {
      "<C-j>",
      "<cmd>NvimTmuxNavigateDown<cr>",
      desc = "Tmux navigate to bottom pane",
    },
    {
      "<C-k>",
      "<cmd>NvimTmuxNavigateUp<cr>",
      desc = "Tmux navigate to left pane",
    },
    {
      "<C-l>",
      "<cmd>NvimTmuxNavigateRight<cr>",
      desc = "Tmux navigate to right pane",
    },
  },
}
