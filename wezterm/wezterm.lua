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

-- Ctrl+Click to open URLs
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.Nop,
  },
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, _pane)
      window:toast_notification('WezTerm', 'Ctrl+Click fired', nil, 3000)
    end),
  },
}

-- Keybindings
config.keys = {
  { key = 'F10', action = wezterm.action.ActivateCommandPalette },
  { key = 'F11', action = wezterm.action.ToggleFullScreen },
  {
    key = 'F12',
    action = wezterm.action_callback(function(window, _pane)
      if wezterm.GLOBAL.maximized then
        window:restore()
        wezterm.GLOBAL.maximized = false
      else
        window:maximize()
        wezterm.GLOBAL.maximized = true
      end
    end),
  },
}

return config
