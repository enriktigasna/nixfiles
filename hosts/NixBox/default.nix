{ config, pkgs, ... }:

{
  imports =
  [
    ./hardware-configuration.nix
  ];

  hyprland.enable = true;
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "NixBox";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
  
  nix.settings.experimental-features = [ "flakes" "nix-command" ];

  # Locales
  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Set zsh for all users
  users.defaultUserShell = pkgs.zsh;

  # maxim user TODO: Extract this
  users.users.maxim = {
    isNormalUser = true;
    description = "maxim";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Programs TODO: Extract this
  programs.firefox = {
    enable = true;
    preferences = {
      "widget.use-xdg-desktop-portal.file-picker" = 1;
    };
  };

  # TODO: Extract this
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System packages
  # TODO: Look more into this
  environment.systemPackages = with pkgs; [
     # Cmd utilities
     neovim
     fastfetch
     btop
     wget
     lsd
     fzf
     git
     pciutils

     # Hyprland
     waybar
     dunst
     libnotify
     kitty
     rofi-wayland
     grim
     slurp
     wl-clipboard

     # Home Manager
     home-manager
  ];

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ 
     "Hack"
     "Iosevka"
    ]; })
    fira-sans
  ];

  system.stateVersion = "24.05";

}
