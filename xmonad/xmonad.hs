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
         , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
         , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5")
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
         , ("C-e e", spawn "emacsclient -c -a ''")                            -- start emacs
         , ("C-e b", spawn "emacsclient -c -a '' --eval '(ibuffer)'")         -- list emacs buffers
         , ("C-e d", spawn "emacsclient -c -a '' --eval '(dired nil)'")       -- dired emacs file manager
         ]

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "xsetroot -cursor_name left_ptr"
  spawnOnce "feh --bg-scale ~/Pictures/Wallpapers/wallpaper.jpg"
  spawnOnce "msm_notifier"
  spawnOnce "start-pulseaudio-x11"
  spawnOnce "setxkbmap -option ctrl:nocaps"
  spawnOnce "xset b off"
  spawnOnce "xmobar ~/.xmonad/.xmobarrc"
  spawnOnce "tapping"
  spawnOnce "urxvtd -q -o -f"
  spawnOnce "emacs --daemon"


myLayoutHook = mySpacing $ avoidStruts (ResizableTall 1 (3/100) (1/2) [] ||| Full)

mySpacing = spacingRaw True myBorder True myBorder True

myBorder :: Border
myBorder = Border { top = 5
                  , bottom = 5
                  , right = 5
                  , left = 5
                  }
