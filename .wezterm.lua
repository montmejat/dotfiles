local wezterm = require 'wezterm'

-- Detect current system appearance
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

-- Choose color scheme based on appearance
function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Default Dark (base16)'
  else
    return 'Default Light (base16)'
  end
end

-- Sober tab bar colors
function tab_bar_colors(appearance)
  if appearance:find 'Dark' then
    return {
      tab_bar = {
        background = "#2e2e2e",
        active_tab = { bg_color = "#444444", fg_color = "#e0e0e0" },
        inactive_tab = { bg_color = "#2e2e2e", fg_color = "#a0a0a0" },
        inactive_tab_hover = { bg_color = "#3a3a3a", fg_color = "#c0c0c0", italic = false },
        new_tab = { bg_color = "#2e2e2e", fg_color = "#e0e0e0" },
        new_tab_hover = { bg_color = "#444444", fg_color = "#e0e0e0", italic = false },
      },
    }
  else
    return {
      tab_bar = {
        background = "#f0f0f0",
        active_tab = { bg_color = "#d0d0d0", fg_color = "#1e1e1e" },
        inactive_tab = { bg_color = "#f0f0f0", fg_color = "#606060" },
        inactive_tab_hover = { bg_color = "#e0e0e0", fg_color = "#303030", italic = false },
        new_tab = { bg_color = "#f0f0f0", fg_color = "#1e1e1e" },
        new_tab_hover = { bg_color = "#d0d0d0", fg_color = "#1e1e1e", italic = false },
      },
    }
  end
end

-- Build config
local config = wezterm.config_builder()

config.window_decorations = "RESIZE"
config.color_scheme = scheme_for_appearance(get_appearance())
config.colors = tab_bar_colors(get_appearance())
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 200
config.initial_cols = 130
config.initial_rows = 30

config.keys = {
  {
    key = 'H',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitPane { direction = 'Left' },
  },
  {
    key = 'L',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitPane { direction = 'Right' },
  },
  {
    key = 'J',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitPane { direction = 'Down' },
  },
  {
    key = 'K',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitPane { direction = 'Up' },
  },
  {
    key = 'H',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'L',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'K',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'J',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  }
}

return config

