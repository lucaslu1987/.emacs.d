(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/base-lisp/auto-complete-1.5.0/dict")
(require 'auto-complete-config)
(require 'auto-complete-clang)

(ac-config-default)


(setq ac-auto-start t)
(setq ac-quick-help-delay 0.5)
;; (ac-set-trigger-key "TAB")
(define-key ac-mode-map  [(tab)] 'auto-complete)

(defun my-ac-config ()
	(setq ac-clang-flags
	      (mapcar (lambda (item)(concat "-I" item))
	              (split-string
	               "
                 /usr/local/include
                 /usr/include   
	"
               )))	
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  ;;(add-hook 'python-mode-hook        (lambda () (add-to-list 'ac-omni-completion-sources (cons "\\." '(ac-source-ropemacs)))  ))  
  (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))

(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)


;; for org-mode completion
(require 'org-ac)
(org-ac/config-default)


(provide 'init-auto-complete)
