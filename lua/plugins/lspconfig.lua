return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    servers = {
      -- C/C++ language server
      clangd = {},

      -- Python linting and formatting
      ruff = {},

      -- Rust language server (also handled by rustaceanvim)
      rust_analyzer = {},

      -- SQL formatting and linting
      sqruff = {},

      -- LaTeX language server
      texlab = {
        settings = {
          texlab = {
            build = {
              executable = "tectonic",
              args = {
                "-X",
                "compile",
                "%f",
                "--synctex",
                "--keep-logs",
                "--keep-intermediates",
              },
              onSave = true, -- Auto-compile on save
            },
          },
        },
      },

      -- TypeScript type checker
      ty = {},
    },
  },
}
