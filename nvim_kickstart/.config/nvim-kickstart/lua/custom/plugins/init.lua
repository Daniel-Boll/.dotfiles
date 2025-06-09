-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    keys = {
      {
        '<leader>l',
        function()
          require('lsp_lines').toggle()
        end,
        desc = 'Toggle lsp_lines',
      },
    },
  },
}
