My emacs configuration

Clone using:
      
    $ git clone git://github.com/yesudeep/emacsdotd.git ~/.emacs.d

Update the submodules recursively (requires git 1.6.5.3 or higher):
    
    $ git submodule update --init --recursive

And then put these lines in your ~/.emacs file::

    ;; Make sure this file executes.
    (load-file "~/.emacs.d/init.el")


