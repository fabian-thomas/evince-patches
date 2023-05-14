#!/usr/bin/env sh
# dest is a dynamic identifier that needs to be queried from somewhere.
# I don't remember how I did that.
gdbus call --session --dest :1.639 --object-path /org/gnome/evince/Window/0 --method org.gnome.evince.Window.SyncPage 2
