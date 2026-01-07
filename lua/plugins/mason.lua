return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- C/C++ language server
      "clangd",

      -- Python linting and formatting
      "ruff",
      "ty",

      -- Rust language server (also handled by rustaceanvim)
      "rust-analyzer",

      -- SQL formatting and linting
      "sqruff",

      -- LaTeX language server
      "texlab",
    },
  },
}
