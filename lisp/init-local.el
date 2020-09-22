(add-hook 'org-mode-hook
	  (lambda () (setq truncate-lines nil)))

;; set Chinese and English fonts
;;;中文与英文字体设置
;; Setting English Font
(set-face-attribute
 'default nil :font "Monaco 14")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "WenQuanYi Micro Hei Mono" :size 16)))

;; set org-ref
(require-package 'org-ref)
(require 'org-ref)


(setq org-ref-default-bibliography '("~/org/knowledge/Bibliography/ref/library.bib")
      org-ref-pdf-directory "~/org/knowledge/Bibliography/bibtex-pdfs"
      org-ref-bibliography-notes "~/org/knowledge/Bibliography/papers.org")

;; set latex to xelatex
(setq org-latex-pdf-process '("xelatex -shell-escape -interaction nonstopmode %f"
                                "xelatex -shell-escape -interaction nonstopmode %f"))

;; add templates for org-mode
(require 'ox-latex)
(add-to-list 'org-latex-classes
	     '("elegantnote"
	       "\\documentclass{elegantnote}
               [NO-DEFAULT-PACKAGES]
               [PACKAGES]
               [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

 (add-to-list 'org-latex-classes
	      '("elegantpaper"
              "\\documentclass{elegantpaper}
              [NO-DEFAULT-PACKAGES]
              [PACKAGES]
              [EXTRA]"
              ("\\section{%s}" . "\\section*{%s}")
              ("\\subsection{%s}" . "\\subsection*{%s}")
              ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
              ("\\paragraph{%s}" . "\\paragraph*{%s}")
              ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; auctex and cdlatex
(require-package 'auctex)
(require-package 'cdlatex)
(add-hook 'LaTex-mode-hook 'turn-on-cdlatex)

;; no ".~" files
(setq make-backup-files nil)

;;cua mode
(cua-mode 1)

(provide 'init-local)
