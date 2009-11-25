
;; Should be at the very end.
;; We want IDO.
(require 'ido)
(ido-mode t)

;; Smex
(require 'smex)
(smex-initialize)  ;; This should run after everything has loaded.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c M-x") 'smex-update-and-run)
;; This is the old M-x
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
