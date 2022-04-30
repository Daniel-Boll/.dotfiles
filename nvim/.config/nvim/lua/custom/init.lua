----------->>| VARIABLES |<<-----------

require("custom.variables.core")

----------->>| MAPPINGS |<<-----------

require("custom.mappings.dap")
require("custom.mappings.core")
require("custom.mappings.rest")
require("custom.mappings.fterm")
require("custom.mappings.copilot")
require("custom.mappings.nvimtree")
require("custom.mappings.telescope")

----------->>| COMMANDS |<<-----------
require("custom.commands")
require("custom.commands.plugins_related.wilder")

----------->>| INIT |<<-----------
require("custom.enable")
