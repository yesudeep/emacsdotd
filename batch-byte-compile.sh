#!/bin/sh
# Requires tree and grep installed.


#emacs -batch -f batch-byte-compile `tree -if | grep "[.]el$"`

emacs -batch -f batch-byte-compile *.el load/*.el modes/*.el 
emacs -batch -f batch-byte-compile modes/js2/js2.el

cd ~/.emacs.d/modes/org-mode/ && make && cd ~/.emacs.d
cd ~/.emacs.d/modes/predictive/ && make && cd ~/.emacs.d

