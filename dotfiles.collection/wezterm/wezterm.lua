local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Basic settings
config.default_cursor_style = 'SteadyBar'
config.font = wezterm.font("JetBrains Mono Nerd Font", {weight="Light"})
config.font_size = 10.5
config.line_height = 1.2

-- Cursor settings
config.animation_fps = 120
config.cursor_blink_ease_in = 'EaseOut'
config.cursor_blink_ease_out = 'EaseOut'
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 650
config.hide_mouse_cursor_when_typing = false

-- UI Elements
config.enable_scroll_bar = true
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true
config.tab_max_width = 25
config.show_tab_index_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true

-- Window settings
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 90
config.window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
}
config.adjust_window_size_when_changing_font_size = false
config.window_close_confirmation = 'NeverPrompt'
config.window_frame = {
    active_titlebar_bg = '#090909',
}

-- Pane settings
config.inactive_pane_hsb = {
    saturation = 1,
    brightness = 1,
}

-- Visual bell settings
config.visual_bell = {
    fade_in_function = 'EaseIn',
    fade_in_duration_ms = 250,
    fade_out_function = 'EaseOut',
    fade_out_duration_ms = 250,
    target = 'CursorColor',
}

-- Color Scheme
config.color_scheme = 'OneDark (base16)'

-- Keybindings
config.keys = {
    { key = "T", mods = "CTRL|SHIFT", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
    { key = "w", mods = "CTRL|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
   }

config.default_prog = { '/bin/zsh' }

return config
