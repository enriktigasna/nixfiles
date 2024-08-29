{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hyprland.nix
    ./nvidia.nix
  ];
}
