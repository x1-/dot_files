(global-whitespace-mode 1)
;; スペースの定義は全角スペースとする。
(setq whitespace-space-regexp "\x3000+")
;(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-style '(face tabs lines-tail trailing))
(setq whitespace-line-column 120)

; 半角スペースと改行を除外
(dolist (d '((space-mark ?\ ) (newline-mark ?\n)))
  (setq whitespace-display-mappings
        (delete-if
         '(lambda (e) (and (eq (car d) (car e))
                           (eq (cadr d) (cadr e))))
         whitespace-display-mappings)))

