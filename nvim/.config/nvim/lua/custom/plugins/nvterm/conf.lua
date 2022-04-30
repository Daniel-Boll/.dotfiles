local ok, nvterm = pcall(require, "nvterm")

if not ok then
  return
end

nvterm.setup()

local terminal = nvterm.terminal

local M = {}
M.setup = function()
  local ft_cmds = {
    bash = "bash " .. vim.fn.expand("%"),
  }

  local mappings = {
    {
      "n",
      "<F5>",
      function()
        terminal.send(ft_cmds[vim.bo.filetype])
      end,
    },
    {
      "n",
      "<C-l>",
      function()
        terminal.send(ft_cmds[vim.bo.filetype])
      end,
    },
    {
      "n",
      "<Leader>s",
      function()
        terminal.new_or_toggle("horizontal")
      end,
    },
    {
      "n",
      "<Leader>v",
      function()
        terminal.new_or_toggle("vertical")
      end,
    },
  }

  local opts = { noremap = true, silent = true }
  for _, mapping in ipairs(mappings) do
    vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
  end
end

return M
