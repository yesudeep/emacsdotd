;; Various modes.


;; ***************************************************************************
;; YAML Major Mode.
;;
(add-to-list 'load-path "~/.emacs.d/modes/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

;; Enter and indent.
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; ***************************************************************************
;; Zencoding mode

;;(add-to-list 'load-path "~/.emacs.d/plugins/nxhtml/util")
(add-to-list 'load-path "~/.emacs.d/plugins/zencoding")

(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Automatically start on any markup modes.
(add-hook 'html-mode-hook 'zencoding-mode)
(define-key zencoding-mode-keymap (kbd "C-<tab>") 'zencoding-expand-line)

;; (if zencoding-mode-keymap 
;;  (progn
;;    (setq zencoding-mode-keymap (make-sparse-keymap))
;;    (define-key zencoding-mode-keymap (kbd "C-e") 'zencoding-expand-line)))

;; ***************************************************************************
;; Textmate mode.
(add-to-list 'load-path "~/.emacs.d/modes/textmate-mode")
(require 'textmate)
(textmate-mode)

;; ***************************************************************************
;; Org-mode
(setq load-path (cons "~/.emacs.d/modes/org-mode/lisp" load-path))
(setq load-path (cons "~/.emacs.d/modes/org-mode/contrib/lisp" load-path))

;; ***************************************************************************
;; Markdown-mode
(add-to-list 'load-path "~/.emacs.d/modes/markdown-mode")

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files." t)
(setq auto-mode-alist
      (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode) auto-mode-alist))


;; ***************************************************************************
;; SASS Mode
(add-to-list 'load-path "~/.emacs.d/modes/haml/extra")
(require 'sass-mode)

;; ***************************************************************************
(add-to-list 'load-path "~/.emacs.d/modes/js2-mode")
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
