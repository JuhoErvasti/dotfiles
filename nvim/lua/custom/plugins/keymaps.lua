-- CTRL+s save
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<F4>', ':ClangdSwitchSourceHeader<CR>', { noremap = true , silent = true })

-- Jump to next/previous diagnostics message
vim.api.nvim_set_keymap('n', 'Å', '[d', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'å', ']d', { noremap = false, silent = true })

-- C++ specific: Clean up copied out-of-line function definition to fit into a header.
vim.api.nvim_set_keymap('n', 'rep', '01W2diw>>$a;<ESC>', { noremap = true, silent = true })
-- C++ specific: Clean up inline function prototype to fit out-of-line.
vim.api.nvim_set_keymap('n', 'rer', '0<<$xo{<CR>}<ESC>', { noremap = true, silent = true })

-- Telescope stuff
vim.api.nvim_set_keymap('n', '<leader>ff', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':lua require"telescope.builtin".live_grep({ hidden = true })<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':lua require"telescope.builtin".buffers({ hidden = true })<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':lua require"telescope.builtin".help_tags({ hidden = true })<CR>', { noremap = true, silent = true })

-- tmux navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { noremap = true, silent = true })

-- Recenter view on cursor when navigating vertically
vim.api.nvim_set_keymap('n', 'k', 'kzz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'jzz', { noremap = true, silent = true })

-- Select all
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', { noremap = true, silent = true })

-- Conflicts with tmux keymap, also it's somewhat easy to misclick and used to open help in that case
vim.api.nvim_set_keymap('n', '<F1>', '<nop>', { noremap = true, silent = true })

-- Move line(s) up/down
vim.api.nvim_set_keymap('n', '<C-A-k>', ':m -2 <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-j>', ':m +1 <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-A-k>', ':m-2<CR>gv=gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-A-j>', ":m'>+<CR>gv=gv", { noremap = true, silent = true })

-- Paste and replace word
vim.api.nvim_set_keymap('n', 'Ö', 'viwP', { noremap = true, silent = true})

-- Toggle transparency
vim.api.nvim_set_keymap('n', '<A-t>', ':TransparentToggle <CR>', { noremap = true, silent = true })

-- Copy absolute path to current buffer file into the clipboard
vim.api.nvim_set_keymap('n', '<leader>fc', ':CopyBufferPath <CR>', { noremap = true, silent = true})

-- C++-specific: copy a gdb command to create a breakpoint in the current buffer file on the line the cursor is on to the clipboard
-- i.e. break <absolute_path_to_file>:<line_number>
vim.api.nvim_set_keymap('n', '<leader>b', ':CopyGDBBreakPoint <CR>', { noremap = true, silent = true})

-- Resize window
vim.api.nvim_set_keymap('n', '+', '5<C-w>>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '-', '5<C-w><', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-+>', '15<C-w>>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<A-->', '15<C-w><', { noremap = true, silent = true})

-- luasnip: navigate snippet placeholder values

local ls = require "luasnip"

vim.keymap.set({ "i", "s" }, "<C-l>", function ()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end

end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-h>", function ()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end

end, { silent = true })

return {}
