local customPlugins = require("core.customPlugins")

customPlugins.add(function(use)
  use({
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  })
end)
