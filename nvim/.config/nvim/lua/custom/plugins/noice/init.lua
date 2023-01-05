-- config.notify.enabled = false

local present, noice = pcall(require, "noice")
if not present then
  return
end

local M = {}

M.setup = function()
  noice.setup {
    notify = {
      enabled = false,
    },
  }
end

return M
