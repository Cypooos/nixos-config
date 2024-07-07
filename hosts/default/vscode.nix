{pkgs, ...}: let
  extensions =
    (with pkgs.vscode-extensions; [
      golang.go
      rust-lang.rust-analyzer
      serayuzgur.crates
      ms-python.python
      # bbenoist."Nix"
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
