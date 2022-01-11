local customPlugins = require("core.customPlugins")

customPlugins.add(function(use)
  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      -- require("custom.plugins.todo.conf").setup()
      require("todo-comments").setup({})
    end,
  })
end)
