#!/bin/env bash

REPODIR=$HOME/Repos/portable
cd $REPODIR
ls -1A | grep -v .git | grep -v linker.sh | while read -r line; do ln -s $REPODIR/$line $HOME/$line; done
