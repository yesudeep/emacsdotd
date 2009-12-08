;; Install color themes and choose one.

(require 'color-theme)

(require 'color-theme-tango)
(require 'zenburn)
(require 'color-theme-subdued)
(require 'color-theme-less)
(load-file "~/.emacs.d/color-themes/color-theme-github/color-theme-github.el")
(load-file "~/.emacs.d/color-themes/color-theme-twilight/color-theme-twilight.el")
(load-file "~/.emacs.d/color-themes/color-theme-blackboard.el")
(load-file "~/.emacs.d/color-themes/color-theme-railscasts/color-theme-railscasts.el")
(load-file "~/.emacs.d/color-themes/color-theme-ir-black/color-theme-ir-black.el")


;; ***************************************************************************
;; Pick your theme.
;; Themes made for GUI don't always look good in the console.
;; So choose a different theme when in the console or none at all, therefore,
;; enabling the default theme which works best in the console.
;; (if (eq (symbol-value 'window-system) nil)
;;     ;; In the console:
;;     ;;(color-theme-tty-dark)
;;     nil

;;   ;; In the GUI:
;; Light
;;(color-theme-github)

;; Dark
;;(color-theme-tango)
;;(color-theme-zenburn)
;;(color-theme-subdued)    ;; Has problems with contrast when writing comments.
;;(color-theme-less)
;;(color-theme-twilight)     ;; Good contrast and readability.
;;)

(set-variable 'color-theme-is-global nil)
(add-hook 'after-make-window-system-frame-hooks
          ;; Light
          ;;'color-theme-emacs-nw
          ;;'color-theme-github

          ;; Dark
          ;;'color-theme-tango
          ;;'color-theme-zenburn
          ;;'color-theme-subdued
          ;;'color-theme-less
          ;;'color-theme-blackboard
          ;;'color-theme-twilight
          ;;'color-theme-railscasts
          'color-theme-ir-black
          )
(add-hook 'after-make-console-frame-hooks
          ;;'color-theme-tty-dark
          'color-theme-emacs-nw
          )
