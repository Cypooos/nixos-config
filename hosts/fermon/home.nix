{
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "coda"; 
    homeDirectory = "/home/coda";
    sessionVariables = { EDITOR = "code --wait"; };
  };

    programs.kitty.enable = true; 
    wayland.windowManager.hyprland = {
        enable = true;

        plugins = [
            inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
        ];

        settings = {

            decoration = {
                rounding=8;
                blur=0;
                drop_shadow=0;
                shadow_range=60;
                "col.shadow"="0x66000000";
            };

            general = {
                sensitivity=1;
                main_mod="ALT";

                gaps_in=6;
                gaps_out=12;
                border_size=4;
                "col.active_border"="0xffb072d1";
                "col.inactive_border"="0xff292a37";

                damage_tracking="full";
            };

            animations = {
                enabled = true;
                first_launch_animation = true;
                workspace_wraparound = true;
            };

            "$mod" = "SUPER";

            bindm = [
                # mouse movements
                "$mod, mouse:272, movewindow"
                "$mod, mouse:273, resizewindow"
                "$mod ALT, mouse:272, resizewindow"
                "$mod,1,workspace,1"
                "$mod,2,workspace,2"
                "$mod,3,workspace,3"
                "$mod,4,workspace,4"
                "$mod,5,workspace,5"
                
                "$mod,Return,exec,bash"
                "$mod,f,exec,firefox"
                "$mod,q,killactive,"
                "$mod,F11,fullscreen,0"

                "$mod,h,movefocus,l"
                "$mod,l,movefocus,r"
                "$mod,k,movefocus,u"
                "$mod,j,movefocus,d"
            ];
        };
    };
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.


  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.cowsay
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.c
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  programs.bash = {
    enable = true;
    bashrcExtra = "eval \"$(direnv hook bash)\"";
    shellAliases = {
      g = "git";
      "..." = "cd ../..";
    };
  };

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
