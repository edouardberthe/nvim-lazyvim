-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-open Neo-tree when starting Neovim without any files
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("NeotreeOnOpen", { clear = true }),
  once = true,
  callback = function(_)
    if vim.fn.argc() == 0 then
      vim.cmd("Neotree")
    end
  end,
})

-- Auto-remove unused imports on save for Rust files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  group = vim.api.nvim_create_augroup("RustRemoveUnusedImports", { clear = true }),
  callback = function()
    -- Check if rust-analyzer LSP client is attached
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
      if client.name == "rust_analyzer" then
        -- Execute the removeUnusedImports code action
        vim.lsp.buf.code_action({
          filter = function(action)
            return action.kind and string.match(action.kind, "source.removeUnusedImports")
          end,
          apply = true,
        })
        break
      end
    end
  end,
})
