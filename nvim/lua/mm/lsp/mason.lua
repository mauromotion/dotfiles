local servers = {
	"lua_ls",
	"cssls",
	"html",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
  "emmet_ls",
***REMOVED***

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		***REMOVED***,
	***REMOVED***,
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
***REMOVED***

require("mason").setup(settings)
require("mason-lspcon***REMOVED***g").setup({
	ensure_installed = servers,
	automatic_installation = true,
***REMOVED***)

local lspcon***REMOVED***g_status_ok, lspcon***REMOVED***g = pcall(require, "lspcon***REMOVED***g")
if not lspcon***REMOVED***g_status_ok then
	return
end

local opts = {***REMOVED***

for _, server in pairs(servers) do
	opts = {
		on_attach = require("mm.lsp.handlers").on_attach,
		capabilities = require("mm.lsp.handlers").capabilities,
	***REMOVED***

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "mm.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

	lspcon***REMOVED***g[server].setup(opts)
end
