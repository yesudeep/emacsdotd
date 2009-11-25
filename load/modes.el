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
;; Zencoding mode (from the nxhtml bzr repo)

(add-to-list 'load-path "~/.emacs.d/plugins/nxhtml/util")
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Automatically start on any markup modes.
