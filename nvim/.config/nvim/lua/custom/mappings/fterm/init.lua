local map = require("core.utils").map

-- Toggle terminal
map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Git commit and sign
map(
  "n",
  "<A-c>",
  '<CMD>lua require("FTerm").scratch({ cmd = "git status; cz commit && sign-commit" })<CR>'
)

-- Git add, commit and sign
map(
  "n",
  "<A-a>",
  '<CMD>lua require("FTerm").scratch({ cmd = "git add .; git status; cz commit && sign-commit" })<CR>'
)

-- Git push to specific branch
map(
  "n",
  "<A-p>",
  '<CMD>lua require("FTerm").scratch({ cmd = "~/dev/scripts/git_push_helper.sh" })<CR>'
)

-- Run
map(
  "n",
  "<F5>",
  '<CMD>lua require("FTerm").scratch({ cmd = "cat build.type | ./compile.sh" })<CR>'
)

-- Run
map(
  "n",
  "<F9>",
  '<CMD>lua require("FTerm").scratch({ cmd = "(cat build.type | ./rebuild.sh) && lldb debug/SAHGA" })<CR>'
)

-- Run
map(
  "n",
  "<F10>",
  '<CMD>lua require("FTerm").scratch({ cmd = "cat build.type | ./rebuild.sh" })<CR>'
)

