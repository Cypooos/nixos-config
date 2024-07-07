{pkgs, ...}: let
  extensions =
    (with pkgs.vscode-extensions; [
      golang.go
      rust-lang.rust-analyzer
      vadimcn.vscode-lldb
      vlanguage.vscode-vlang
      # ...
    ])
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # {...}
    ];

  vscode-with-extensions =
    pkgs.vscode-with-extensions.override {vscodeExtensions = extensions;};
in {
  config = {environment.systemPackages = [vscode-with-extensions];};
}
