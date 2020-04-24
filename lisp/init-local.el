;; Chinese return in org mode
(add-hook 'org-mode-hook
	  (lambda () (setq truncate-lines nil)))

;; set Chinese and English fonts
(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format   "%s:pixelsize=%d"  english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))

(set-font   "Source Code Pro" "WenQuanYi Zen Hei Mono" 14 16)

(provide 'init-local)
