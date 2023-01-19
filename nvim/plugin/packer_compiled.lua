-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'***REMOVED***) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {***REMOVED***
_G._packer.inside_compile = true

local time
local pro***REMOVED***le_info
local should_pro***REMOVED***le = false
if should_pro***REMOVED***le then
  local hrtime = vim.loop.hrtime
  pro***REMOVED***le_info = {***REMOVED***
  time = function(chunk, start)
    if start then
      pro***REMOVED***le_info[chunk] = hrtime()
***REMOVED***
      pro***REMOVED***le_info[chunk] = (hrtime() - pro***REMOVED***le_info[chunk]) / 1e6
    end
  end
***REMOVED***
  time = function(chunk, start) end
end

local function save_pro***REMOVED***les(threshold)
  local sorted_times = {***REMOVED***
  for chunk_name, time_taken in pairs(pro***REMOVED***le_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken***REMOVED***
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {***REMOVED***
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.pro***REMOVED***le_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/mauromotion/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/mauromotion/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/mauromotion/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/mauromotion/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/mauromotion/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.***REMOVED***nd(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.***REMOVED***nd(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring de***REMOVED***nition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {***REMOVED***)
    end)
  end
  return result
end

time([[try_loadstring de***REMOVED***nition]], false)
time([[De***REMOVED***ning packer_plugins]], true)
_G.packer_plugins = {
  catppuccin = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  ***REMOVED***,
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  ***REMOVED***,
  ["darkplus.nvim"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/darkplus.nvim",
    url = "https://github.com/martinsione/darkplus.nvim"
  ***REMOVED***,
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  ***REMOVED***,
  ["everforest-nvim"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/everforest-nvim",
    url = "https://github.com/neanias/everforest-nvim"
  ***REMOVED***,
  gruvbox = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/gruvbox-community/gruvbox"
  ***REMOVED***,
  ["gruvbox-material.nvim"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/gruvbox-material.nvim",
    url = "https://github.com/wittyjudge/gruvbox-material.nvim"
  ***REMOVED***,
  ["live-server.nvim"] = {
    commands = { "LiveServer", "LiveServerStart", "LiveServerStop" ***REMOVED***,
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/opt/live-server.nvim",
    url = "https://github.com/aurum77/live-server.nvim"
  ***REMOVED***,
  ["lualine.nvim"] = {
    con***REMOVED***g = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23mm.plugins.lualine\frequire\0" ***REMOVED***,
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  ***REMOVED***,
  neovim = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/neovim",
    url = "https://github.com/rose-pine/neovim"
  ***REMOVED***,
  nerdtree = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/scrooloose/nerdtree"
  ***REMOVED***,
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  ***REMOVED***,
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  ***REMOVED***,
  ["nvim-autopairs"] = {
    con***REMOVED***g = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" ***REMOVED***,
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  ***REMOVED***,
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  ***REMOVED***,
  ["onedarkpro.nvim"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/onedarkpro.nvim",
    url = "https://github.com/olimorris/onedarkpro.nvim"
  ***REMOVED***,
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  ***REMOVED***,
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  ***REMOVED***,
  ["telescope-***REMOVED***le-browser.nvim"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/telescope-***REMOVED***le-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-***REMOVED***le-browser.nvim"
  ***REMOVED***,
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  ***REMOVED***,
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  ***REMOVED***,
  ["true-zen.nvim"] = {
    con***REMOVED***g = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtrue-zen\frequire\0" ***REMOVED***,
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/true-zen.nvim",
    url = "https://github.com/Pocco81/true-zen.nvim"
  ***REMOVED***,
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  ***REMOVED***,
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  ***REMOVED***,
  ["vim-surround"] = {
    loaded = true,
    path = "/home/mauromotion/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  ***REMOVED***
***REMOVED***

time([[De***REMOVED***ning packer_plugins]], false)
-- Con***REMOVED***g for: lualine.nvim
time([[Con***REMOVED***g for lualine.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23mm.plugins.lualine\frequire\0", "con***REMOVED***g", "lualine.nvim")
time([[Con***REMOVED***g for lualine.nvim]], false)
-- Con***REMOVED***g for: true-zen.nvim
time([[Con***REMOVED***g for true-zen.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtrue-zen\frequire\0", "con***REMOVED***g", "true-zen.nvim")
time([[Con***REMOVED***g for true-zen.nvim]], false)
-- Con***REMOVED***g for: nvim-autopairs
time([[Con***REMOVED***g for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "con***REMOVED***g", "nvim-autopairs")
time([[Con***REMOVED***g for nvim-autopairs]], false)

-- Command lazy-loads
time([[De***REMOVED***ning lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'LiveServerStart', function(cmdargs)
          require('packer.load')({'live-server.nvim'***REMOVED***, { cmd = 'LiveServerStart', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods ***REMOVED***, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'live-server.nvim'***REMOVED***, {***REMOVED***, _G.packer_plugins)
          return vim.fn.getcompletion('LiveServerStart ', 'cmdline')
      end***REMOVED***)
pcall(vim.api.nvim_create_user_command, 'LiveServerStop', function(cmdargs)
          require('packer.load')({'live-server.nvim'***REMOVED***, { cmd = 'LiveServerStop', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods ***REMOVED***, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'live-server.nvim'***REMOVED***, {***REMOVED***, _G.packer_plugins)
          return vim.fn.getcompletion('LiveServerStop ', 'cmdline')
      end***REMOVED***)
pcall(vim.api.nvim_create_user_command, 'LiveServer', function(cmdargs)
          require('packer.load')({'live-server.nvim'***REMOVED***, { cmd = 'LiveServer', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods ***REMOVED***, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'live-server.nvim'***REMOVED***, {***REMOVED***, _G.packer_plugins)
          return vim.fn.getcompletion('LiveServer ', 'cmdline')
      end***REMOVED***)
time([[De***REMOVED***ning lazy-load commands]], false)


_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_pro***REMOVED***le then save_pro***REMOVED***les() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your con***REMOVED***g for correctness" | echohl None')
end
