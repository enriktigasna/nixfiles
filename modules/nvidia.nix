{ pkgs, lib, config, ... }: {

  options = {
    nvidia.enable = 
      lib.mkEnableOption "enables module1";
  };

  config = lib.mkIf config.nvidia.enable {
    # Proprietary nvidia drivers
    services.xserver.videoDrivers = ["nvidia"];
  
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  hardware.opengl = {
    enable = true;
  };
}
