local keybindings = {}

local function load_keybindings(layout)
	if layout == "colemak-dh" then
		keybindings.global = require("bindings.global_colemak_dh.lua")
		keybindings.client = require("bindings.client_colemak_dh.lua")
	else -- default to QWERTY
		keybindings.global = require("bindings.global_qwerty.lua")
		keybindings.client = require("bindings.client_qwerty.lua")
	end

	keybindings.global_mouse = require("bindings.global_mouse")
	keybindings.client_mouse = require("bindings.client_mouse")
end

return {
	keybindings = keybindings,
	load_keybindings = load_keybindings,
}
