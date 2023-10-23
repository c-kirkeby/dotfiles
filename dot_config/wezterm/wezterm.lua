local wezterm = require "wezterm"
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

local function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Macchiato"
  else
    return "Catppuccin Latte"
  end
end

config = {
  color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
  window_background_opacity = 0.9,
  font_size = 9.0,
  use_fancy_tab_bar = false,
}
return config
