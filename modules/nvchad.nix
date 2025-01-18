{ inputs, configs, pkgs, ... }:

{
  programs.nvchad = {
    enable = true;
    backup = false;
    chadrcConfig = "
      local M = {}
      M.nvdash = { load_on_startup = true }
      return M
    ";
  };
}
