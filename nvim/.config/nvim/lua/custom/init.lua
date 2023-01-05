vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 12

vim.g.guifont = "Iosevka Nerd Font:h12"
vim.o.guifont = "Iosevka Nerd Font"
vim.g.neovide_refresh_rate = 140

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

vim.g.luasnippets_path = "./snippets"

local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.pile" },
  callback = function()
    vim.cmd [[
      set filetype=pile
    ]]
  end,
})

vim.cmd [[imap <silent><script><expr> <C-j> copilot#Accept("\<C-k>")]]
