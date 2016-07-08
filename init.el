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

;; set exec-path
;;(setq "PATH" (concat "/usr/local/bin;" (getenv "PATH")))
;;(setq exec-path (append exec-path '("/usr/local/bin")))

(require 'init-base-lisp)
(require 'init-utils)
(require 'init-font)
(require 'init-frame)
(require 'init-ibuffer)
(require 'init-theme)
;(require 'init-flyspell)
(require 'init-org)
(require 'init-org-mime)
(require 'init-windows)
(require 'init-auto-complete)
;(require 'init-company)
(require 'init-yasnippet)
(require 'init-cc-mode)
(require 'init-sr-speedbar)
(require 'init-flymake)
(require 'init-ido)
(require 'init-evil)
(require 'init-gtags)


(require 'init-smex)


(require 'init-ipython)

;; forbid auto backup
(setq make-backup-files nil)
(setq backup-directory-alist (quote (("." . "~/.backups"))))

;; set line number
(global-linum-mode 1) ; always show line numbers
(setq linum-format "%d ") ;set format
