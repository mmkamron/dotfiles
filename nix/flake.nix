{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, config, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
	  pkgs.tmux
	  pkgs.git
	  pkgs.neovim
	  pkgs.fastfetch
	  pkgs.alacritty
	  pkgs.mkalias
	  pkgs.btop
	  pkgs.zoxide
	  pkgs.go
	  pkgs.gopls
	  pkgs.zathura
	  pkgs.maccy
	  pkgs.tldr
	  pkgs.qemu
	  pkgs.ripgrep
	  pkgs.libgccjit
	  pkgs.clang-tools
        ];

      environment.variables =
	{
	  EDITOR = "nvim";
	};

      fonts.packages = [
	(pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })	
      ];

      system.activationScripts.applications.text = let
	env = pkgs.buildEnv {
	  name = "system-applications";
	  paths = config.environment.systemPackages;
	  pathsToLink = "/Applications";
	};
      in
	pkgs.lib.mkForce ''
	# Set up applications.
	echo "setting up /Applications..." >&2
	rm -rf /Applications/Nix\ Apps
	mkdir -p /Applications/Nix\ Apps
	find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
	while read -r src; do
	  app_name=$(basename "$src")
	  echo "copying $src" >&2
	  ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
	done
      '';
      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "x86_64-darwin";

      security.pam.enableSudoTouchIdAuth = true;

      system.defaults = {
	dock.autohide = true;
	finder.FXPreferredViewStyle = "clmv";
	finder.AppleShowAllExtensions = true;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.KeyRepeat = 2;
	screencapture.location = "~/Pictures/screenshots";
	controlcenter.BatteryShowPercentage = true;
	controlcenter.Bluetooth = true;
      };

      system.keyboard.enableKeyMapping = true;
      system.keyboard.remapCapsLockToEscape = true;

    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."mac".pkgs;
  };
}
