{ ... }:

{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = 600;
        height = 300;
        origin = "top-right";
        offset = "20x20";
        notification_limit = 8;

        font = "JetBrainsMono Nerd Font 10";
        markup = "full";
        format = "<b>%s</b>\\n%b";
        alignment = "left";
        vertical_alignment = "center";

        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 8;
        separator_height = 4;
        separator_color = "frame";

        frame_width = 1;
        frame_color = "#ffffff";
        corner_radius = 0;
        background = "#222222";
        foreground = "#ffffff";

        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_current";
        mouse_right_click = "close_current";
      };

      urgency_low = {
        background = "#222222";
        foreground = "#ffffff";
        timeout = 3;
      };

      urgency_normal = {
        background = "#222222";
        foreground = "#ffffff";
        timeout = 5;
      };

      urgency_critical = {
        background = "#222222";
        foreground = "#ffffff";
        frame_color = "#ffffff";
        timeout = 0;
      };
    };
  };
}
