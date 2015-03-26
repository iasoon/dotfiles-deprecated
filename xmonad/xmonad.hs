import XMonad

import System.IO (hPutStrLn)
import XMonad.Actions.Navigation2D
import XMonad.Util.EZConfig
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (spawnPipe)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.Place
import XMonad.Layout.Grid
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances

import XMonad.Hooks.SetWMName

import qualified XMonad.StackSet as W

import System.Exit

main = do   h <- spawnPipe "~/.xmonad/scripts/bar"
            xmonad
                . withNavigation2DConfig navConf
                $ defaultConfig 
                    { modMask            = mod4Mask             -- Use super
                    , focusFollowsMouse  = False
                    , keys               = keybinds
                    , layoutHook         = layout
                    , workspaces         = slackspaces          -- lol work
                    , normalBorderColor  = "#2d2d2d"
                    , focusedBorderColor = "#999999"
                    , logHook            = logger h
                    , manageHook         = manageDocks <+> manager
                    , startupHook        = setWMName "LG3D"     -- lol java
                    , terminal           = "urxvt"
                    }

slackspaces = ["web", "code", "blargh"]

scratchpads =
    [ interm "weechat" weechatPlace ]
    where interm prog  = NS prog (runInTerm prog prog) 
                        (appName =? prog)
          weechatPlace = placeWithGaps (fixed (0.5, 0.5)) <+> doFloat

placeWithGaps = placeHook . withGaps (25, 10, 10, 10)
runInTerm prog name = unwords ["urxvt", "-name", name, "-e", prog]

layout =    avoidStruts
            . smartBorders
            . equalSpacing 8
            . mkToggle (single FULL)
            $ GridRatio (4/3)

equalSpacing px = spacing px . gaps gs
        where gs  = zip [U, D, R, L] (repeat px)

manager = namedScratchpadManageHook scratchpads <+> composeAll
    [ className =? "feh" --> placeFeh <+> doFloat
    , appName   =? "float" --> doFloat ]
    where   placeFeh = placeWithGaps $ fixed (1,0)

navConf = defaultNavigation2DConfig
    { defaultTiledNavigation = centerNavigation }

logger h = dynamicLogWithPP . namedScratchpadFilterOutWorkspacePP $ defaultPP
    { ppCurrent         = dzenfg "#ffcc66" . pad
    , ppVisible         = dzenfg "#99cc99" . pad
    , ppHidden          = dzenfg "#cccccc" . pad
    , ppHiddenNoWindows = dzenfg "#999999" . pad
    , ppSep             = ""
    , ppWsSep           = ""
    , ppLayout          = const ""
    , ppTitle           = const ""
    , ppOutput          = hPutStrLn h }

dzenfg c = wrap ("^fg("++c++")") "^fg()"

-- Keybinds
keybinds c = mkKeymap c $
    [ ("M-<Space>", spawn "cmd=`yeganesh -x` && exec $cmd")
    , ("M-<Return>", spawn "xcwd | xargs urxvt -cd")
    , ("M-S-<Return>", spawn "urxvt")

    -- Directional movement
    , ("M-h", windowGo L False)
    , ("M-t", windowGo D False)
    , ("M-n", windowGo U False)
    , ("M-s", windowGo R False)

    , ("M-S-h", windowSwap L False)
    , ("M-S-t", windowSwap D False)
    , ("M-S-n", windowSwap U False)
    , ("M-S-s", windowSwap R False)

    -- Scratchpads
    , ("M-c", namedScratchpadAction scratchpads "weechat")

    , ("M-d", withFocused $ windows . W.sink)

    , ("M-S-a", setLayout $ XMonad.layoutHook c)

    , ("<XF86MonBrightnessUp>",   spawn "xbacklight -inc 10")
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10")

    , ("M-m", sendMessage $ Toggle FULL)

    , ("M-w", kill)

    -- Push
    , ("<Print>",   spawn "push")
    , ("S-<Print>", spawn "sleep 0.2 && push -s")

    -- Locker
    , ("M-l", spawn "i3lock-fancy")

    -- Oneko
    , ("M1-<F4>", spawn "oneko -fg black -bg white")
    , ("M1-S-<F4>", spawn "killall oneko && xsetroot -cursor_name left_ptr")

    , ("M-q",   spawn "xmonad --recompile && xmonad --restart")
    , ("M-S-q", io exitSuccess)
    ] ++    [ ("M-"++m++show n, windows $ f w)
            | (n, w) <- zip [1..9] (workspaces c)
            , (m, f) <- [("", W.view), ("S-", W.shift)]
            ]
