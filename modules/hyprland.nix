{ pkgs, lib, config, ... }: {

  options = {
    hyprland.enable = 
      lib.mkEnableOption "enables module1";
  };

  config = lib.mkIf config.hyprland.enable {
    # Hyprland
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
  };
}
