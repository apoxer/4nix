{ inputs, config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    extraConfig = "
decoration:blur:enabled = false
decoration:shadow:enabled = false

monitor=,preferred,auto,1

exec-once = uwsm app -- hyprpanel
exec-once = uwsm app -- swww-daemon
exec-once = uwsm app -- clipse -listen
exec-once = systemctl --user start hypridle.service

general {
    border_size = 2
    col.active_border = rgba(f5c2e7ee) rgba(89dbebee) 45deg
    resize_on_border = true
}

decoration {
    rounding = 10
   
    #blur {
    #    passes = 3
    #}
}

animations {
    enabled = yes, please :)
    bezier = easeOutQuint,0.23,1,0.32,1
    bezier = easeInOutCubic,0.65,0.05,0.36,1
    bezier = linear,0,0,1,1
    bezier = almostLinear,0.5,0.5,0.75,1.0
    bezier = quick,0.15,0,0.1,1

    animation = global, 1, 10, default
    animation = border, 1, 5.39, easeOutQuint
    animation = windows, 1, 4.79, easeOutQuint
    animation = windowsIn, 1, 4.1, easeOutQuint, popin 87%
    animation = windowsOut, 1, 1.49, linear, popin 87%
    animation = fadeIn, 1, 1.73, almostLinear
    animation = fadeOut, 1, 1.46, almostLinear
    animation = fade, 1, 3.03, quick
    animation = layers, 1, 3.81, easeOutQuint
    animation = layersIn, 1, 4, easeOutQuint, fade
    animation = layersOut, 1, 1.5, linear, fade
    animation = fadeLayersIn, 1, 1.79, almostLinear
    animation = fadeLayersOut, 1, 1.39, almostLinear
    animation = workspaces, 1, 1.94, almostLinear, fade
    animation = workspacesIn, 1, 1.21, almostLinear, fade
    animation = workspacesOut, 1, 1.94, almostLinear, fade
}

dwindle {
    pseudotile = true
    preserve_split = true
}

master {
    new_status = master
}

misc {
    force_default_wallpaper = 0
    disable_hyprland_logo = true
    disable_splash_rendering = true
}

input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =
    follow_mouse = 1
    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    numlock_by_default = true

    touchpad {
        natural_scroll = true
	      scroll_factor = 0.4
    }
}

gestures {
    workspace_swipe = true
}

device {
    name = epic-mouse-v1
    sensitivity = -0.5
}

$mainMod = SUPER

bind= CTRL SHIFT, R,  exec, uwsm app -- hyprpanel -q; hyprpanel
bind= ,Print, exec, uwsm app -- grimblast save screen
bind= SHIFT, Print, exec, uwsm app -- grimblast save area

bind = $mainMod, Q, exec, uwsm app -- kitty
bind = $mainMod, C, killactive,
bind = $mainMod, M, exec, uwsm stop
bind = $mainMod, W, exec, uwsm app -- brave 
bind = $mainMod, E, exec, uwsm app -- kitty yazi
bind = $mainMod, F, togglefloating,
bind = $mainMod, R, exec, uwsm app -- fuzzel
bind = $mainMod, T, exec, uwsm app -- fuzzel --dpi-aware=no
bind = $mainMod, O, exec, uwsm app -- emote
bind = $mainMod, V, exec, uwsm app -- kitty --class clipse -e 'clipse'
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle
bind = $mainMod, L, exec, uwsm app -- hyprlock
bind = $mainMod SHIFT, P, exec, uwsm app -- hyprpicker -a --format=hex
bind = $mainMod, N, exec, uwsm app -- kitty nvim

bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

bind = $mainMod, S, togglespecialworkspace, magic
bind = $mainMod SHIFT, S, movetoworkspace, special:magic

bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

bind = $mainMod SHIFT, left, resizeactive,-50 0
bind = $mainMod SHIFT, right, resizeactive,50 0
bind = $mainMod SHIFT, up, resizeactive,0 -50
bind = $mainMod SHIFT, down, resizeactive,0 50
  
bind = $mainMod CTRL, left, movewindow, l
bind = $mainMod CTRL, right, movewindow, r
bind = $mainMod CTRL, up, movewindow, u
bind = $mainMod CTRL, down, movewindow, d

bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
bindel = ,XF86MonBrightnessUp, exec, brightnessctl s 10%+
bindel = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-

windowrulev2 = suppressevent maximize, class:.*
windowrulev2 = float, class:(clipse)
windowrulev2 = size 622 652, class:(clipse)
windowrulev2 = float, class:(org.pulseaudio.pavucontrol)
windowrulev2 = size 952 500, class:(org.pulseaudio.pavucontrol)
windowrulev2 = float, class:(blueman-manager)
windowrulev2 = size 826 450, class:(blueman-manager)
windowrulev2 = float, class:(xdg-desktop-portal-gtk)
# windowrulev2 = size 1143 668, class:(

# layerrule = blur, bar-0
# layerrule = blur, bar-1
    ";
  };
}
