{ config, pkgs, ... }:
{

home.username = "jacob";
home.homeDirectory = pkgs.lib.mkDefault "/home/jacob}";


fonts.fontconfig.enable = true;

home.packages = with pkgs; [
    neofetch
    tree
    fira-code-nerdfont
];


programs.git = {
  enable = true;
  userName = "jacob";
  userEmail = "jacobchisholm1010@gmail.com";
};

programs.starship = {
  enable = true;
};

programs.zsh = {
  enable = true;
  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "sudo" "archlinux" ];
    theme = "robbyrussel";
  };
};

programs.tmux = {
  enable = true;
  clock24 = true;
  extraConfig = builtins.readFile ./config/tmux/tmux.conf;
};

programs.neovim = {
  enable = true;
  defaultEditor = true;
  viAlias = true;
  plugins = with pkgs.vimPlugins; [
    nvim-lspconfig
    nvim-treesitter.withAllGrammars
  ];
};

programs.gh.enable = true;

programs.fastfetch.enable = true;

home.stateVersion = "24.05";

programs.home-manager.enable = true;

}
