;;; ()
(show-paren-mode 1)
(setq show-paren-style 'mixed)
(setq-default show-trailing-whitespace t)

;;; 範囲選択時の文字強調
(setq-default transient-mark-mode t)

;;; インデント停止
(add-hook 'c-mode-hook
          '(lambda ()
             (c-toggle-electric-state -1)))

