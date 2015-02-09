import XMonad 
import Data.Monoid
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.Minimize
import XMonad.Layout.NoBorders
import qualified XMonad.StackSet as W
import qualified Data.Map        as M
import XMonad.Layout.ShowWName
import XMonad.Hooks.SetWMName
import XMonad.Actions.WindowBringer(bringWindow, windowMap)
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Dmenu

myTerminal = "gnome-terminal"
toggleStructsKey XConfig{XMonad.modMask=modMask}=(modMask,xK_b)

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False
myBorderWidth   = 3
myModMask       = mod4Mask
-- myNumlockMask   = mod2Mask
myWorkspaces    = ["1","2","3","4","5","6","7","8","9","0"]
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#4169e1"

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm,               xK_p     ), spawn "dmenu_run")
    , ((modm,               xK_c     ), kill)
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm,               xK_f     ), sendMessage (Toggle "Full"))
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modm,               xK_n     ), refresh)
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp  )
    , ((modm,               xK_m     ), windows W.focusMaster  )
    , ((modm,               xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    , ((modm .|. shiftMask, xK_comma ), sendMessage Shrink)
    , ((modm .|. shiftMask, xK_period), sendMessage Expand)
    , ((modm .|. shiftMask, xK_r     ), do
        screenWorkspace 0 >>= flip whenJust (windows.W.view)
        (windows . W.greedyView) "1"
        screenWorkspace 1 >>= flip whenJust (windows.W.view)
        (windows . W.greedyView) "2")
    , ((modm,               xK_h     ), withFocused minimizeWindow >> windows W.focusDown  )
    , ((modm .|. shiftMask, xK_h     ), sendMessage RestoreNextMinimizedWin )
    , ((modm .|. shiftMask, xK_l     ), bringRestoredWindow )
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    , ((0, 0x1008FF11), spawn "amixer -c 0 set Master 2dB-")
    , ((0, 0x1008FF13), spawn "amixer -c 0 set Master 2dB+")
    , ((0, 0x1008FF12), spawn "amixer set Master toggle")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
       -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
       -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    ++
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
          | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
          , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
   
   
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]
-- Layouts:
myLayout =  minimize (toggleLayouts (noBorders Full) tiled) |||  minimize (toggleLayouts (noBorders Full) (Mirror tiled))
        where                                
            tiled   = Tall nmaster delta ratio
            nmaster = 1
            ratio   = 3/5
            delta   = 2/100
---------------------------------------------------------------------
-- Window rules:
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
myManageHook = composeAll
    [ isDialog --> doF W.shiftMaster <+> doF W.swapDown
    , className =? "Thunderbird"    --> doShift "8"
    , className =? "slite"    --> doFloat 
    ]
---------------------------------------------------------------------
-- Event handling
-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
myEventHook = mempty
---------------------------------------------------------------------
-- Status bars and logging
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'DynamicLog' extension for examples.
-- To emulate dwm's status bar
-- > logHook = dynamicLogDzen
myLogHook = return ()
---------------------------------------------------------------------
-- Startup hook
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
-- By default, do nothing.
myStartupHook = setWMName "LG3D"
---------------------------------------------------------------------

main = do
    spawn "xkbcomp -I$HOME/.xkb ~/.xkb/keymap/mymap $DISPLAY 2 > /dev/null"
    xmonad defaults

defaults = defaultConfig {
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        -- numlockMask        = myNumlockMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
        keys               = myKeys,
        mouseBindings      = myMouseBindings,
        layoutHook         = showWName myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
        }


bringRestored :: Window -> X ()
bringRestored w = do
    broadcastMessage (RestoreMinimizedWin w)
    windows (bringWindow w) -- or something else like focusWindow

bringRestoredWindow = do
    wm <- windowMap
    w <- dmenu (M.keys wm)
    whenJust (M.lookup w wm) bringRestored
