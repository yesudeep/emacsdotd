;; Tab completion.
;; (add-to-list 'load-path "~/.emacs.d/plugins/nxhtml/util")
;; (require 'tabkey2)
;; (tabkey2-mode t)

;; Anything
;; (add-to-list 'load-path "~/.emacs.d/plugins/anything-config")
;; (require 'anything)
;; (require 'anything-config)
;; (require 'anything-extension)

;; Find recursive
;; (require 'find-recursive)

;; ***************************************************************************
;; Auto-complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete)
(require 'auto-complete-config)

;; Configuration
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(setq ac-auto-start 2)
(setq ac-dwim t)

;; Keybindings
(define-key ac-completing-map "\M-n" 'ac-next)
(define-key ac-completing-map "\M-p" 'ac-previous)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; Mode hooks
(add-hook 'python-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
