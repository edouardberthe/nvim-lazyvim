-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.background = "dark"

vim.diagnostic.config({ virtual_lines = { current_line = true } })

-- Configuration intelligente du clipboard : OSC 52 seulement si SSH
local function setup_clipboard()
  -- Détection SSH
  local in_ssh = os.getenv("SSH_CONNECTION") ~= nil or os.getenv("SSH_CLIENT") ~= nil or os.getenv("SSH_TTY") ~= nil

  if in_ssh then
    -- En SSH : utiliser OSC 52
    vim.g.clipboard = {
      name = "OSC 52",
      copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
      },
      paste = {
        ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
        ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
      },
    }
  else
    -- En local : utiliser le clipboard système natif
    local is_mac = vim.fn.has("mac") == 1 or vim.fn.has("macunix") == 1

    if is_mac then
      vim.g.clipboard = {
        name = "macOS",
        copy = {
          ["+"] = "pbcopy",
          ["*"] = "pbcopy",
        },
        paste = {
          ["+"] = "pbpaste",
          ["*"] = "pbpaste",
        },
        cache_enabled = 0,
      }
    else
      -- Linux : essayer xclip, wl-copy, etc.
      if vim.fn.executable("xclip") == 1 then
        vim.g.clipboard = {
          name = "xclip",
          copy = {
            ["+"] = "xclip -selection clipboard",
            ["*"] = "xclip -selection primary",
          },
          paste = {
            ["+"] = "xclip -selection clipboard -o",
            ["*"] = "xclip -selection primary -o",
          },
          cache_enabled = 0,
        }
      elseif vim.fn.executable("wl-copy") == 1 then
        vim.g.clipboard = {
          name = "wl-clipboard",
          copy = {
            ["+"] = "wl-copy",
            ["*"] = "wl-copy --primary",
          },
          paste = {
            ["+"] = "wl-paste --no-newline",
            ["*"] = "wl-paste --no-newline --primary",
          },
          cache_enabled = 0,
        }
      end
    end
  end
end

setup_clipboard()

vim.opt.clipboard = "unnamedplus"
