;; URL: http://github.com/yesudeep/emacsdotd

;; ***************************************************************************
;; Elisp modules root directory
;; ----------------------------
;;

(setq emacsdotd-root-dir (file-name-directory
                          (or (buffer-file-name) load-file-name)))


;; ***************************************************************************
;; Python path and version.
;; ------------------------
;;

(setenv "PYTHONPATH" (concat (getenv "PYTHONPATH")
                             ":" (expand-file-name (concat emacsdotd-root-dir "/plugins/pymacs"))
                             ":" (expand-file-name (concat emacsdotd-root-dir "/modes/python-mode"))
                             ":" (expand-file-name (concat emacsdotd-root-dir "/plugins/ropemode"))
                             ))

;; ***************************************************************************
;; Load-path
;; ---------
;;

(add-to-list 'load-path emacsdotd-root-dir)

;; Add all these subdirectories.
(progn (cd emacsdotd-root-dir)
       (normal-top-level-add-subdirs-to-load-path))
(progn (cd (concat emacsdotd-root-dir "/color-themes"))
       (normal-top-level-add-subdirs-to-load-path))
(progn (cd (concat emacsdotd-root-dir "/plugins"))
       (normal-top-level-add-subdirs-to-load-path))
(progn (cd (concat emacsdotd-root-dir "/modes"))
       (normal-top-level-add-subdirs-to-load-path))


;; ***************************************************************************
;; Load these preferences
;; ----------------------
;;
;; Please load the hc-ido-smex library last.

(load-library "hc-colors")
(load-library "hc-modes")
(load-library "hc-prefs")
(load-library "hc-typing-pairs")
(load-library "hc-completion")
(load-library "hc-misc")
(load-library "hc-ido-smex")


;; ***************************************************************************
;; Custom hooks for the window frame
;; ---------------------------------
;; Two new separate hooks for the creation of window-system and tty (console) frames.
;; This is used to run different code for console and window-system.
;; See colors.el for example.
;;

(defvar after-make-console-frame-hooks '()
  "Hooks to run after creating a new TTY frame")

(defvar after-make-window-system-frame-hooks '()
  "Hooks to run after creating a new window-system frame")

(defun run-after-make-frame-hooks (frame)
  "Selectively run either `after-make-console-frame-hooks' or
`after-make-window-system-frame-hooks'"
  (select-frame frame)
  (run-hooks (if window-system
                 'after-make-window-system-frame-hooks
               'after-make-console-frame-hooks)))

(add-hook 'after-make-frame-functions
          'run-after-make-frame-hooks)

(add-hook 'after-init-hook
          (lambda ()
            (run-after-make-frame-hooks (selected-frame))))


;; ***************************************************************************
;; Automatically recompile the emacs init file on buffer-save or exit
;; ------------------------------------------------------------------
;;

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

