return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    servers = {
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
    },
  },
}
