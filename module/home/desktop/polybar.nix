{ config, pkgs, ... }:

{
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    };

    script = "polybar top &";

    config = {
      "settings" = {
        "screenchange-reload" = true;
      };

      "bar/top" = {
        width = "100%";
        height = "20px";
        radius = 0;
        fixed-center = true;
        background = "#222222";
        foreground = "#ffffff";
        line-size = 2;
        padding-left = 0;
        padding-right = 2;
        module-margin = 1;
        modules-left = "i3";
        modules-right = "cpu memory backlight pulseaudio wlan battery date";
      };

      "module/i3" = {
        type = "internal/i3";
        format = "<label-state>";
        index-sort = true;
        label-active = "%index%";
        label-active-background = "#444444";
        label-active-padding = 2;
        label-occupied = "%index%";
        label-occupied-padding = 2;
        label-empty = "%index%";
        label-empty-padding = 2;
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = 2;
        format = "CPU <label>";
        label = "%percentage%%";
      };

      "module/memory" = {
        type = "internal/memory";
        interval = 2;
        format = "RAM <label>";
        label = "%percentage_used%%";
      };

      "module/backlight" = {
        type = "internal/backlight";
        card = "intel_backlight";
        format = "BRI <label>";
        label = "%percentage%%";
      };

      "module/pulseaudio" = {
        type = "internal/alsa";
        format-volume = "VOL <label-volume>";
        label-volume = "%percentage%%";
        label-muted = "MUTED";
      };

      "module/wlan" = {
        type = "internal/network";
        interface-type = "wireless";
        interval = 5;
        format-connected = "WIFI <label-connected>";
        format-disconnected = "WIFI disconnected";
        label-connected = "%essid%";
      };

      "module/battery" = {
        type = "internal/battery";
        battery = "BAT0";
        adapter = "AC";
        poll-interval = 5;
        format-charging = "CHR <label-charging>";
        format-discharging = "BAT <label-discharging>";
        format-full = "BAT <label-full>";
        label-charging = "%percentage%%";
        label-discharging = "%percentage%%";
        label-full = "100%";
      };

      "module/date" = {
        type = "internal/date";
        interval = 1;
        date = "%Y-%m-%d";
        time = "%H:%M:%S";
        label = "%date% %time%";
      };
    };
  };

  systemd.user.services.polybar.Install.WantedBy = [ "i3-session.target" ];
}
