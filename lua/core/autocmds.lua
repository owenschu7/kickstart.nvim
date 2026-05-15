-- ==========================================
-- 1. Your Custom Autocommands
-- ==========================================
-- Automatically save and load folds
vim.cmd [[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
  augroup END
]]

-- ==========================================
-- 2. Standard Kickstart Autocommands
-- ==========================================
--  See `:help lua-guide-autocommands`
-- Highlight when yanking (copying) text
-- Try it with yap in normal mode
-- See :help vim.hl.on_yank()
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
