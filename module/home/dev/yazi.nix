{ pkgs, ... }:

{
  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
  };

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;

    extraPackages = with pkgs; [
      _7zz
      chafa
      exiftool
      ffmpeg
      ffmpegthumbnailer
      imagemagick
      poppler
      resvg
      ueberzugpp
      zoxide
    ];

    settings = {
      opener.edit = [
        {
          run = ''vim "$@"'';
          block = true;
          for = "unix";
        }
      ];
    };
  };

  xdg.desktopEntries.yazi = {
    name = "Yazi";
    genericName = "File Manager";
    exec = "urxvt -name yazi -e yazi %u";
    mimeType = [ "inode/directory" ];
    terminal = false;
    icon = "yazi";
    categories = [
      "System"
      "FileTools"
      "FileManager"
    ];
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "yazi.desktop" ];
    };
  };
}
