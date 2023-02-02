local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
***REMOVED***
-- ***REMOVED***nd more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  ***REMOVED***,
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" ***REMOVED***),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" ***REMOVED***),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" ***REMOVED***),
    ["<C-y>"] = cmp.con***REMOVED***g.disable, -- Specify `cmp.con***REMOVED***g.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    ***REMOVED***,
    -- Accept currently selected item. If none selected, `select` ***REMOVED***rst item.
    -- Set `select` to `false` to only con***REMOVED***rm explicitly selected items.
    ["<CR>"] = cmp.mapping.con***REMOVED***rm { select = true ***REMOVED***,
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
  ***REMOVED***if luasnip.expandable() then
        luasnip.expand()
  ***REMOVED***if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
  ***REMOVED***if check_backspace() then
        fallback()
  ***REMOVED***
        fallback()
      end
    end, {
      "i",
      "s",
    ***REMOVED***),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
  ***REMOVED***if luasnip.jumpable(-1) then
        luasnip.jump(-1)
  ***REMOVED***
        fallback()
      end
    end, {
      "i",
      "s",
    ***REMOVED***),
  ***REMOVED***,
  formatting = {
***REMOVED***elds = { "kind", "abbr", "menu" ***REMOVED***,
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[NVIM_LUA]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      ***REMOVED***)[entry.source.name]
      return vim_item
    end,
  ***REMOVED***,
  sources = {
    { name = "nvim_lsp" ***REMOVED***,
    { name = "nvim_lua" ***REMOVED***,
    { name = "luasnip" ***REMOVED***,
    { name = "buffer" ***REMOVED***,
    { name = "path" ***REMOVED***,
  ***REMOVED***,
  con***REMOVED***rm_opts = {
    behavior = cmp.Con***REMOVED***rmBehavior.Replace,
    select = false,
  ***REMOVED***,
  window = {
    documentation = cmp.con***REMOVED***g.window.bordered()
  ***REMOVED***,
  experimental = {
    ghost_text = false,
    native_menu = false,
  ***REMOVED***,
***REMOVED***

