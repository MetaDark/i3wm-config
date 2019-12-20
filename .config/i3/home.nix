{ config, pkgs, ... }:

{
  imports = [
    ../../../alacritty/.config/alacritty/home.nix
  ];

  # TODO: Use Home Manager to manage X session
  # xsession = {
  #   enable = true;
  #   windowManager.i3 = {
  #     enable = true;
  #     package = pkgs.i3-gaps;
  #   };
  # };

  home.packages = with pkgs; [
    blueman # TODO: Run as service
    dunst # TODO: Run as service
    feh # TODO: Use services.random-background instead
    firefox
    font-awesome_5
    keepassxc # TODO: Run as service
    liferea
    light
    pavucontrol
    polybarFull # TODO: Run as service
    python3
    rofi
    scrot
    sound-theme-freedesktop
    xcwd
    xorg.xdpyinfo
  ];

  services.compton = {
    enable = true;
    backend = "glx";
    shadow = true;
    shadowExclude = [
      "class_i = 'i3-frame'" # titlebars
      "name = 'Polybar tray window'" # polybar tray
      "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'" # background windows in tabbed layout
    ];
    fade = true;
    fadeDelta = 10; # 100 steps per second
    fadeSteps = [ "0.0666" "0.0444" ]; # ~150ms ~225ms
    extraOptions = ''
      clear-shadow = true;
      blur-background = true;
      no-fading-destroyed-argb = true;
    '';
  };
}