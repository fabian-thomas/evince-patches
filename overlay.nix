(final: prev: {
  evince = prev.evince.overrideAttrs (old: rec {
    pname = old.pname + "-patched";
    version = "46.3";

    src = prev.fetchurl {
      url = "mirror://gnome/sources/evince/${prev.lib.versions.major version}/${old.pname}-${version}.tar.xz";
      sha256 = "sha256-vA0dQbnX/8di6Z0qv6+sv3RRgvCzHYbbXuyMZ/XzAGs=";
    };

    patches = (old.patches or []) ++ [
      ./patches/0-vim-like-bindings.patch
      ./patches/add-annotation-right-click.patch
      ./patches/add-keyboard-binding-to-toggle-menu-bar.patch
      ./patches/add-save-action-and-make-default.patch
      ./patches/add-web-search-action.patch
      ./patches/custom-commands.patch
      ./patches/initially-hide-menu-bar.patch
      # ./patches/sync-page.patch
      ./patches/zathura-like.patch
    ];

    # If applying the patches fails try with a higher fuzz value
    # --fuzz is similar to -C
    patchFlags = [ "-p1" "--fuzz=3" ];
  });
})
