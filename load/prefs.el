;; ***************************************************************************
;; General preferences.
;; ***************************************************************************

;; Enable the use of the mouse-wheel.
(mouse-wheel-mode t)

;; Do not make any backup files.
(setq make-backup-files nil)

;; Disable indentation using tabs.
(setq-default indent-tabs-mode nil)

;; Use 4 spaces for indentation.
(setq standard-indent 4)

;; Highlight the current line.
(global-hl-line-mode 1)

;; Show the line number in the minibar.
(line-number-mode 1)

;; Show the column number in the minibar.
(column-number-mode 1)

;; Fill column width is (right margin)
(setq-default fill-column 75)

;; Automatically fill (right margin) bleed.
(setq auto-fill-mode 1)
