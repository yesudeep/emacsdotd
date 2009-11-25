
;; Add these directories to the load path.
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/smex")

(load-file "~/.emacs.d/load/prefs.el")
(load-file "~/.emacs.d/load/ido-smex.el")  ;; Should be loaded last.
