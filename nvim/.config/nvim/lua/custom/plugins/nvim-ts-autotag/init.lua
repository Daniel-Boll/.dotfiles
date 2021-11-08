local hooks = require "core.hooks"

hooks.add("install_plugins", function(use)
   use {
      "windwp/nvim-ts-autotag",
      after = "nvim-treesitter",
      config = function()
         require("nvim-ts-autotag").setup()
      end,
   }
end)
