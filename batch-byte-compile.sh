#!/bin/sh
# Requires tree and grep installed.

emacs -batch -f batch-byte-compile `tree -if | grep "[.]el$"`


