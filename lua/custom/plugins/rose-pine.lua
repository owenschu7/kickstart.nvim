-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false, -- Load this immediately on startup
    priority = 1000, -- Load it before other plugins so the UI doesn't glitch
    opts = {
      -- Optional settings
      variant = 'auto',
      dark_variant = 'main',
      dim_inactive_windows = false,
      extend_background_behind_borders = true,
    },
    config = function(_, opts)
      -- Initialize the plugin with options
      require('rose-pine').setup(opts)

      -- Tell Neovim to actually use the colorscheme
      vim.cmd 'colorscheme rose-pine'
    end,
  },
}
