;; Various modes.
;; Follow this for python completion.
;; http://www.enigmacurry.com/2009/01/21/autocompleteel-python-code-completion-in-emacs/

;; ***************************************************************************
;; YAML Major Mode.
;;
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

;; Enter and indent.
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; ***************************************************************************
;; Zencoding mode

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
;;

(require 'textmate)
(textmate-mode)


;; ***************************************************************************
;; Org-mode
;;

(add-to-list 'load-path (concat emacsdotd-root-dir "/modes/org-mode/lisp"))
(add-to-list 'load-path (concat emacsdotd-root-dir "/modes/org-mode/contrib/lisp"))


;; ***************************************************************************
;; Markdown-mode
;;

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files." t)
(setq auto-mode-alist
      (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode) auto-mode-alist))


;; ***************************************************************************
;; SASS Mode
;;

(add-to-list 'load-path (concat emacsdotd-root-dir "/modes/haml/extra"))
(require 'sass-mode)

;; ***************************************************************************
;;(autoload 'js2-mode "js2" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; ***************************************************************************
;; Predictive mode

(add-to-list 'load-path (concat emacsdotd-root-dir "/modes/predictive/textinfo"))
(add-to-list 'load-path (concat emacsdotd-root-dir "/modes/predictive/html"))
(add-to-list 'load-path (concat emacsdotd-root-dir "/modes/predictive/latex"))

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

;; ***************************************************************************
;; Git integration using egg.

(require 'egg)


;; ***************************************************************************
;; I like column editing mode in editors.  cua-mode does just that. cool.
;;

;; (cua-mode t)
;;(setq cua-auto-tabify-rectangles nil)
;;(transient-mark-mode 1)
;;(setq cua-keep-region-after-copy t)
;;(setq cua-enable-cua-keys nil)


;; ***************************************************************************
;; Dot mode
;;

(require 'dot-mode)
(add-hook 'find-file-hooks 'dot-mode-on)
(global-set-key [(control ?.)] (lambda () (interactive) (dot-mode 1)
                                 (message "Dot mode activated.")))


;; ***************************************************************************
;; Javascript Espresso Mode:
;; http://www.nongnu.org/espresso/
;; Didn't like the indentation espresso does.

;;(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
;;(add-to-list 'auto-mode-alist '("\\.js\\(on\\)?$" . espresso-mode))
(autoload 'js2-mode' "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\(on\\)?$" . js2-mode))


;; ***************************************************************************
;; Scala mode.
(autoload 'scala-mode "scala-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
