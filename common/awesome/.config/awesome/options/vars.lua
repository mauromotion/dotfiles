local _M = {
	modkey = "Mod4",
	terminal = os.getenv("TERMINAL") or "wezterm",
	editor = os.getenv("EDITOR") or "vim",
	browser = "firefox",
	filebrowser = "thunar",
	-- Available themes are: catppuccin, tokyonight, poimandres
	theme = "poimandres",
}

_M.editor_cmd = _M.terminal .. " -e " .. _M.editor
_M.manual_cmd = _M.terminal .. " -e man awesome"

return _M
