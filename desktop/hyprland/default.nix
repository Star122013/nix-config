_ : {
    home.file.".config/hypr" = {
        source = ./config/hypr;
        recursive = true;
    };
    home.sessionVariables = {
        GTK_IM_MODULE = "fcitx5";
        QT_IM_MODULE = "fcitx5";
        XMODIFIERS = "@im=fcitx5";
    };
}