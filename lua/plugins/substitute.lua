return {
  "gbprod/substitute.nvim",
  lazy = false,
  opts = {},
  keys = {
    {
      "s",
      function()
        require("substitute").operator()
      end,
      desc = "Substitute",
    },
    {
      "s",
      function()
        require("substitute").visual()
      end,
      mode = "x",
      desc = "Substitute visual selection",
    },
    {
      "ss",
      function()
        require("substitute").line()
      end,
      desc = "Substitute",
    },
    {
      "S",
      function()
        require("substitute").eol()
      end,
      desc = "Substitute until EOL",
    },
  },
}
