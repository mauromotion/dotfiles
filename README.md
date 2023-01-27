------------------------------------------------------
-- ┌┬┐┌─┐┬ ┬┬─┐┌─┐┌┬┐┌─┐┌┬┐┬┌─┐┌┐┌
-- │││├─┤│ │├┬┘│ │││││ │ │ ││ ││││
-- ┴ ┴┴ ┴└─┘┴└─└─┘┴ ┴└─┘ ┴ ┴└─┘┘└┘
-- * .dot***REMOVED***les * --
-- https://github.com/mauromotion/dot***REMOVED***les -----------

My dot***REMOVED***les repo

These directories need to be symlinked from ~/.dot***REMOVED***les to ~/.con***REMOVED***g with `ln -svf ~/.dot***REMOVED***les/<DIR> ~/.con***REMOVED***g/`.

I will write a script later on. Example:

```
#!/bin/bash
dot***REMOVED***les = (.***REMOVED***sh)for ***REMOVED***le in "$.dot***REMOVED***les[@]"; do
    ln -svf $***REMOVED***le ~/.con***REMOVED***g
done
```
