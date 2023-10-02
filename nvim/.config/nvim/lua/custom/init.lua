local autocmd = vim.api.nvim_create_autocmd
local filetype = vim.filetype

filetype.add({
	extension = {
		mdx = "mdx",
	},
})

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})

-- show cursor line only in active window
autocmd({ "InsertLeave", "WinEnter" }, {
	callback = function()
		local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
		if ok and cl then
			vim.wo.cursorline = true
			vim.api.nvim_win_del_var(0, "auto-cursorline")
		end
	end,
})
autocmd({ "InsertEnter", "WinLeave" }, {
	callback = function()
		local cl = vim.wo.cursorline
		if cl then
			vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
			vim.wo.cursorline = false
		end
	end,
})

autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
	pattern = "Cargo.toml",
	callback = function()
		local cmp = require("cmp")
		cmp.setup.buffer({ sources = { { name = "crates" } } })
	end,
})

autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.pile" },
	callback = function()
		vim.cmd([[
      set filetype=pile
    ]])
	end,
})
