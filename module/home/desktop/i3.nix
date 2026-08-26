{
  config,
  pkgs,
  lib,
  ...
}:

let
  # Move to the absolute lowest empty workspace (Your original correct behavior)
  moveNewWs = pkgs.writeShellScript "i3-move-new-ws" ''
    ws=$(i3-msg -t get_workspaces | ${pkgs.jq}/bin/jq '[.[] | select(.num != -1).num] as $ws | (range(1; 20) | select(. as $n | ($ws | contains([$n]) | not)))' | head -n1)
    i3-msg "move container to workspace $ws; workspace $ws"
  '';

  # Move window to the NEXT existing workspace in order
  moveNextWs = pkgs.writeShellScript "i3-move-next-ws" ''
    workspaces=$(i3-msg -t get_workspaces | ${pkgs.jq}/bin/jq -c '[.[] | select(.num != -1)] | sort_by(.num)')
    current=$(echo "$workspaces" | ${pkgs.jq}/bin/jq '.[] | select(.focused == true).num')
    next=$(echo "$workspaces" | ${pkgs.jq}/bin/jq --argjson cur "$current" '[.[] | select(.num > $cur).num] | first')

    # If there is no higher workspace, wrap around to the first existing one
    if [ "$next" = "null" ] || [ -z "$next" ]; then
      next=$(echo "$workspaces" | ${pkgs.jq}/bin/jq '.[0].num')
    fi

    i3-msg "move container to workspace $next; workspace $next"
  '';

  # Move window to the PREVIOUS existing workspace in order
  movePrevWs = pkgs.writeShellScript "i3-move-prev-ws" ''
    workspaces=$(i3-msg -t get_workspaces | ${pkgs.jq}/bin/jq -c '[.[] | select(.num != -1)] | sort_by(.num)')
    current=$(echo "$workspaces" | ${pkgs.jq}/bin/jq '.[] | select(.focused == true).num')
    prev=$(echo "$workspaces" | ${pkgs.jq}/bin/jq --argjson cur "$current" '[.[] | select(.num < $cur).num] | last')

    # If there is no lower workspace, wrap around to the last existing one
    if [ "$prev" = "null" ] || [ -z "$prev" ]; then
      prev=$(echo "$workspaces" | ${pkgs.jq}/bin/jq '.[-1].num')
    fi

    i3-msg "move container to workspace $prev; workspace $prev"
  '';
in
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

          "Ctrl+Shift+${mod}+Left" = "exec ${movePrevWs}";
          "Ctrl+Shift+${mod}+Right" = "exec ${moveNextWs}";

          "${mod}+Shift+minus" = "move scratchpad";
          "${mod}+minus" = "scratchpad show";

          "${mod}+Shift+plus" = "exec ${moveNewWs}";

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
