{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gruvbox-plus-icons
  ];

  gtk = {
    enable = true;
    iconTheme.name = "Gruvbox-Plus-Dark";
  };

  qt = {
    qt5ctSettings.Appearance = {
      icon_theme = "Gruvbox-Plus-Dark";
    };
    qt6ctSettings.Appearance = {
      icon_theme = "Gruvbox-Plus-Dark";
    };
  };
}
