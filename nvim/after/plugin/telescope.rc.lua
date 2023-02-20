local status, telescope = pcall(require, "telescope")
if not status then
  return
end

telescope.setup({
  extensions = {
***REMOVED***le_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-***REMOVED***le-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        ***REMOVED***,
        ["n"] = {
          -- your custom normal mode mappings
        ***REMOVED***,
      ***REMOVED***,
    ***REMOVED***,
  ***REMOVED***,
***REMOVED***)

telescope.load_extension("***REMOVED***le_browser")

