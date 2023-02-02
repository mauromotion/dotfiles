-- local lspcon***REMOVED***g = require('lspcon***REMOVED***g')
-- local con***REMOVED***gs = require('lspcon***REMOVED***g/con***REMOVED***gs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  settings = {
    -- on_attach = on_attach,
    capabilities = capabilities,
***REMOVED***letypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' ***REMOVED***,
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/con***REMOVED***g.ts#L79-L267
          ["bem.enabled"] = true,
        ***REMOVED***,
      ***REMOVED***,
    ***REMOVED***,
  ***REMOVED***,
***REMOVED***
