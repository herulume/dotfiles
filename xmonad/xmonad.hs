import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.LayoutModifier
import XMonad.Hooks.ManageDocks
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce


main :: IO ()
main = xmonad $ (docks myConfig)

myConfig = ewmh def { terminal = "urxvtc"
                    , modMask = mod4Mask
                    , borderWidth = 0
                    , focusFollowsMouse = True
                    , layoutHook = myLayoutHook
                    , startupHook = myStartupHook
                    } `additionalKeysP` myKeys

myKeys :: [(String, X ())]
myKeys = [ ("M-r", spawn "rofi -show run")
         , ("M-w", spawn "rofi -show window")
         , ("<XF86MonBrightnessDown>", spawn "xbacklight -inc 5")
         , ("<XF86MonBrightnessUp>", spawn "xbacklight -dec 5")
         , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%-")
         , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+")
         , ("<XF86AudioMute>", spawn "amixer set Master toggle")
         , ("<XF86AudioMicMute>", spawn "amixer sset Capture toggle")
         , ("<XF86Display>", spawn "xrandr --auto")
         , ("<Print>", spawn "sh -c 'import -window root ~/Desktop/screen_shot_$(date --iso-8601=seconds).png'")
         , ("M-<Print>", spawn "sh -c 'import ~/Desktop/screen_shot_$(date --iso-8601=seconds).png'")
         , ("M-C-<Print>", spawn "sh -c 'import -window $(xprop -root | grep \"_NET_ACTIVE_WINDOW(WINDOW)\" | sed -e \"s/.* # //g\") ~/Desktop/screen_shot_$(date --iso-8601=seconds).png'")
         , ("M-x", spawn "pkill xmobar")
         , ("M-a", sendMessage MirrorShrink)
         , ("M-z", sendMessage MirrorExpand)
         ]

myStartupHook :: X ()
myStartupHook = do
  spawn "xsetroot -cursor_name left_ptr"
  spawn "feh --bg-scale ~/Pictures/Wallpapers/wallpaper.jpg"
  spawn "msm_notifier"
  spawn "start-pulseaudio-x11"
  spawn "setxkbmap -option ctrl:nocaps"
  spawn "xset b off"
  spawnOnce "xmobar ~/.xmonad/.xmobarrc"
  spawnOnce "tapping"
  spawnOnce "urxvtd -q -o -f"


myLayoutHook = mySpacing $ avoidStruts (ResizableTall 1 (3/100) (1/2) [] ||| Full)

mySpacing = spacingRaw True myBorder True myBorder True

myBorder :: Border
myBorder = Border { top = 5
                  , bottom = 5
                  , right = 5
                  , left = 5
                  }
