-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- for file icons
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          -- Map 't' to open a terminal in the selected directory
          ['t'] = function(state)
            local node = state.tree:get_node()
            local path = node.type == 'directory' and node:get_id() or node:get_parent_id()

            vim.cmd 'botright split'
            vim.cmd('lcd ' .. path)
            vim.cmd 'terminal'
            vim.cmd 'startinsert'
          end,
        },
      },
    }
  end,
}
