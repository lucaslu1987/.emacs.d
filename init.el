;; This file is only for windows 7/8/8.1
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

;; the theme manager
;(add-to-list 'load-path "~/.emacs.d/themes")
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes") 
;(require 'color-theme)
;(load-theme 'monokai t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(load-theme 'solarized t)

(setq c-default-style "linux"
          c-basic-offset 4)

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


