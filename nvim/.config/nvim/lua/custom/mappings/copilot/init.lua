local map = require("core.utils").map

map(
  "i",
  "<C-j>",
  'copilot#Accept("<CR>")',
  { silent = true, script = true, expr = true }
)
