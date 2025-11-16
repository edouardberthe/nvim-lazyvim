return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    servers = {
      -- Will be automatically installed with mason and loaded with lspconfig
      clangd = {},
      ruff = {},
      rust_analyzer = {},
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
              onSave = true, -- (optionnel) compile à chaque sauvegarde
            },
          },
        },
      },
      ty = {},
    },
  },
}
