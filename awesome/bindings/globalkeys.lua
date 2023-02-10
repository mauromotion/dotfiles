
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- local hotkeys_popup = require("awful.hotkeys_popup").widget
local hotkeys_popup = require("awful.hotkeys_popup")
-- Menubar library
local menubar = require("menubar")

-- Resource Con***REMOVED***guration
local modkey = RC.vars.modkey
local terminal = RC.vars.terminal

local _M = {***REMOVED***

-- reading
-- https://awesomewm.org/wiki/Global_Keybindings

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
  local globalkeys = gears.table.join(
    awful.key({ modkey,           ***REMOVED***, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"***REMOVED***),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Tag browsing
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
    awful.key({ modkey,           ***REMOVED***, "w", function () RC.mainmenu:show() end,
              {description = "show main menu", group = "awesome"***REMOVED***),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
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

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Standard program
    awful.key({ modkey,           ***REMOVED***, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"***REMOVED***),
    awful.key({ modkey, "Control" ***REMOVED***, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"***REMOVED***),
    awful.key({ modkey, "Shift"   ***REMOVED***, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"***REMOVED***),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Layout manipulation
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

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
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

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Resize
    --awful.key({ modkey, "Control" ***REMOVED***, "Left",  function () awful.client.moveresize( 20,  20, -40, -40) end),
    --awful.key({ modkey, "Control" ***REMOVED***, "Right", function () awful.client.moveresize(-20, -20,  40,  40) end),
    awful.key({ modkey, "Control" ***REMOVED***, "Down",
              function () awful.client.moveresize( 0, 0, 0, -20) end),
    awful.key({ modkey, "Control" ***REMOVED***, "Up",
              function () awful.client.moveresize( 0, 0, 0,  20) end),
    awful.key({ modkey, "Control" ***REMOVED***, "Left",
              function () awful.client.moveresize( 0, 0, -20, 0) end),
    awful.key({ modkey, "Control" ***REMOVED***, "Right",
              function () awful.client.moveresize( 0, 0,  20, 0) end),

    -- Move
    awful.key({ modkey, "Shift"   ***REMOVED***, "Down",
              function () awful.client.moveresize(  0,  20,   0,   0) end),
    awful.key({ modkey, "Shift"   ***REMOVED***, "Up",
              function () awful.client.moveresize(  0, -20,   0,   0) end),
    awful.key({ modkey, "Shift"   ***REMOVED***, "Left",
              function () awful.client.moveresize(-20,   0,   0,   0) end),
    awful.key({ modkey, "Shift"   ***REMOVED***, "Right",
              function () awful.client.moveresize( 20,   0,   0,   0) end),

    --   -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- Menubar
    awful.key({ modkey ***REMOVED***, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"***REMOVED***)

  )

  return globalkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({***REMOVED***, { __call = function(_, ...) return _M.get(...) end ***REMOVED***)
