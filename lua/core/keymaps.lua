-- ==========================================
-- 1. Your Custom Terminal Keymaps
-- ==========================================
-- creates a terminal on botton of screen using control t
-- Create variables to track the terminal buffer and window
local term_buf = nil
local term_win = nil

-- Smart Toggle: Press <C-t> to open, jump to, or leave the terminal
vim.keymap.set({ 'n', 't' }, '<C-t>', function()
  -- If we are already inside the terminal window, leave it open and jump back
  if term_win and vim.api.nvim_win_is_valid(term_win) and vim.api.nvim_get_current_win() == term_win then
    vim.cmd 'wincmd p'
    return
  end
  -- If the terminal window is open but we are in the text editor, jump back
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_set_current_win(term_win)
    vim.cmd 'startinsert'
    return
  end
  -- If the window is closed, create a new split
  vim.cmd 'botright 10split'
  term_win = vim.api.nvim_get_current_win()
  -- If the terminal process is still running in the background, reattach it
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.api.nvim_win_set_buf(term_win, term_buf)
  else
    -- Otherwise, start a brand new fish terminal
    vim.cmd 'terminal fish'
    term_buf = vim.api.nvim_get_current_buf()
  end
  vim.cmd 'startinsert'
end, { noremap = true, silent = true, desc = 'Toggle fish terminal' })

-- Close Command: Press <C-x> to completely kill the terminal from inside it
vim.keymap.set('t', '<C-x>', function()
  vim.cmd 'bd!' -- Force delete the buffer
end, { noremap = true, silent = true, desc = 'Close terminal completely' })

-- ==========================================
-- 2. Standard Kickstart Keymaps
-- ==========================================
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
