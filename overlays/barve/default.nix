{...}: self: super: {
      google-chrome = super.google-chrome.override {
        commandLineArgs =
          "--enable-features=UseOzonePlatform --ozone-platform=wayland --proxy-server='https=127.0.0.1:20171;http=127.0.0.1:20171'";
      };
    }
