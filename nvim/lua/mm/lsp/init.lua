local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "mm.lsp.mason"
require("mm.lsp.handlers").setup()
-- require "mm.lsp.null-ls"

