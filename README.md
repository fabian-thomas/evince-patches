# Why this fork?

![how evince looks without the menu bar](no-menu-bar.png)

The selling point of Evince for me is the previewing functionality.  You can
hover over any reference in a PDF and it will preview what is going on at the
referenced part.  I don't know any other PDF viewer that has that feature.
Porting this feature to Zathura would be the better way to go, but would require
some engineering.  This might be some project I will look into in the future but
for now I came to the conclusion that Evince is just the best for me.

So my goal with this repo is to make Evince behave more like Zathura.
That is why this repo contains patches for the following changes to upstream:

- The menu bar (or toolbar) can be hidden via a keyboard shortcut. This is
  `ALT-m` or F12 by default.
- Hide the menu bar initially.
- Some keyboard shortcuts are added/modified/removed. Examples are `J` and `K`
  for page up/down, or `CTRL+o` for going back in history.

All patches can be applied to your liking. And of course, you can modify the
code after applying any patches. Modifications to keyboard shortcuts can be done
in the file `shell/ev-application.c`.

You can expect me to update the patches when they are broken by upstream changes,
at least as long as no other PDF viewer has the above mentioned feature.

The full-patches branch has the code I run locally. Every patch is applied there,
so you may just clone that branch so that you don't need to apply patches
yourself.

## Applying Patches

First you need to get the latest evince code. Then you need to clone this patches
repo. After that you can start applying any patches you would like to have
included in your build. Currently, they do not have to be applied in any specific
order. I suggest first applying all patches, and only after that changing stuff
in the code by hand.
For building instructions refer to the [building section](#building).
``` sh
git clone 'https://gitlab.gnome.org/GNOME/evince'
cd evince
git clone 'https://github.com/fabian-thomas/cleaner-evince'
git am cleaner-evince/patches/add-keyboard-binding-to-toggle-menu-bar.patch
git am ...
git am ...
# patch the code further (e.g., modify keybindings)
# now build and install (see below)
```

## Patches

### Hiding the menu bar by default

`initially-hide-menu-bar.patch`

This patch hides the menu bar initially.

## Building

You need to choose the correct prefix for your system. For most systems this
should be `/usr`. Note that these instructions only update the evince binary, so
this is based on the assumption that your libraries and other files of evince
should already be up to date. I'm not sure if this assumption breaks with
non-rolling-release distributions. If so check how you can install the compiled
files. I guess that should not be to hard.
```sh
meson setup --prefix /usr build
meson compile -C build
sudo cp build/shell/evince "$(which evince)"
```
