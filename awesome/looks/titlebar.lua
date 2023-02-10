
-- module("anybox.titlebar", package.seeall)

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ ***REMOVED***, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true***REMOVED***)
            awful.mouse.client.move(c)
        end),
        awful.button({ ***REMOVED***, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true***REMOVED***)
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons,
            layout  = wibox.layout.***REMOVED***xed.horizontal
        ***REMOVED***,
        { -- Middle
            { -- Title
                align  = "center",
                widget = awful.titlebar.widget.titlewidget(c)
            ***REMOVED***,
            buttons = buttons,
            layout  = wibox.layout.flex.horizontal
        ***REMOVED***,
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.stickybutton   (c),
            awful.titlebar.widget.ontopbutton    (c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.***REMOVED***xed.horizontal()
        ***REMOVED***,
        layout = wibox.layout.align.horizontal
    ***REMOVED***
end)
