{ inputs, config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "apoxer";
    userEmail = "allenallen7731@gmail.com";
  };
}
