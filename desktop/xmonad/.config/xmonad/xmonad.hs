------------------------------------------------------------------------
-- Import modules
--
import XMonad
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

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

------------------------------------------------------------------------
-- Variables
--

myModMask = mod4Mask
myTerminal = "wezterm"
myBrowser = "firefox"
myFileManager = "thunar"
myBorderWidth = 2
myNormalBorderColor = "#2e3440"
myFocusedBorderColor = "#88c0d0"
myWorkspaces    = ["home","mail","dev","chat","docs","media","games","edit","extra"]

------------------------------------------------------------------------
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
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , workspaces = myWorkspaces
    , keys = myKeys
    }

------------------------------------------------------------------------
-- Window rules
--
myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "Gimp" --> doFloat
    , className =? "steam" --> doFloat
    , className =? "Viewnior" --> doFloat
    , className =? "mpv" --> doFloat
    , className =? "vlc" --> doFloat
    , className =? "Pavucontrol" --> doFloat
    , className =? "Lxappearance" --> doFloat
    , className =? "Galculator" --> doFloat
    , className =? "Gpick" --> doFloat
    , className =? "org.cryptomator.launcher.Cryptomator$MainApp" --> doFloat
    , isDialog            --> doFloat
    ]

------------------------------------------------------------------------
-- Startup hook
--
myStartupHook :: X ()
myStartupHook = do
  spawnOnce "picom -b"
  spawnOnce "trayer --edge top --align right --SetDockType true \
            \--SetPartialStrut false --expand true --width 10 \
            \--transparent false --tint 0xFFFFFFFF --height 18"
  spawnOnce "nitrogen --restore"
  spawnOnce "udiskie -a -n -t"
  spawnOnce "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
  spawnOnce "pa-applet"
  spawnOnce "nm-applet"
  spawnOnce "nextcloud --background"
  spawnOnce "openrgb --startminimized"
  spawnOnce "xset b 100"
  spawnOnce "/home/mauromotion/.config/i3/color-profiles/desktop-load_ICC.sh"

------------------------------------------------------------------------
-- Layouts
--
myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled    = Tall nmaster delta ratio
    nmaster  = 1      -- Default number of windows in the master pane
    ratio    = 1/2    -- Default proportion of screen occupied by master pane
    delta    = 3/100  -- Percent of screen to increment by when resizing panes

------------------------------------------------------------------------
-- XMobar
--
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
    magenta  = xmobarColor "#b48ead" ""
    blue     = xmobarColor "#88c0d0" ""
    white    = xmobarColor "#d8dee9" ""
    yellow   = xmobarColor "#ebcb8b" ""
    red      = xmobarColor "#bf616a" ""
    lowWhite = xmobarColor "#bbbbbb" ""

------------------------------------------------------------------------
-- Key bindings
--
myKeys conf@(XConfig {XMonad.modMask = mod}) = M.fromList $

    -- launch a terminal
    [ ((mod .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- launch rofi
    , ((mod,               xK_g     ), spawn "rofi -show combi")

    -- launch rofi power menu
    , ((mod,               xK_p     ), spawn "rofi -show power-menu -modi \"power-menu:rofi-power-menu --choices=suspend/logout/lockscreen/reboot/shutdown\"")

    -- launch the browser
    , ((mod,               xK_b     ), spawn myBrowser)

    -- launch the file manager
    , ((mod,               xK_f     ), spawn myFileManager)

    -- launch the calculator
    , ((mod,               xK_c     ), spawn "galculator")

    -- Capture screen region
    , ((mod .|. shiftMask, xK_z     ), spawn "flameshot gui")

    -- close focused window
    , ((mod .|. shiftMask, xK_q     ), kill)

     -- Rotate through the available layout algorithms
    , ((mod,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((mod .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    -- , ((mod,               xK_n     ), refresh)

    -- Move focus to the next window
    , ((mod,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((mod,               xK_e     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((mod,               xK_i     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((mod,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((mod,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((mod .|. shiftMask, xK_e     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((mod .|. shiftMask, xK_i     ), windows W.swapUp    )

    -- Shrink the master area
    , ((mod,               xK_n     ), sendMessage Shrink)

    -- Expand the master area
    , ((mod,               xK_o     ), sendMessage Expand)

    -- Push window back into tiling
    , ((mod,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((mod              , xK_h ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((mod              , xK_d), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    , ((mod .|. shiftMask, xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((mod .|. shiftMask .|. controlMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((mod .|. shiftMask .|. controlMask, xK_r     ), spawn "xmonad --recompile; xmonad --restart")

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
    , ((mod .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. mod, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. mod, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_comma, xK_period] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------
-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]
