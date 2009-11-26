#!/bin/sh
# Requires tree and grep installed.

emacs -batch -f batch-byte-compile `tree -if | grep "[.]el$"`
cd ~/.emacs.d/modes/org-mode/ && make -j 4 && cd $HOME


