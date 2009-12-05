;; URL: http://github.com/yesudeep/emacsdotd

;; Add these directories to the load path.
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/load")
(add-to-list 'load-path "~/.emacs.d/modes")
(add-to-list 'load-path "~/.emacs.d/modes/python-mode")

;; (load-file "~/.emacs.d/load/cache.el")
;;(load-file "~/.emacs.d/load/colors.el")
(load-file "~/.emacs.d/load/modes.el")
(load-file "~/.emacs.d/load/prefs.el")
(load-file "~/.emacs.d/load/typing-pairs.el")
(load-file "~/.emacs.d/load/snippets.el")
(load-file "~/.emacs.d/load/completion.el")
(load-file "~/.emacs.d/load/ido-smex.el")  ;; Should be loaded last.

;; Recompile the init file (~/.emacs) on buffer-save or emacs-exit.
(defun byte-compile-user-init-file ()
  (let ((byte-compile-warnings '(unresolved)))
        ;; in case compilation fails, don't leave the old .elc around:
        (when (file-exists-p (concat user-init-file ".elc"))
          (delete-file (concat user-init-file ".elc")))
        (byte-compile-file user-init-file)
        ;; (message "%s compiled" user-init-file)
        ))
(defun my-emacs-lisp-mode-hook ()
  (when (equal buffer-file-name user-init-file)
    (add-hook 'after-save-hook 'byte-compile-user-init-file t t)))
;; (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)
(add-hook 'kill-emacs-hook 'byte-compile-user-init-file t t)
