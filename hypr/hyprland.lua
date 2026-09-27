------------------
---- MONITORS ----
------------------
hl.monitor({
    output = "eDP-1",
    mode = "1920x1080",
    position = "0x0",
    scale = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "kitty"
local fileManager = "nautilus"
local browser = "firefox"
local music = "spotify"
local launcher = "rofi -show drun -show-icons"
local runner = "rofi -show run"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.dsp.exec_cmd("sh -c 'wl-paste --type text --watch cliphist store &'")
    hl.dsp.exec_cmd("sh -c 'wl-paste --type image --watch cliphist store &'")
end)
--------------------------------
---- ENVIRONMENT VARIABLES ----
--------------------------------

hl.env("XCURSOR_THEME", "macos-tahoe-cursor")
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-----------------------
----- PERMISSIONS -----
-----------------------

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    general = {
        gaps_in = 6,
        gaps_out = 14,
        border_size = 1,
        col = {
            active_border = "rgba(66666688)",
            inactive_border = "rgba(33333333)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 13,
        rounding_power = 2,
        active_opacity = 0.90,
        inactive_opacity = 0.85,
        shadow = {
            enabled = true,
            range = 10,
            render_power = 3,
            color = "rgba(00000055)",
        },
        blur = {
            enabled = true,
            size = 6,
            passes = 2,
            vibrancy = 0.15,
        },
    },
    animations = {
        enabled = true,
    },
})

------------------------
---- ANIMATION CURVES --
------------------------
hl.curve("easeOutQuint", {type = "bezier", points = {{0.23, 1}, {0.32, 1}}})
hl.curve("easeInOutCubic", {type = "bezier", points = {{0.65, 0.05}, {0.36, 1}}})
hl.curve("linear", {type = "bezier", points = {{0, 0}, {1, 1}}})
hl.curve("almostLinear", {type = "bezier", points = {{0.5, 0.5}, {0.75, 1}}})
hl.curve("quick", {type = "bezier", points = {{0.15, 0}, {0.1, 1}}})
hl.curve("easy", {type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333})

---------------------
---- ANIMATIONS -----
---------------------
hl.animation({leaf = "global", enabled = true, speed = 10, bezier = "default"})
hl.animation({leaf = "border", enabled = true, speed = 5, bezier = "easeOutQuint"})
hl.animation({leaf = "windows", enabled = true, speed = 4.5, spring = "easy"})
hl.animation({leaf = "windowsIn", enabled = true, speed = 4, spring = "easy", style = "popin 85%"})
hl.animation({leaf = "windowsOut", enabled = true, speed = 2, bezier = "linear", style = "popin 85%"})
hl.animation({leaf = "fadeIn", enabled = true, speed = 2, bezier = "almostLinear"})
hl.animation({leaf = "fadeOut", enabled = true, speed = 1.8, bezier = "almostLinear"})
hl.animation({leaf = "fade", enabled = true, speed = 3, bezier = "quick"})
hl.animation({leaf = "layers", enabled = true, speed = 4, bezier = "easeOutQuint"})
hl.animation({leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade"})
hl.animation({leaf = "layersOut", enabled = true, speed = 1.7, bezier = "linear", style = "fade"})
hl.animation({leaf = "fadeLayersIn", enabled = true, speed = 2, bezier = "almostLinear"})
hl.animation({leaf = "fadeLayersOut", enabled = true, speed = 1.5, bezier = "almostLinear"})
hl.animation({leaf = "workspaces", enabled = true, speed = 2, bezier = "almostLinear", style = "fade"})
hl.animation({leaf = "workspacesIn", enabled = true, speed = 1.5, bezier = "almostLinear", style = "fade"})
hl.animation({leaf = "workspacesOut", enabled = true, speed = 2, bezier = "almostLinear", style = "fade"})
hl.animation({leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick"})

----------------------
---- LAYOUTS ---------
----------------------

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "br",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        repeat_rate = 25,
        repeat_delay = 300,
        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.2,
        },
    },
    cursor = {
        inactive_timeout = 3,
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local secondMod = "SHIFT + SUPER"

----------------
---- APPS ------
----------------

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("pgrep -x rofi >/dev/null && pkill -x rofi || " .. launcher))
hl.bind("ALT + SHIFT + SPACE", hl.dsp.exec_cmd("pgrep -x rofi >/dev/null && pkill -x rofi || " .. runner))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(music))
hl.bind("SUPER + N", hl.dsp.exec_cmd("hyprlock"))
hl.bind( "SUPER + V",   hl.dsp.exec_cmd("cliphist list | rofi -dmenu -i -p 'Clipboard' | cliphist decode | wl-copy"))

hl.bind( "SUPER + SHIFT + V",hl.dsp.exec_cmd("cliphist wipe"))
-- screenshots

hl.bind(
    "PRINT",
    hl.dsp.exec_cmd("~/.local/bin/screenshot")
)

hl.bind(
    "SUPER + SHIFT + Z",
    hl.dsp.exec_cmd("~/.local/bin/screenshot-select")
)

-------------------
---- WINDOWS ------
-------------------

hl.bind(mainMod .. " + X", hl.dsp.window.close())
hl.bind(mainMod .. " + O", hl.dsp.window.float({action = "toggle"}))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd("hyprshutdown"))

hl.bind("SUPER + C", hl.dsp.exec_cmd("pgrep -x waybar >/dev/null && pkill -x waybar || waybar &"))

-----------------------
---- FOCUS -----------
-----------------------

hl.bind(mainMod .. " + h", hl.dsp.focus({direction = "left"}))
hl.bind(mainMod .. " + l", hl.dsp.focus({direction = "right"}))
hl.bind(mainMod .. " + k", hl.dsp.focus({direction = "up"}))
hl.bind(mainMod .. " + j", hl.dsp.focus({direction = "down"}))

hl.bind(secondMod .. " + h", hl.dsp.window.move({direction = "left"}))
hl.bind(secondMod .. " + l", hl.dsp.window.move({direction = "right"}))
hl.bind(secondMod .. " + k", hl.dsp.window.move({direction = "up"}))
hl.bind(secondMod .. " + j", hl.dsp.window.move({direction = "down"}))

hl.bind(secondMod .. " + F", hl.dsp.window.fullscreen({mode = "maximized"}))

--------------------------
---- WORKSPACES ----------
--------------------------

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({workspace = i}))
    hl.bind(secondMod .. " + " .. key, hl.dsp.window.move({workspace = i}))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({workspace = "special:magic"}))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({workspace = "e+1"}))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({workspace = "e-1"}))

--------------------------
---- MOUSE --------------
--------------------------

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {mouse = true})
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {mouse = true})

-----------------------------
---- AUDIO / BRIGHTNESS -----
-----------------------------

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), {locked = true, repeating = true})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {locked = true, repeating = true})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {locked = true, repeating = true})
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), {locked = true, repeating = true})
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), {locked = true, repeating = true})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), {locked = true, repeating = true})

--------------------------
---- MEDIA ---------------
--------------------------

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {locked = true})
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), {locked = true})
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {locked = true})
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {locked = true})

--------------------------------
---- WINDOWS / WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
    name = "suppress-maximize-events",
    match = {class = ".*"},
    suppress_event = "maximize",
})

-- suppressMaximizeRule:set_enabled(false)

--------------------------------
---- XWAYLAND DRAG FIX --------
--------------------------------

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

--------------------------------
---- HYPRLAND RUN ------------
--------------------------------

hl.window_rule({
    name = "move-hyprland-run",
    match = {class = "hyprland-run"},
    move = "20 monitor_h-120",
    float = true,
})