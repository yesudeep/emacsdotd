#!/bin/sh

sudo easy_install mercurial

# install rope
cd ~/.emacs.d/plugins
sudo easy_install rope
cd ropemode
ln -s ../ropemode/ropemode ropemode
sudo easy_install ropemacs
cd ~/.emacs.d/plugins
sudo easy_install pymacs

echo "Please copy ~/.emacs.d/modes/python-mode/pycomplete.py to your PYTHONPATH"

#echo "export PYTHONPATH=~/.emacs.d/modes/python-mode:\$PYTHONPATH" >> ~/.profile

