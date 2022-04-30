local ok, wilder = pcall(require, "wilder-ls")

if not ok then
  return
end

local M = {}

M.setup = function()
  wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer({
      highlighter = wilder.basic_highlighter(),
      left = { " ", wilder.popupmenu_devicons() },
      right = { " ", wilder.popupmenu_scrollbar() },
    })
  )
end

return M
