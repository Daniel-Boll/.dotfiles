local M = {}

M.telescope = {
  n = {
    ["<leader>fp"] = { "<cmd>Telescope media_files <CR>", "  find media" },
  },
}

M.copilot = {
  i = {
    ["<C-j>"] = {
      'copilot#Accept("<CR>")',
      "ﮧ  copilot completion",
      opts = {
        silent = true,
        script = true,
        expr = true,
      },
    },
  },
}

M.general = {
  n = {
    ["<ESC>"] = { "<cmd> noh <CR>", "Remove Highlights" },
  },
}

M.shade = {
   n = {
      ["<leader>s"] = {
         function()
            require("shade").toggle()
         end,

         "   toggle shade.nvim",
      },
   },
}

-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true

return M
