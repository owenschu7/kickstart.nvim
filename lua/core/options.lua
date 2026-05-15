-- ==========================================
--  Global Variables (Leaders and Nerd Font)
-- ==========================================
-- NOTE: It's important these stay at the top before plugins load

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
vim.opt.shell = '/bin/sh'

-- ==========================================
--  Custom Settings
-- ==========================================
-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
-- vim.o.relativenumber = true (this can be used to help with jumping)

-- Folding
-- Automatically save and load folds
vim.opt.viewoptions:remove 'options'
vim.opt.foldmethod = 'indent'
vim.opt.foldcolumn = '1'
vim.opt.foldenable = true -- Ensures folding is still allowed
vim.opt.foldlevel = 99 -- Keeps all folds open in the current window
vim.opt.foldlevelstart = 99 -- Tells Neovim to start with all folds open when

-- ==========================================
-- 3. Standard Kickstart Editor Options
-- ==========================================
-- Make line numbers default
vim.o.number = true
-- enable mouse mode
vim.o.mouse = 'a'
-- Don't show the mode, since it's already in the status line
vim.o.showmode = false
-- copy goes to clipboard
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 300
-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true
-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'
-- Show which line your cursor is on
vim.o.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10
-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true
