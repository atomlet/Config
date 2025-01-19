local wezterm = require("wezterm")

wezterm.on("gui-startup", function(cmd)
  local screen = wezterm.gui.screens().active
  local ratio  = 0.7
  local width  = screen.width * ratio
  local height = screen.height * ratio

  local x = (screen.width - width) / 2
  local y = (screen.height - height) / 2

  local tab, pane, window = wezterm.mux.spawn_window {
    position = {
      x = x,
      y = y,
      origin = 'ActiveScreen'
    }
  }
  window:gui_window():set_inner_size(width, height)
end)

return {
  automatically_reload_config = true,
  
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  
  window_decorations = "RESIZE",
  window_background_opacity = 0.965,
  window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 5,
  },

  win32_system_backdrop = 'Acrylic',
  
  color_scheme = 'Dark+',
  
  font_size = 14,
  font = wezterm.font_with_fallback {
    'Monaspace Neon',
    'Maple Mono NF CN',
  },

  default_prog = { 'nu' }
}
