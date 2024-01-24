{pkgs, ...} : {
    home.packages = with pkgs;[
        bilibili
        microsoft-edge
        google-chrome
        xfce.thunar
        asusctl
        supergfxctl
        hyprpicker
        slurp
        wf-recorder
        wayshot
        imagemagick
        wl-gammactl
        pavucontrol
        swappy
        wlogout
        qq
        swaybg
        nmon
        iotop
        iftop
        flameshot
        devbox

        # misc
        libnotify
        wireguard-tools # manage wireguard vpn manually, via wg-quick
        rofi-bluetooth

        # system call monitoring
        strace # system call monitoring
        ltrace # library call monitoring
        bpftrace # powerful tracing tool
        tcpdump # network sniffer
        lsof # list open files

        # system tools
        lshw
        unzip
        ark
        sysstat
        lm_sensors # for `sensors` command
        ethtool
        pciutils # lspci
        usbutils # lsusb
        hdparm # for disk performance, command
        dmidecode # a tool that reads information about your system's hardware from the BIOS according to the SMBIOS/DMI standard
    ];
     # auto mount usb drives
    services = {
        udiskie.enable = true;
    };

    services = {
        # syncthing.enable = true;
    };
}