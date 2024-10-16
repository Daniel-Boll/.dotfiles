local match = string.match
local getenv = os.getenv


---@class Core.Path
---@field home string
---@field config string
---@field awesome string
---@field theme string
local M = {}

---@param path string
---@return string
function M.remove_trailing_slash(path)
    return match(path, "^(/?.-)/*$")
end

M.home = M.remove_trailing_slash(getenv("HOME") or "/home")
M.config = M.remove_trailing_slash(getenv("XDG_CONFIG_HOME") or (M.home .. "/.config"))

return M 
