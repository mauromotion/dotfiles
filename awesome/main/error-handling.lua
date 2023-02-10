-- Noti***REMOVED***cation library
local naughty = require("naughty")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Check if awesome encountered an error during startup and fell back to
-- another con***REMOVED***g (This code will only ever execute for the fallback con***REMOVED***g)
if awesome.startup_errors then
  naughty.notify({
    preset = naughty.con***REMOVED***g.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors
  ***REMOVED***)
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function (err)
    -- Make sure we don't go into an endless error loop
    if in_error then return end
    in_error = true

    naughty.notify({
      preset = naughty.con***REMOVED***g.presets.critical,
      title = "Oops, an error happened!",
      text = tostring(err)
    ***REMOVED***)
    in_error = false
  end)
end

