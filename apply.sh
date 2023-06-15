#!/usr/bin/env bash
shopt -s extglob
# -C 0 makes sure that some patches get applied even though the context
# does not perfectly match
cd evince
git am -3 -C 0 ../patches/!(sync-page.patch)
