hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })
hl.window_rule({ match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false }, no_focus = true })

hl.window_rule({ match = { class = "^(cava-float)$" }, float = true, size = { 900, 350 } })
hl.window_rule({ match = { class = "^(btop)$" }, float = true, size = { 1200, 800 }, center = true })
hl.window_rule({ match = { class = "^(com\\.saivert\\.pwvucontrol|pavucontrol|org\\.pulseaudio\\.pavucontrol)$" }, float = true, size = { 760, 520 }, center = true })
hl.window_rule({ match = { class = "^(com\\.gabm\\.satty)$" }, float = true, center = true })
hl.window_rule({ match = { class = "^(nm-connection-editor|blueman-manager|qt6ct|nwg-look)$" }, float = true, center = true })
hl.window_rule({ match = { class = "^(org\\.kde\\.polkit-kde-authentication-agent-1|hyprpolkitagent)$" }, float = true, center = true, stay_focused = true })

hl.window_rule({ match = { title = "^([Pp]icture[- ][Ii]n[- ][Pp]icture)$" }, float = true, pin = true, size = { 480, 270 }, keep_aspect_ratio = true })

hl.window_rule({ match = { class = "^(steam)$", title = "^(Friends List|Steam Settings|Steam - News.*|Special Offers)$" }, float = true, center = true })

hl.window_rule({ match = { class = "^(steam_app_.*|gamescope.*|.*\\.exe)$" }, immediate = true })
hl.window_rule({ match = { class = "^(steam_app_3480)$" }, immediate = false })
hl.window_rule({ match = { class = "^(steam_app_1874880)$", title = "^(Arma Reforger)$" }, fullscreen = true })

hl.window_rule({ match = { class = "^(OrcaSlicer)$", title = "^(OrcaSlicer.*)$" }, size = { 1600, 1000 }, center = true })
hl.window_rule({ match = { class = "^(OrcaSlicer)$", title = "^(Open|Save|Import|Export|Preferences|Print Host Upload Queue|Send G-code|Loading).*" }, float = true, center = true })
hl.window_rule({ match = { class = "^(OrcaSlicer)$", title = "^(Open|Save|Import|Export).*" }, size = { 900, 600 } })
hl.window_rule({ match = { class = "^(BlockBlast)$" }, float = true, size = { 480, 820 }, center = true })

hl.layer_rule({ match = { namespace = "^(selection)$" }, no_anim = true })
hl.layer_rule({ match = { namespace = "^(hyprpicker)$" }, no_anim = true })
hl.layer_rule({ match = { namespace = "^([Vv]icinae.*)$" }, no_anim = true })
hl.layer_rule({ match = { namespace = "^(waybar|swaync-control-center|swaync-notification-window|swayosd)$" }, blur = true, ignore_alpha = 0.3 })
