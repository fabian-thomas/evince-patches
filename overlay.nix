(final: prev: {
  evince = prev.evince.overrideAttrs (old: rec {
    version = old.version + "-patched";

    patchesSrc = prev.fetchFromGitHub {
      owner = "fabian-thomas";
      repo = "evince-patches";
      rev = old.version;
      sha256 = "sha256-zECnPjTCv4EBt/0Al9B8+/lCIGrX3E6Jla/voxaw3YQ=";
    };

    patches = (old.patches or []) ++ [
      "${patchesSrc}/patches/0-vim-like-bindings.patch"
      "${patchesSrc}/patches/add-annotation-right-click.patch"
      "${patchesSrc}/patches/add-keyboard-binding-to-toggle-menu-bar.patch"
      "${patchesSrc}/patches/add-save-action-and-make-default.patch"
      "${patchesSrc}/patches/add-web-search-action.patch"
      "${patchesSrc}/patches/custom-commands.patch"
      "${patchesSrc}/patches/initially-hide-menu-bar.patch"
      # "${patchesSrc}/patches/sync-page.patch"
      "${patchesSrc}/patches/zathura-like.patch"
    ];

    # If applying the patches fails try with a higher fuzz value
    # --fuzz is similar to -C
    patchFlags = [ "-p1" "--fuzz=3" ];
  });
})
