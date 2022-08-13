vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 12

vim.g.guifont = "Iosevka Nerd Font:h12"
vim.o.guifont = "Iosevka Nerd Font"
vim.g.neovide_refresh_rate = 140

vim.cmd [[
  au FileType dap-repl lua require('dap.ext.autocompl').attach()
]]
