{
  config,
  pkgs,
  lib,
  ...
}:

{
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      terminal = "alacritty";
      modifier = "Mod4";

      keybindings =
        let
          mod = "Mod4";
        in
        lib.mkOptionDefault {
          "${mod}+t" = "exec alacritty";
          "${mod}+d" = "exec rofi -show drun";
          "${mod}+q" = "kill";

          "${mod}+h" = "focus left";
          "${mod}+j" = "focus down";
          "${mod}+k" = "focus up";
          "${mod}+l" = "focus right";

          "${mod}+Shift+h" = "move left";
          "${mod}+Shift+j" = "move down";
          "${mod}+Shift+k" = "move up";
          "${mod}+Shift+l" = "move right";

          "${mod}+v" = "split v";
          "${mod}+b" = "split h";
          "${mod}+f" = "fullscreen toggle";

          "${mod}+s" = "layout stacking";
          "${mod}+w" = "layout tabbed";
          "${mod}+e" = "layout toggle split";

          "${mod}+Shift+space" = "floating toggle";
          "${mod}+space" = "focus mode_toggle";

          "${mod}+Shift+c" = "reload";
          "${mod}+Shift+r" = "restart";
          "${mod}+Shift+e" = "exec i3-msg exit";

          "${mod}+Shift+s" = "exec maim -s | xclip -selection clipboard -t image/png";

          "Ctrl+${mod}+Left" = "workspace prev";
          "Ctrl+${mod}+Right" = "workspace next";

          "${mod}+plus" =
            "exec \"i3-msg workspace $(i3-msg -t get_workspaces | jq '[.[] | select(.num != -1).num] as \$ws | (range(1; 20) | select(. as \$n | (\$ws | contains([\$n]) | not)))' | head -n1)\"";

          "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
          "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";

          "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
          "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
          "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        };

      bars = [ ];
    };
  };
}
