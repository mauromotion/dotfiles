-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Noti***REMOVED***cation library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Load Debian menu entries
local debian = require("debian.menu")
local has_fdo, freedesktop = pcall(require, "freedesktop")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another con***REMOVED***g (This code will only ever execute for the fallback con***REMOVED***g)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.con***REMOVED***g.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors ***REMOVED***)
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.con***REMOVED***g.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) ***REMOVED***)
        in_error = false
    end)
end
-- ***REMOVED******REMOVED******REMOVED***

-- {{{ Variable de***REMOVED***nitions
-- Themes de***REMOVED***ne colours, icons, font and wallpapers.
beautiful.init("/home/mauromotion/.con***REMOVED***g/awesome/default/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modi***REMOVED***er like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magni***REMOVED***er,
    awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
***REMOVED***
-- ***REMOVED******REMOVED******REMOVED***

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
   { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end ***REMOVED***,
   { "manual", terminal .. " -e man awesome" ***REMOVED***,
   { "edit con***REMOVED***g", editor_cmd .. " " .. awesome.conf***REMOVED***le ***REMOVED***,
   { "restart", awesome.restart ***REMOVED***,
   { "quit", function() awesome.quit() end ***REMOVED***,
***REMOVED***

local menu_awesome = { "awesome", myawesomemenu, beautiful.awesome_icon ***REMOVED***
local menu_terminal = { "open terminal", terminal ***REMOVED***

if has_fdo then
    mymainmenu = freedesktop.menu.build({
        before = { menu_awesome ***REMOVED***,
        after =  { menu_terminal ***REMOVED***
    ***REMOVED***)
***REMOVED***
    mymainmenu = awful.menu({
        items = {
                  menu_awesome,
                  { "Debian", debian.menu.Debian_menu.Debian ***REMOVED***,
                  menu_terminal,
                ***REMOVED***
    ***REMOVED***)
end


mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu ***REMOVED***)

-- Menubar con***REMOVED***guration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- ***REMOVED******REMOVED******REMOVED***

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ ***REMOVED***, 1, function(t) t:view_only() end),
                    awful.button({ modkey ***REMOVED***, 1, function(t)
                                              if client.focus then
                                                  client.focus:move_to_tag(t)
                                              end
                                          end),
                    awful.button({ ***REMOVED***, 3, awful.tag.viewtoggle),
                    awful.button({ modkey ***REMOVED***, 3, function(t)
                                              if client.focus then
                                                  client.focus:toggle_tag(t)
                                              end
                                          end),
                    awful.button({ ***REMOVED***, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ ***REMOVED***, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ ***REMOVED***, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                          ***REMOVED***
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true***REMOVED***
                                                  )
                                              end
                                          end),
                     awful.button({ ***REMOVED***, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 ***REMOVED*** ***REMOVED***)
                                          end),
                     awful.button({ ***REMOVED***, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ ***REMOVED***, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    local names = { "󰋜  Main", "󰇮  Mail", "  Dev", "  Read", "   Play", "󰍺  Ext", "7", "8", "9" ***REMOVED***
local l = awful.layout.suit  -- Just to save some typing: use an alias.
local layouts = { l.tile.left, l.max, l.fair, l.fair, l.floating,
    l.fair, l.tile.left, l.tile.left, l.tile.left ***REMOVED***
awful.tag(names, s, layouts)
    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ ***REMOVED***, 1, function () awful.layout.inc( 1) end),
                           awful.button({ ***REMOVED***, 3, function () awful.layout.inc(-1) end),
                           awful.button({ ***REMOVED***, 4, function () awful.layout.inc( 1) end),
                           awful.button({ ***REMOVED***, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
    ***REMOVED***lter  = awful.widget.taglist.***REMOVED***lter.all,
        buttons = taglist_buttons
    ***REMOVED***

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
    ***REMOVED***lter  = awful.widget.tasklist.***REMOVED***lter.currenttags,
        buttons = tasklist_buttons
    ***REMOVED***

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s ***REMOVED***)

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.***REMOVED***xed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
        ***REMOVED***,
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.***REMOVED***xed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        ***REMOVED***,
    ***REMOVED***
end)
-- ***REMOVED******REMOVED******REMOVED***

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    awful.button({ ***REMOVED***, 3, function () mymainmenu:toggle() end),
    awful.button({ ***REMOVED***, 4, awful.tag.viewnext),
    awful.button({ ***REMOVED***, 5, awful.tag.viewprev)
))
-- ***REMOVED******REMOVED******REMOVED***

-- {{{ Key bindings
globalkeys = gears.table.join(
    awful.key({ modkey,           ***REMOVED***, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"***REMOVED***),

    awful.key({ modkey,           ***REMOVED***, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"***REMOVED***
    ),
    awful.key({ modkey,           ***REMOVED***, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"***REMOVED***
    ),
    awful.key({ modkey,           ***REMOVED***, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"***REMOVED***),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   ***REMOVED***, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"***REMOVED***),
    awful.key({ modkey, "Shift"   ***REMOVED***, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"***REMOVED***),
    awful.key({ modkey, "Control" ***REMOVED***, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"***REMOVED***),
    awful.key({ modkey, "Control" ***REMOVED***, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "go back", group = "client"***REMOVED***),

    -- Standard program
    awful.key({ modkey,           ***REMOVED***, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"***REMOVED***),
    awful.key({ modkey, "Control" ***REMOVED***, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"***REMOVED***),
    awful.key({ modkey, "Shift"   ***REMOVED***, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"***REMOVED***),

    awful.key({ modkey,           ***REMOVED***, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"***REMOVED***),
    awful.key({ modkey, "Shift"   ***REMOVED***, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"***REMOVED***),
    awful.key({ modkey, "Shift"   ***REMOVED***, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"***REMOVED***),
    awful.key({ modkey, "Control" ***REMOVED***, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"***REMOVED***),
    awful.key({ modkey, "Control" ***REMOVED***, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"***REMOVED***),
    awful.key({ modkey, "Shift"   ***REMOVED***, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"***REMOVED***),

    awful.key({ modkey, "Control" ***REMOVED***, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true***REMOVED***
                    )
                  end
              end,
              {description = "restore minimized", group = "client"***REMOVED***),

    -- Prompt
    awful.key({ modkey ***REMOVED***,            "r",     function () awful.util.spawn("ro***REMOVED*** -show drun") end,
              {description = "run prompt", group = "launcher"***REMOVED***),

    awful.key({ modkey ***REMOVED***, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  ***REMOVED***
              end,
              {description = "lua execute prompt", group = "awesome"***REMOVED***),
    -- Menubar
    awful.key({ modkey ***REMOVED***, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"***REMOVED***)
)

clientkeys = gears.table.join(
    awful.key({ modkey,           ***REMOVED***, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"***REMOVED***),
    awful.key({ modkey, "Shift"   ***REMOVED***, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"***REMOVED***),
    awful.key({ modkey, "Control" ***REMOVED***, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"***REMOVED***),
    awful.key({ modkey, "Control" ***REMOVED***, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"***REMOVED***),
    awful.key({ modkey,           ***REMOVED***, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"***REMOVED***),
    awful.key({ modkey, "Control" ***REMOVED***, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"***REMOVED***),
    awful.key({ modkey, "Shift"   ***REMOVED***, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"***REMOVED***)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey ***REMOVED***, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"***REMOVED***),
        -- Toggle tag display.
        awful.key({ modkey, "Control" ***REMOVED***, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"***REMOVED***),
        -- Move client to tag.
        awful.key({ modkey, "Shift" ***REMOVED***, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"***REMOVED***),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" ***REMOVED***, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"***REMOVED***)
    )
end

clientbuttons = gears.table.join(
    awful.button({ ***REMOVED***, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true***REMOVED***)
    end),
    awful.button({ modkey ***REMOVED***, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true***REMOVED***)
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey ***REMOVED***, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true***REMOVED***)
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- ***REMOVED******REMOVED******REMOVED***

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { ***REMOVED***,
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.***REMOVED***lter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     ***REMOVED***
    ***REMOVED***,

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        ***REMOVED***,
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a ***REMOVED***xed window size to avoid ***REMOVED***ngerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"***REMOVED***,

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match de***REMOVED***ned rules here.
        name = {
          "Event Tester",  -- xev.
        ***REMOVED***,
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "Con***REMOVED***gManager",  -- Thunderbird's about:con***REMOVED***g.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        ***REMOVED***
      ***REMOVED***, properties = { floating = true ***REMOVED******REMOVED***,

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" ***REMOVED***
      ***REMOVED***, properties = { titlebars_enabled = false ***REMOVED***
    ***REMOVED***,

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" ***REMOVED***,
    --   properties = { screen = 1, tag = "2" ***REMOVED*** ***REMOVED***,
***REMOVED***
-- ***REMOVED******REMOVED******REMOVED***

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

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

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::press", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false***REMOVED***)
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- ***REMOVED******REMOVED******REMOVED***

-- Autosrtart applications
awful.spawn.with_shell("picom")
awful.spawn.with_shell("nitrogen --restore")
awful.spawn.with_shell("~/.con***REMOVED***g/awesome/autostart.sh")
-- os.execute("~/.con***REMOVED***g/awesome/autostart.sh")
