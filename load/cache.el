;; Caching all the elisp code in the .emacs.d directory.

(add-to-list 'load-path "~/.emacs.d/plugins/elisp-cache")

(let ((nfsdir "~/.emacs.d/")
      (cachedir "~/.emacs.d/cache"))
  (setq load-path (append load-path (list cachedir nfsdir)))
  (require 'elisp-cache)
  (elisp-cache nfsdir cachedir)
;;      ;; Or maybe this instead, if the directory contains more than
;;      ;; Elisp code:
;;         ; (elisp-cache nfsdir cachedir
;;         ; '((:filelist "foo.el" "bar/baz.el")))
)
;;      (require 'some-spiffy-corporate-module)
