#!/bin/sh
# Requires tree and grep installed.



#emacs -batch -f batch-byte-compile `tree -if | grep "[.]el$"`

emacs -batch -f batch-byte-compile *.el load/*.el 

cd ~/.emacs.d/modes/js2-mode/ && make EMACS22=emacs EMACS23=emacs
cd ~/.emacs.d/modes/org-mode/ && make clean && make -j 4 && cd
