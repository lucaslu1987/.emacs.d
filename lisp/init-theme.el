;; the theme manager
(add-to-list 'custom-theme-load-path "~/.emacs.d/base-lisp/themes/emacs-color-theme-solarized")
(load-theme 'solarized t)
(set-frame-parameter nil 'background-mode 'dark)
(enable-theme 'solarized)

(provide 'init-theme)
