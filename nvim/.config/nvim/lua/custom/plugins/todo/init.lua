local hooks = require("core.hooks")

hooks.add("install_plugins", function(use)
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      -- require("custom.plugins.todo.conf").setup()
      require("todo-comments").setup({})
    end,
  })
end)
