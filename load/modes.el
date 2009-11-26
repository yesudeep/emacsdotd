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
(define-key zencoding-mode-keymap (kbd "<tab>") 'zencoding-expand-line)

;;(define-key zencoding-mode-keymap (kbd "C-e") 'zencoding-expand-line)

;; (if zencoding-mode-keymap 
;;  (progn
;;    (setq zencoding-mode-keymap (make-sparse-keymap))
;;    (define-key zencoding-mode-keymap (kbd "C-e") 'zencoding-expand-line)))

;; ***************************************************************************
;; Textmate mode.
(add-to-list 'load-path "~/.emacs.d/modes/textmate-mode")
(require 'textmate)
(textmate-mode)
