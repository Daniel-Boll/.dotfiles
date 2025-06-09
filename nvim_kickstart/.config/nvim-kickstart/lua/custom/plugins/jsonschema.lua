return {
  {
    'b0o/schemastore.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('lspconfig').jsonls.setup {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      }
    end,
  },
}
