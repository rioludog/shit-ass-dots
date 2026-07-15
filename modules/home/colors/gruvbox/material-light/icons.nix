{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gruvbox-plus-icons
  ];

  gtk = {
    enable = true;
    iconTheme.name = "Gruvbox-Plus-Light";
  };

  qt = {
    qt5ctSettings.Appearance = {
      icon_theme = "Gruvbox-Plus-Light";
    };
    qt6ctSettings.Appearance = {
      icon_theme = "Gruvbox-Plus-Light";
    };
  };
}
