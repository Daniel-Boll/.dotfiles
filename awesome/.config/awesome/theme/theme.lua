local hcolor = require("utils.color")

---@class Theme
local theme = {}

-- Tomorrow Night (https://github.com/chriskempson/tomorrow-theme)
theme.palette = setmetatable({
    black          = "#1d1f21",
    white          = "#c5c8c6",
    red            = "#cc6666",
    orange         = "#de935f",
    yellow         = "#f0c674",
    green          = "#7cb36b", -- original: #b5bd68
    cyan           = "#78bab9", -- original: #8abeb7
    blue           = "#81a2be",
    magenta        = "#b294bb",
    gray           = "#767876",
    --
    black_bright   = "#3c4044",
    white_bright   = "#eaeaea",
    red_bright     = "#d54e53",
    orange_bright  = "#e78c45",
    yellow_bright  = "#e7c547",
    green_bright   = "#71c464", -- original: #b9ca4a
    cyan_bright    = "#6acdcc", -- original: #70c0b1
    blue_bright    = "#7aa6da",
    magenta_bright = "#c397d8",
    gray_bright    = "#a7aaa8",
}, hcolor.palette_metatable)

theme.color_names = {
    palette = {
        "black",
        "white",
        "red",
        "orange",
        "yellow",
        "green",
        "cyan",
        "blue",
        "magenta",
        "gray",
    },
    common = {
        bg        = "black",
        fg        = "white",
        primary   = "blue",
        secondary = "yellow",
        urgent    = "red",
    },
}

theme.common = setmetatable({}, hcolor.palette_metatable)
for k, v in pairs(theme.color_names.common) do
    theme.common[k] = theme.palette[v]
    theme.common[k .. "_bright"] = theme.palette[v .. "_bright"]
end

theme.screen_selection_color = hcolor.change(theme.common.primary, { alpha = 0.20 --[[ 0x33 ]] })

return theme
