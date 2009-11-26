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

;; Show the line number in the minibuffer.
(line-number-mode 1)

;; Show the column number in the minibuffer.
(column-number-mode 1)

;; Fill column width is (right margin)
(setq-default fill-column 75)

;; Automatically fill (right margin) bleed.
(setq auto-fill-mode 1)

;; Kill entire line with C-k and use C-S-backspace for killing from beginning
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-S-<backspace>") 'kill-line)

;; Inhibit startup message.
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Can have values: (t, 'visit-save, 'visit, nil)
(setq require-final-newline 'visit-save)

;; Move line up.
(defun my-move-line-up() 
  "Move the current line up one."
  (interactive)
  (let ((col (current-column)))
    (save-excursion (next-line)
                    (transpose-lines -1))
    (move-to-column col)))

;; Move line down.
(defun my-move-line-down() 
  "Move the current line down one."
  (interactive)
  (let ((col (current-column)))
    (save-excursion (next-line)
                    (transpose-lines 1))
    (next-line)
    (move-to-column col)))

;; Line movement keybindings.
(global-set-key (kbd "M-<up>") 'my-move-line-up)
(global-set-key (kbd "M-<down>") 'my-move-line-down)

;; Syntax highlighting
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; Make y or n suffice for a yes-or-no question.
(fset 'yes-or-no-p 'y-or-n-p)

;; Turn on parentheses matching.
(show-paren-mode t)
(setq show-paren-style 'mixed)

;; Transient mark mode (show marks visually)
(transient-mark-mode t)

;; Highlight when doing a query replace.
(setq query-replace-highlight t)

;; Default major mode
(setq default-major-mode 'text-mode)

;; Font
;;(setq default-frame-alist '((font . "Monaco")))
