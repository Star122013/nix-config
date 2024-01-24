{pkgs, ...}: {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhsWithPackages (ps: with ps; [ rustup zlib openssl.dev pkg-config ]);
      extensions = with pkgs.vscode-extensions; [
        # theme
        dracula-theme.theme-dracula
        pkief.material-icon-theme
        # direnv
        mkhl.direnv
        # cmake
        twxs.cmake
        # rust
        # rust-lang.rust-analyzer
        # golang
        golang.go
        # python
        # ms-python.python
        # ms-python.vscode-pylance
        # ms-pyright.pyright
        # nix
        bbenoist.nix
        # markdown
        yzhang.markdown-all-in-one
        yzhang.dictionary-completion
        # docker
        ms-azuretools.vscode-docker
        # remote ssh
        ms-vscode-remote.remote-ssh
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
              {
                name = "remote-ssh-edit";
                publisher = "ms-vscode-remote";
                version = "0.47.2";
                sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
              }
              # rust
              {
                name = "rust-analyzer";
                publisher = "rust-lang";
                version = "0.4.1809";
                sha256 = "g0ht78AdMjVWoTV5Huqf7fzNZ9na9CO6PQMKeNAC/iU=";
              }
              {
                name = "vscode-language-pack-zh-hans";
                publisher = "MS-CEINTL";
                version = "1.85.2024011709";
                sha256 = "DH+sIj+14aEgWcUGOwVN27OYH3JkdVix3fULSrnxuIc=";
              }
            ];
    };
}