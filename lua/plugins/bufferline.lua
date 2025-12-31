return {
  "akinsho/bufferline.nvim",
  keys = {
    -- These overrides allows to jump several buffers in once settings
    -- e.g. `3L` ('jump 3 buffers to the right')
    {
      "L",
      function()
        vim.cmd("bnext " .. vim.v.count1)
      end,
      desc = "Next buffer",
    },
    {
      "H",
      function()
        vim.cmd("bprev " .. vim.v.count1)
      end,
      desc = "Previous buffer",
    },
  },
}
