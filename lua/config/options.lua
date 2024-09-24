-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Save undo history
vim.opt.undofile = false

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = "unnamedplus"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = true

-- increase brightness
vim.g.lazyvim_brightness = 10
