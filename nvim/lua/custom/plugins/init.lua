-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

local vim = vim
local Plug = vim.fn['plug#']

-- Plugins
vim.call('plug#begin')

Plug('lewis6991/gitsigns.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('christoomey/vim-tmux-navigator')
Plug('xiyaowong/transparent.nvim')
Plug('L3MON4D3/LuaSnip', { ['tag'] = 'v2.3.0', ['do'] = 'make install_jsregexp'} )
Plug('rafamadriz/friendly-snippets')

vim.call('plug#end')

-- Load some snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- 2 width tabs
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable lsp logging, log files grow very large
vim.lsp.set_log_level("off")

-- Stop text wrapping
vim.o.wrap = false

-- Custom commands for copying stuff to clipboard
vim.api.nvim_create_user_command('CopyBufferPath', ":let @+ = expand('%:p')", {})
vim.api.nvim_create_user_command('CopyGDBBreakPoint', ":let @+ = 'break ' .. expand('%:p') .. ':' .. line('.')", {})

return {}
