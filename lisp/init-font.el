
;; 中文与英文字体设置
(set-face-attribute 'default nil :font "Monaco 12")

;; Chinese fontp
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "WenQuanYi Zen Hei Mono" :size 14)))

(provide 'init-font)
