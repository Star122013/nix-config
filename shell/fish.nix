{config, pkgs, ...} : {
    programs.fish = {
        enable =true;
        shellInit = ''
            neofetch
        '';
        shellAliases = {
            ll = "ls -l";
            update = "sudo -E nixos-rebuild switch";
            proxy = "export http_proxy=http://127.0.0.1:20171      export https_proxy=http://127.0.0.1:20171";
        };
        plugins = [
            {name = "z"; src = pkgs.fishPlugins.z.src; }
            {name = "fzf"; src = pkgs.fishPlugins.fzf-fish.src;}
            {name = "autopair"; src = pkgs.fishPlugins.autopair.src;}
        ];
    };
}