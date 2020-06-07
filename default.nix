let
    ihp = builtins.fetchGit {
        url = "https://github.com/digitallyinduced/ihp.git";
        rev = "41f06c73b65cc615d1d310565879acd8c36755b7";
    };
    haskellEnv = import "${ihp}/NixSupport/default.nix" {
        ihp = ihp;
        haskellDeps = p: with p; [
            cabal-install
            base
            wai
            text
            hlint
            p.ihp
        ];
        otherDeps = p: with p; [
            # Native dependencies, e.g. imagemagick
        ];
        projectPath = ./.;
    };
in
    haskellEnv
