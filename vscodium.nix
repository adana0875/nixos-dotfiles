{ pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        # vscodium
        (vscode-with-extensions.override {
            vscode = vscodium;
            vscodeExtensions = pkgs.nix4vscode.forVscode [
                "golang.go"
                "jnoortheen.nix-ide"
                "teabyii.ayu"
                "mvllow.rose-pine"
                "thang-nm.flow-icons"
            ];
        })
    ];
}
