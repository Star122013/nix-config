{
  description = "Hyy's NixOS Flake";

   nixConfig = {
    # override the default substituters
    substituters = [
      # cache mirror located in China
      # status: https://mirror.sjtu.edu.cn/
      # "https://mirror.sjtu.edu.cn/nix-channels/store"
      # status: https://mirrors.ustc.edu.cn/status/
      # "https://mirrors.ustc.edu.cn/nix-channels/store"

      "https://cache.nixos.org"
      # hyprland cache server
      "https://hyprland.cachix.org"
      # nix community's cache server
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      # nix community's cache server public key
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" 
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="

    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    ags.url = "github:Aylur/ags";
    waybar.url = "github:Alexays/Waybar";
  };
  outputs = { self, nixpkgs, home-manager, hyprland, ags, waybar, ... }@inputs: {
    nixosConfigurations = {
      "nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };  # 将 inputs 中的参数传入所有子模块
        modules = [
          (args: { nixpkgs.overlays = import ./overlays args; })
             
          {
            # given the users in this list the right to specify additional substituters via:
            #    1. `nixConfig.substituers` in `flake.nix`
            nix.settings.trusted-users = [ "hyy" ];
          }
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.hyy = import ./home;
            home-manager.extraSpecialArgs = inputs;
          }
          ./system
          ./desktop
          ./flatpak
          ./virtualisation
          ./nvidia
        ];
      };
    };
  };
}