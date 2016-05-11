;; This file is only for windows 6/8/8.1
;; The only thing it does is to set the HOME directories for emacs,
;; then trigger the init.el in the directory specified by HOME to
;; accomplish the true initialization
;; You should put this file in the **default** HOME directory right after
;; emacs is installed
(add-to-list
    'load-path 
    (expand-file-name "lisp" user-emacs-directory))
	
(add-to-list 'load-path "~/.emacs.d/lisp/evil") 
(require 'evil)
(evil-mode 1)

;;; configure the start frame size
(set-frame-position (selected-frame) 0 0)
(set-frame-width (selected-frame) 100)
(set-frame-height (selected-frame) 33)

;; the theme manager
;(add-to-list 'load-path "~/.emacs.d/themes")
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes") 
;(require 'color-theme)
;(load-theme 'monokai t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized t)


(require 'init-cc-mode)
(require 'init-org-mode)
(require 'flymake)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)



(require 'ido)
(ido-mode t)

(global-linum-mode 1) ; always show line numbers
(setq linum-format "%d ") ;set format


;; python configure
(require 'python)                                                                                                
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))                                                       
 (setq
  python-shell-interpreter "ipython"
  python-shell-interpreter-args ""
  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
  python-shell-completion-setup-code
    "from IPython.core.completerlib import module_completion"
  python-shell-completion-module-string-code
    "';'.join(module_completion('''%s'''))\n"
  python-shell-completion-string-code
    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(add-to-list 'load-path "~./emacs.d/lisp")
(require 'pymacs)
;; Initialize Pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;; Initialize Rope                                                                                             
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)



(add-to-list 'load-path "~/.emacs.d/lisp/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete-1.5.0")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete-1.5.0/dict")
(require 'auto-complete-config)
(require 'auto-complete-clang)
(ac-config-default)

;;(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)
;; (ac-set-trigger-key "TAB")
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
(define-key ac-mode-map  [(control tab)] 'auto-complete)
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








;; close the startup view
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

;; require the windows number
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'window-numbering)
(window-numbering-mode 1)

(require 'evil-leader)
(global-evil-leader-mode)


;; forbid auto backup
(setq make-backup-files nil)
(setq backup-directory-alist (quote (("." . "~/.backups"))))
