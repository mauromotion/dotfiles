import XMonad

import XMonad.Util.EZConfig

import XMonad.Hooks.EwmhDesktops

import XMonad.Util.SpawnOnce

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

-- Layouts
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier

-- Status bar
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.Loggers

main :: IO ()
main = xmonad
     . ewmhFullscreen 
     . ewmh 
     . withEasySB (statusBarProp "xmobar ~/.config/xmobar/xmobarrc" (pure myXmobarPP)) defToggleStrutsKey
     $ myConfig
    -- where
    --   toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
    --   toggleStrutsKey XConfig{ modMask = m } = (m, xK_b)

myConfig = def
    { modMask = myModMask -- Rebind Mod to the Super key
    , layoutHook = myLayout  -- Use custom layouts
    , manageHook = myManageHook -- Match on certain windows
    , startupHook = myStartupHook -- Launching programs on startup
    , terminal = myTerminal
    , borderWidth = myBorderWidth
    }
  `additionalKeysP`
    [ ("M-C-s", unGrab *> spawn "scrot -s"        )
    , ("M-f"  , spawn "firefox"                   )
    ]

myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "Gimp" --> doFloat
    , className =? "steam" --> doFloat
    , isDialog            --> doFloat
    ]

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "picom -b"
  spawnOnce "trayer --edge top --align right --SetDockType true \
            \--SetPartialStrut true --expand true --width 10 \
            \--transparent true --tint 0x5f5f5f --height 18"
  spawnOnce "nitrogen --restore"
  spawnOnce "udiskie -a -n -t"
  spawnOnce "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
  spawnOnce "pa-applet"
  spawnOnce "nm-applet"
  spawnOnce "nextcloud --background"
  spawnOnce "openrgb --startminimized"
  spawnOnce "xset b 100"
  spawnOnce "/home/mauromotion/.config/i3/color-profiles/desktop-load_ICC.sh"

myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

myModMask = mod4Mask
myTerminal = "wezterm"
myBorderWidth = 2

myXmobarPP :: PP
myXmobarPP = def
  { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""
