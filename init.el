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


(add-to-list 'load-path "~/.emacs.d/lisp/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete-1.5.0")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete-1.5.0/dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

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
