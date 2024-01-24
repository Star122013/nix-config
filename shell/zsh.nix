{config, lib, ...} : 
    
{
    programs.zsh = {
         enable = true;
         shellAliases = {
            ll = "ls -l";
            update = "sudo -E nixos-rebuild switch";
            httpproxy = "export http_proxy=http://127.0.0.1:20171";      
            httpsproxy = "export https_proxy=http://127.0.0.1:20171";
                };
        oh-my-zsh = {
            enable = true;
            plugins = ["git"];
            theme = "ys";
        };
        };
}
        