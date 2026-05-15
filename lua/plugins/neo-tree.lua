-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    -- Add this global keymap to toggle the tree from anywhere!
    vim.keymap.set('n', '\\', '<cmd>Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })

    require('neo-tree').setup {
      window = {
        mappings = {
          -- You can actually leave this here, or delete it! The global toggle handles both.
          ['\\'] = 'close_window',
        },
      },
    }
  end,
}
