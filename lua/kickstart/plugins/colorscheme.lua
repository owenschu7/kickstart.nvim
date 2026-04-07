return {
  -- Add the Rosé Pine plugin
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false, -- Ensure it loads right away
    priority = 1000, -- Make sure it loads before everything else
    opts = {
      -- You can add custom configuration here later
      variant = 'auto', -- auto, main, moon, or dawn
      dark_variant = 'main',
      dim_inactive_windows = false,
      extend_background_behind_borders = true,
    },
  },

  -- Configure LazyVim to use the theme
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'rose-pine',
    },
  },
}
