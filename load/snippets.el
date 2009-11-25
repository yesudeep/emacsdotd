;; Snippets for Emacs.
;; Using Yasnippet
;; http://code.google.com/p/yasnippet/

(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")

(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")
