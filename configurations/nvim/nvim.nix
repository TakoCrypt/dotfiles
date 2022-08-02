{ pkgs, ... }:
{
  xdg.configFile = {
    "nvim/init.lua".source = ./init.lua;
    "nvim/.luarc.json".source = ./.luarc.json;
    "nvim/lua" = {
      recursive = true;
      source = ./lua;
    };
  };
  home = {
    packages = with pkgs; [
      #Graphical env
      neovide

      #Python and JS integration
      python310Packages.pynvim
      nodePackages.neovim

      #LuaJIT and luarocks
      luajit
      luajitPackages.luarocks

      #LSPs
      nodePackages.bash-language-server
      nodePackages.yaml-language-server
      nodePackages.vscode-langservers-extracted
      haskell-language-server
      sumneko-lua-language-server
      rnix-lsp

      #Linters
      mypy
      python310Packages.flake8

      #Formatters
      stylua
      nixpkgs-fmt
      black
      python310Packages.isort
      nodePackages.prettier
    ];
    sessionVariables = {
      NEOVIDE_MULTIGRID = true;
    };
  };
}
