local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Tokyo Night (matches tokyonight.nvim "night" style)
config.color_scheme = 'tokyonight_night'

-- Nerd Font
config.font = wezterm.font_with_fallback {
  'JetBrainsMono Nerd Font',
  'JetBrains Mono',
}
config.font_size = 12.0

-- Transparency
config.window_background_opacity = 0.92
config.text_background_opacity = 1.0

-- Quality of life
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = 'RESIZE'
config.window_padding = { left = 8, right = 8, top = 4, bottom = 4 }
config.scrollback_lines = 10000

-- Keybindings
config.keys = {
  { key = 'F11', action = wezterm.action.ToggleFullScreen },
}

return config
