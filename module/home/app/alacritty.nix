{ ... }:

{
  programs.alacritty = {
    enable = true;

    settings.general = {
      live_config_reload = false;
      ipc_socket = false;
    };
  };
}
