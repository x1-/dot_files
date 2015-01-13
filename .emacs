(setq initial-frame-alist
	(append
	  '((top                 . 20)
		(left                . 200)
		(width               . 140)
		(height              . 40))
		initial-frame-alist))

(setq default-frame-alist
	(append
	  '((width               . 140)
		(height              . 40))
		default-frame-alist))

(if window-system (progn
  (add-to-list 'default-frame-alist '(foreground-color . "white"))
  (add-to-list 'default-frame-alist '(background-color . "black"))
))

;;; バックアップファイルを作らない
(setq backup-inhibited t)

;;; ツールバーを消す
(tool-bar-mode 0)

;;; line number
(global-linum-mode t)


;; 行番号を指定して移動する機能をM-gに割り当て
(global-set-key "\M-g" 'goto-line)

;; ファイルの最後へ移動する機能をM-downに割り当て
(global-set-key [M-down] 'end-of-buffer)
(global-set-key [M-up] 'beginning-of-buffer)

;; コメントアウトにC-@を割り当て
(global-unset-key "\C-@")
(global-set-key "\C-@" 'comment-region)

;; タブを挿入する
(global-set-key "\C-i" '(lambda ()
  (interactive)
  (insert "\t")))

(setq-default transient-mark-mode t)

;;; encoding
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)

(set-coding-system-priority 'utf-8
                            'euc-jp
                            'iso-2022-jp
                            'cp932)
(setq default-tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                      64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

;;; use clip-board
(cond
	(window-system
		(setq x-select-enable-clipboard t)))


;; common lisp
(require 'cl)

;; GC設定
(setq gc-cons-threshold 5242880)

;; C-Ret で矩形選択
;; 詳しいキーバインド操作：http://dev.ariel-networks.com/articles/emacs/part5/
(cua-mode t)
(setq cua-enable-cua-keys nil)

;;; ()
(show-paren-mode 1)
(setq show-paren-style 'mixed)
(setq-default show-trailing-whitespace t)

;;; cursol
(global-hl-line-mode)
(column-number-mode t)
(line-number-mode t)
(require 'saveplace)
(setq-default save-place t)

;;; インデント停止
(add-hook 'c-mode-hook
          '(lambda ()
             (c-toggle-electric-state -1)))

;;; スクロールを一行ずつにする
(setq scroll-step 1)

;;; スクロールバーを右側に表示する
(set-scroll-bar-mode 'right)

;;; 画面右端で折り返さない
(setq-default truncate-lines t)
(setq truncate-partial-width-windows t)

;;; モードラインに情報を表示
(display-time)
(line-number-mode 1)
(column-number-mode 1)

;;; 現在の関数名をモードラインに表示
(which-function-mode 1)

;; load-path
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")


;; coloring
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
;(load-library "~/.emacs.d/color-theme/themes/color-theme-solarized")
(load-library "~/.emacs.d/color-theme/themes/monokai-theme")

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     ;(color-theme-solarized-dark)))
     (color-theme-monokai)))


;(set-face-font
;  'italic
;  '("-mona-gothic-medium-i-normal--12-110-75-75-p-60-jisx0201.1976-0"
;   "-mona-gothic-medium-i-normal--12-110-75-75-p-120-jisx0208.1990-0"))
;(set-face-font
; 'bold-italic
; '("-mona-gothic-bold-i-normal--12-110-75-75-p-60-jisx0201.1976-0"
;   "-mona-gothic-bold-i-normal--12-110-75-75-p-120-jisx0208.1990-0"))

;; 英語
 (set-face-attribute 'default nil
             :family "Monaco" ;; font
             :height 140)    ;; font size

;; 日本語
(set-fontset-font
 nil 'japanese-jisx0208
;; (font-spec :family "Hiragino Mincho Pro")) ;; font
  (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font


;====================================
;;jaspace.el を使った全角空白、タブ、改行表示モード
;;切り替えは M-x jaspace-mode-on or -off
;====================================
;(require 'jaspace)
;;; 全角空白を表示させる。
;(setq jaspace-alternate-jaspace-string "□")
;;; 改行記号を表示させる。
;(setq jaspace-alternate-eol-string "↓\n")
;;; タブ記号を表示。
;(setq jaspace-highlight-tabs t)
;;;(setq jaspace-highlight-tabs ?^)
;(setq jaspace-mode t)

(global-whitespace-mode 1)
;; スペースの定義は全角スペースとする。
(setq whitespace-space-regexp "\x3000+")
;(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-style '(face tabs lines-tail trailing))
(setq whitespace-line-column 120)


;; タブの色を変更
(set-face-foreground 'whitespace-tab "#333333")
(set-face-background 'whitespace-tab "#003131")

; 半角スペースと改行を除外
(dolist (d '((space-mark ?\ ) (newline-mark ?\n)))
  (setq whitespace-display-mappings
        (delete-if
         '(lambda (e) (and (eq (car d) (car e))
                           (eq (cadr d) (cadr e))))
         whitespace-display-mappings)))

;; 全角スペースと改行を追加
;(dolist (e '((space-mark   ?\x3000 [?\□])
;             (newline-mark ?\n     [?\u21B5 ?\n] [?$ ?\n])))
;  (add-to-list 'whitespace-display-mappings e))

;; 強調したくない要素を削除
;(dolist (d '(face lines space-before-tab
;                  indentation empty space-after-tab tab-mark))
;  (setq whitespace-style (delq d whitespace-style)))


;;; list-packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;;(require 'auto-complete)
;;(global-auto-complete-mode t)

;;; scala-mode
;; (add-to-list 'load-path "~/.emacs.d/scala-mode")
;; (require 'scala-mode-auto)

;; (add-to-list 'load-path "~/.emacs.d/ensime/elisp/")
;; (require 'ensime)
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; ;;; php
;; (load-library "php-mode")
;; (require 'php-mode)

;; (add-hook 'php-mode-hook
;;     '(lambda ()
;;        (setq-default tab-width 4)
;;        (setq indent-tabs-mode nil)
;;        (setq c-basic-offset 4)))

;; (add-hook 'php-mode-hook
;;     '(lambda ()
;;        (c-set-style "stroustrup")
;;        (setq php-manual-path "/usr/share/doc/php/html")
;;        (setq php-search-url  "http://www.phppro.jp/")
;;        (setq php-manual-url  "http://www.phppro.jp/phpmanual")
;;       (setq tab-width 4)))

; Add my private library path
(setq load-path(append(list(expand-file-name "~/elisp/"))load-path))
;
; Show line number
;
;(require 'wb-line-number)
;(setq truncate-partial-width-windows nil)
;(set-scroll-bar-mode nil)
;(setq wb-line-number-scroll-bar t)
;(wb-line-number-toggle)

;;; rectangle
(cua-mode t)
(setq cua-enable-cua-keys nil) ;; 変なキーバインド禁止

;;; markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;; sense-region
;; (install-elisp "http://taiyaki.org/elisp/sense-region/src/sense-region.el")
;(require 'sense-region)
;(sense-region-on)

;;; haskell
(add-to-list 'load-path "~/.emacs.d/elisp/haskell-mode-2.8.0")

(require 'haskell-mode)
(require 'haskell-cabal)

(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))     ;#!/usr/bin/env runghc 用
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode)) ;#!/usr/bin/env runhaskell 用


;;; JS
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-mode-hook
  '(lambda()
    (setq js2-basic-offset 2)
    (setq tab-width 2)
))


(add-hook 'python-mode-hook
                   '(lambda()
                        (setq indent-tabs-mode nil)
                        (setq indent-level 4)
                        (setq python-indent 4)
                        (setq tab-width 4)))
;; ;;; git
;; (require 'git)
;; (require 'git-blame)
;; (require 'vc-git)

;; ;;; simple-note
;; (require 'simplenote)
;; (setq simplenote-email "test@xx.com") ;登録したメールアドレス
;; (setq simplenote-password "******")      ;パスワード
;; (simplenote-setup)


;(custom-set-variables
;  ;; custom-set-variables was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
; '(column-number-mode t)
; '(cua-mode t nil (cua-base))
; '(show-paren-mode t))
;(custom-set-faces
;  ;; custom-set-faces was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
; )

;; mark-word-at-point
(defun mark-word-at-point ()
  (interactive)
  (let ((char (char-to-string (char-after (point)))))
    (cond
     ((string= " " char) (delete-horizontal-space))
     ((string-match "[\t\n -@\[-`{-~]" char) (mark-word ))
     (t (forward-char) (backward-word) (mark-word 1)))))
(global-set-key [C-M-up] 'mark-word-at-point)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
