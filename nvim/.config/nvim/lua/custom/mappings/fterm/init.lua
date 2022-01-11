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
    '<CMD>lua require("FTerm").scratch({ cmd = "~/dev/scripts/git_push_helper.sh" })<CR>',
    opts
  )

  -- Run
  map(
    "n",
    "<F5>",
    '<CMD>lua require("FTerm").scratch({ cmd = "cat build.type | ./compile.sh" })<CR>',
    opts
  )

  -- Run
  map(
    "n",
    "<F9>",
    '<CMD>lua require("FTerm").scratch({ cmd = "(cat build.type | ./rebuild.sh) && lldb debug/SAHGA" })<CR>',
    opts
  )

  -- Run
  map(
    "n",
    "<F10>",
    '<CMD>lua require("FTerm").scratch({ cmd = "cat build.type | ./rebuild.sh" })<CR>',
    opts
  )
end)
