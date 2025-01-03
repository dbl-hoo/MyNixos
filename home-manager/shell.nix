{
  pkgs, ...
}:

let 
  myAliases = {
    sv = "sudo nvim";
    nr = "nh os switch --hostname nixos /home/kirkham/MyNixos";
    nu = "nh os switch --hostname nixos --update /home/kirkham/MyNixos";
    ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
    cat = "bat";
    ll = "eza -lh --icons --grid --group-directories-first";
    la = "eza -lah --icons --grid --group-directories-first";
    ".." = "cd ..";
    "..." = "cd ../..";
    c = "clear";
    ff = "fastfetch";
    pf = "pfetch";
    lt = "eza -a --tree --icons";
		dot = "cd /home/kirkham/MyNixos";
    gs = "git status";
    ga = "git add";
    gc = "git commit -m";
    gp = "git push";
    gpl = "git pull";
    gst = "git stash";
    gsp = "git stash; git pull";
    gcheck = "git checkout";
  };

in

{
  programs = {
    bash = {
      enable = true;
      shellAliases = myAliases;
    };

    zsh = {
      enable = true;
      shellAliases = myAliases;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      initExtra = ''
        if [ -n "$DISPLAY" ] || [ -n "$WAYLAND_DISPLAY" ]; then
          pfetch
          source /home/kirkham/p10k.zsh
        fi
      '';
      plugins = [
        {
          name = "powerlevel10k"; 
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];
    };
  };
}
