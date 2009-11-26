;; Install color themes and choose one.

(add-to-list 'load-path "~/.emacs.d/color-themes")
(add-to-list 'load-path "~/.emacs.d/color-themes/color-theme-github")

(require 'color-theme)


(load-file "~/.emacs.d/color-themes/color-theme-github/color-theme-github.el")
(color-theme-github)
