{pkgs, ...}:{
    home.packages = with pkgs;[
        jetbrains.goland
        jetbrains.pycharm-professional
        jetbrains.clion
    ];
}