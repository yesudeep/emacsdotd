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
;; YASnippet
;; Snippets for Emacs.
;; Using Yasnippet
;; http://code.google.com/p/yasnippet/

(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")

(require 'yasnippet)
;; Don't map TAB to yasnippet, we want to trigger it using auto-complete.el
(setq yas/trigger-key (kbd "C-c <kp-multiply>"))
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")


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
(add-hook 'python-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols 'ac-source-filename 'ac-source-files-in-current-dir)))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))

;; ***************************************************************************
;; Py-complete and pymacs completion
;; Follow this:
;; http://www.rwdev.eu/articles/emacspyeng
;; Install pymacs
;; Copy python-mode.el (launchpad) and pycomplete.el to load path
;;    (these are already in here.)
;; One additional step:
;;    Copy ~/.emacs.d/modes/python-mode/pycomplete.py to your PYTHONPATH
;;    if the following does not work.

(setenv "PYTHONPATH" "~/.emacs.d/modes/python-mode/")

(add-to-list 'load-path "~/.emacs.d/plugins/Pymacs-0.24-beta1")
(require 'pycomplete)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
