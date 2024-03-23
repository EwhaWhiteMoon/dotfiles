local wezterm = require("wezterm")
local background = require("background")

return {
    font = wezterm.font_with_fallback({'FantasqueSansM Nerd Font', 'D2Coding'}),
    font_size = 18.0,
    color_scheme = "Catppuccin Latte",
    background = background,
}
