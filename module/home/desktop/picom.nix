{ ... }:

{
  services.picom = {
    enable = true;
    vSync = true;
    backend = "glx";
    settings = {
      unredir-if-possible = true;
    };
  };
}
