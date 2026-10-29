hl.env("PATH", os.getenv("HOME") .. "/.local/bin:" .. os.getenv("PATH"))
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("XDG_MENU_PREFIX", "arch-")
hl.env("PROTON_USE_NTSYNC", "1")

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

hl.config({
    input = {
        kb_layout     = "us",
        follow_mouse  = 1,
        sensitivity   = 0,
        accel_profile = "flat",
        mouse_refocus = false,
        touchpad = {
            natural_scroll       = true,
            tap_to_click         = true,
            disable_while_typing = true,
            scroll_factor        = 0.5,
        },
    },

    general = {
        layout           = "dwindle",
        gaps_in          = 5,
        gaps_out         = 12,
        border_size      = 2,
        resize_on_border = true,
        allow_tearing    = true,
        col = {
            active_border   = { colors = { "rgba(cba6f7ff)", "rgba(89b4faff)" }, angle = 45 },
            inactive_border = "rgba(313244aa)",
        },
    },

    decoration = {
        rounding       = 12,
        rounding_power = 2,
        blur = {
            enabled  = true,
            size     = 6,
            passes   = 3,
            noise    = 0.02,
            vibrancy = 0.2,
            popups   = true,
        },
        shadow = {
            enabled        = true,
            range          = 24,
            render_power   = 3,
            offset         = { 0, 6 },
            color          = "rgba(11111baa)",
            color_inactive = "rgba(11111b66)",
        },
    },

    dwindle = { preserve_split = true },

    misc = {
        disable_hyprland_logo      = true,
        disable_splash_rendering   = true,
        force_default_wallpaper    = 0,
        mouse_move_enables_dpms    = false,
        key_press_enables_dpms     = true,
        enable_swallow             = true,
        swallow_regex              = "^(com\\.mitchellh\\.ghostty)$",
        vrr                        = 2,
        focus_on_activate          = true,
        allow_session_lock_restore = true,
    },

    cursor = {
        no_hardware_cursors  = 2,
        sync_gsettings_theme = true,
        persistent_warps     = true,
    },

    render    = { direct_scanout = 2, cm_enabled = false },
    xwayland  = { force_zero_scaling = true },
    binds     = { workspace_back_and_forth = true, allow_workspace_cycles = true },
    ecosystem = { no_update_news = true, no_donation_nag = true },
})

hl.device({
    name                 = "pixa3848:00-093a:3848-touchpad",
    natural_scroll       = true,
    accel_profile        = "adaptive",
    sensitivity          = 0.6,
    disable_while_typing = true,
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

hl.curve("snap", { type = "bezier", points = { { 0.2, 1 }, { 0.3, 1 } } })
hl.curve("ease", { type = "bezier", points = { { 0.25, 0.1 }, { 0.25, 1 } } })
hl.animation({ leaf = "global",      enabled = true, speed = 2.5, bezier = "snap" })
hl.animation({ leaf = "windows",     enabled = true, speed = 3,   bezier = "snap", style = "popin 85%" })
hl.animation({ leaf = "fade",        enabled = true, speed = 3,   bezier = "ease" })
hl.animation({ leaf = "layers",      enabled = true, speed = 2.5, bezier = "snap", style = "fade" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 3,   bezier = "snap", style = "slidefade 15%" })
hl.animation({ leaf = "border",      enabled = true, speed = 4,   bezier = "ease" })
hl.animation({ leaf = "borderangle", enabled = false })

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("vicinae server")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("playerctld daemon")
    hl.exec_cmd("wl-clip-persist --clipboard regular")
    hl.exec_cmd("awww-daemon & sleep 1 && awww img ~/.config/hypr/wallpaper.jpg")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)

require("binds")
require("rules")

pcall(require, "local")
pcall(require, "hyprcurtain")
