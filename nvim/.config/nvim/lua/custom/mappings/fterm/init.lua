local hooks = require("core.hooks")

local opts = { noremap = true, silent = true }

hooks.add("setup_mappings", function(map)
  -- Toggle terminal
  map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
  map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

  -- Git commit and sign
  map(
    "n",
    "<A-c>",
    '<CMD>lua require("FTerm").scratch({ cmd = "git status; cz commit && sign-commit" })<CR>',
    opts
  )

  -- Git add, commit and sign
  map(
    "n",
    "<A-a>",
    '<CMD>lua require("FTerm").scratch({ cmd = "git add .; git status; cz commit && sign-commit" })<CR>',
    opts
  )

  -- Git push to specific branch
  map(
    "n",
    "<A-p>",
    '<CMD>lua require("FTerm").scratch({ cmd = "gitPushChooser" })<CR>',
    opts
  )
end)
