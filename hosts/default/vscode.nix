{pkgs, ...}: let
  extensions =
    (with pkgs.vscode-extensions; [
      golang.go
      rust-lang.rust-analyzer
      # fill-labs.dependi
      ms-python.python
      ms-python.debugpy
      bbenoist.nix
      tamasfe.even-better-toml
      tomoki1207.pdf
      nvarner.typst-lsp
      ms-vscode.cpptools
      mhutchie.git-graph
      # bianxianyang.htmlplay
      ecmel.vscode-html-css
      # pest.pest-ide-tools
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
