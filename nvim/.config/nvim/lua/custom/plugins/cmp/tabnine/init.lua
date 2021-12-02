local hooks = require("core.hooks")

hooks.add("install_plugins", function(use)
  use({
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    after = "nvim-cmp",
    requires = "hrsh7th/nvim-cmp",
  })
end)
