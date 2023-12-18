local ls = require("luasnip")

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamic_n = ls.dynamic_node

-- React typed component
-- interface <ComponentName>Props {
--
-- }
--
-- export async function <ComponentName>({}: Props) {
--   return (
--     <div>
--       <h1>{ "ComponentName" }</h1>
--     </div>
--   );
-- }
-- local function react_typed_component()
--   local nodes = {
--     -- Get the ComponentName in the function name and reuse it everywhere
--     func({ trig = "typedrc" }, function(args)
--       local name = args[1][1]
--       return {
--         node("interface " .. name .. "Props {"),
--         node(""),
--         node("}"),
--         node(""),
--         node("export async function " .. name .. "({}: Props) {"),
--         node("  return ("),
--         node("    <div>"),
--         node('      <h1>{ "' .. name .. '" }</h1>'),
--         node("    </div>"),
--         node("  );"),
--         node("}"),
--       }
--     end, { insert(1) }),
--   }
--   return nodes
-- end
--
-- ls.add_snippets("all", {
--   snip("typedrc", react_typed_component()),
-- })
