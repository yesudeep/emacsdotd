;; Various modes.
;; Follow this for python completion.
;; http://www.enigmacurry.com/2009/01/21/autocompleteel-python-code-completion-in-emacs/

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
;; (add-to-list 'load-path "~/.emacs.d/modes/js2-mode/build")
;; (add-to-list 'load-path "~/.emacs.d/modes/js2")
;;(autoload 'js2-mode "js2" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; ***************************************************************************
;; Predictive mode

(add-to-list 'load-path "~/.emacs.d/modes/predictive")
(add-to-list 'load-path "~/.emacs.d/modes/predictive/texinfo")
(add-to-list 'load-path "~/.emacs.d/modes/predictive/html")
(add-to-list 'load-path "~/.emacs.d/modes/predictive/latex")

(require 'predictive)

;; ***************************************************************************
;; Python mode
;; See http://github.com/EnigmaCurry/emacs/
;; ryan-python.el

(require 'python)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
	    interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
		    (set-variable 'py-indent-offset 4)
		    (set-variable 'py-smart-indentation nil)
		    (set-variable 'indent-tabs-mode nil)
		    ;;(highlight-beyond-fill-column)
                    (define-key python-mode-map "\C-m" 'newline-and-indent)
		    ;(pabbrev-mode)
		    ;(abbrev-mode)
	 )
      )
)

;; Autofill inside of comments
(defun python-auto-fill-comments-only ()
  (auto-fill-mode 1)
  (set (make-local-variable 'fill-nobreak-predicate)
       (lambda ()
         (not (python-in-string/comment)))))
(add-hook 'python-mode-hook
          (lambda ()
            (python-auto-fill-comments-only)))


;;Autofill comments
;;TODO: make this work for docstrings too.
;;      but docstrings just use font-lock-string-face unfortunately
(add-hook 'python-mode-hook
          (lambda ()
            (auto-fill-mode 1)
            (set (make-local-variable 'fill-nobreak-predicate)
                 (lambda ()
                   (not (eq (get-text-property (point) 'face)
                            'font-lock-comment-face))))))

;; (brm-init)
;; (require 'pycomplete)
