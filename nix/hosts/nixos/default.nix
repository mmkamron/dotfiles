{ config, inputs, pkgs, ... }:

let
  user = "mmkamron";
  sshKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOk8iAnIaa1deoc7jw8YACPNVka1ZFJxhnU4G74TmS+p"
  ];
in {
  imports = [
    ../../modules/nixos/disk-config.nix
    ../../modules/shared
  ];

  time.timeZone = "Asia/Tashkent";

  networking = {
    networkmanager.enable = true;
  };

  nix = {
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  programs = {
    zsh.enable = true;
  };

  services = {
    displayManager.defaultSession = "none+bspwm";
    openssh.enable = true;
  };

  users.users = {
    ${user} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = sshKeys;
    };
  };

  environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "25.05";
}
