{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.libinput = {
    enable = true;

    mouse = {
      accelProfile = "flat";
      accelSpeed = "0.4";
    };

    touchpad = {
      accelProfile = "flat";
      accelSpeed = "0.4";

      naturalScrolling = true;
      tapping = true;

      disableWhileTyping = false;
      additionalOptions = ''
        Option "PalmDetection" "off"
        Option "HorizontalScrolling" "true"
        Option "SendEventsMode" "enabled"
      '';
    };
  };

  services.xserver.config = ''
    Section "InputClass"
        Identifier "Touchpad Precision Overrides"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "Resolution" "400"
        Option "Hysteresis" "0"
    EndSection
  '';
}
