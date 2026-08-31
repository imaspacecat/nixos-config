{ ... }:

{
  users.groups.usb-blaster = { };

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", GROUP="usb-blaster", MODE="0660"
  '';
}
