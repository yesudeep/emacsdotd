;; ***************************************************************************
;; General preferences.
;; ***************************************************************************

;; Delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Enable the use of the mouse-wheel.
(mouse-wheel-mode t)

;; Do not make any backup files.
(setq make-backup-files nil)

;; Disable indentation using tabs.
(setq-default indent-tabs-mode nil)

;; Use 4 spaces for indentation.
(setq standard-indent 4)
(setq tab-width 4)
(setq-default c-basic-offset 4)
(setq-default py-indent-offset 4)

;; Automatically indent on return.
;; See http://www.emacswiki.org/emacs-en/AutoIndentation
;;
;;(defun set-newline-and-indent ()
;;  (local-set-key (kbd "RET") 'newline-and-indent))
;;(add-hook 'c-mode 'set-newline-and-indent)
;;(add-hook 'java-mode 'set-newline-and-indent)

(define-key global-map (kbd "RET") 'newline-and-indent)

;; Automatically indent code when pasted.
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))


;; Highlight the current line.
(global-hl-line-mode 1)

;; Show the line number in the minibuffer.
(line-number-mode 1)

;; Show the column number in the minibuffer.
(column-number-mode 1)

;; Fill column width is (right margin)
(setq-default fill-column 75)

;; Automatically fill (right margin) bleed.
;; Do not autofill.  This screws up HTML content.
;;(setq auto-fill-mode 1)

;; Kill entire line with C-k and use C-S-backspace for killing from beginning
(defun kill-and-join-forward (&optional arg)
  "If at end of line, join with following; otherwise kill line.
    Deletes whitespace at join."
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (delete-indentation t)
    (kill-line arg)))
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-S-<backspace>") 'kill-and-join-forward)

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
