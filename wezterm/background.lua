local HOME = os.getenv("HOME")
local wezterm = require("wezterm")
local color = wezterm.color.get_builtin_schemes()["Catppuccin Latte"]

return {
    {
        source = {
            Color = color.background,
        },
        height = '100%',
        width = '100%',
    },
    {
        source = {
            File = HOME .. '/.config/wezterm/eleven.png',
        },
        repeat_x = 'NoRepeat',
        repeat_y = 'NoRepeat',
        horizontal_align = 'Right',
        opacity = 0.1,
        height = 'Contain',
        width = 'Contain',
    }
}
