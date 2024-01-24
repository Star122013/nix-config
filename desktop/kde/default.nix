{ pkgs, ... }: {
    home.packages = with pkgs; [
        whitesur-kde
        latte-dock
    ];
}