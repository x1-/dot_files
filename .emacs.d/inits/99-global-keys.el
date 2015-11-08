;; 行番号を指定して移動する機能をM-gに割り当て
(global-set-key "\M-g" 'goto-line)

;; ファイルの最後へ移動する機能をM-downに割り当て
(global-set-key [C-M-down] 'end-of-buffer)
(global-set-key [C-M-up] 'beginning-of-buffer)

;; コメントアウトにC-@を割り当て
(global-unset-key "\C-@")
(global-set-key "\C-@" 'comment-region)

;; タブを挿入する
(global-set-key "\C-i" '(lambda ()
  (interactive)
  (insert "\t")))

;; mark-word-at-point
(defun mark-word-at-point ()
  (interactive)
  (let ((char (char-to-string (char-after (point)))))
    (cond
     ((string= " " char) (delete-horizontal-space))
     ((string-match "[\t\n -@\[-`{-~]" char) (mark-word ))
     (t (forward-char) (backward-word) (mark-word 1)))))
(global-set-key [M-up] 'mark-word-at-point)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun backward-kill-word-or-kill-region ()
  (interactive)
  (if (or (not transient-mark-mode) (region-active-p))
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))
(global-set-key "\C-w" 'backward-kill-word-or-kill-region)

