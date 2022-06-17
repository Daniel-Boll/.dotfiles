local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "html",
    "css",
    "tsx",
    "javascript",
    "typescript",
    "json",
    "toml",
    "markdown",
    "c",
    "cpp",
    "bash",
    "lua",
    "norg",
    "java",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  extensions = {
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg", "pdf" },
    },
  },
}

return M
