(final: prev: {
  evince = prev.evince.overrideAttrs (old: rec {
    version = old.version + "-patched";

    patchesSrc = ./patches;

    patches = (old.patches or []) ++ [
      "${patchesSrc}/0-vim-like-bindings.patch"
      "${patchesSrc}/add-annotation-right-click.patch"
      "${patchesSrc}/add-keyboard-binding-to-toggle-menu-bar.patch"
      "${patchesSrc}/add-save-action-and-make-default.patch"
      "${patchesSrc}/add-web-search-action.patch"
      "${patchesSrc}/custom-commands.patch"
      "${patchesSrc}/initially-hide-menu-bar.patch"
      # "${patchesSrc}/sync-page.patch"
      "${patchesSrc}/zathura-like.patch"
    ];

    # If applying the patches fails try with a higher fuzz value
    # --fuzz is similar to -C
    patchFlags = [ "-p1" "--fuzz=3" ];
  });
})
