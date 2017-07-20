(setq initial-frame-alist
  (append
    '((top                 . 20)
      (left                . 20)
      (width               . 100)
      (height              . 40))
       initial-frame-alist))

(setq default-frame-alist
  (append
    '((width               . 100)
      (height              . 40))
       default-frame-alist))

(if window-system (progn
  (add-to-list 'default-frame-alist '(foreground-color . "white"))
  (add-to-list 'default-frame-alist '(background-color . "black"))
  ;;; ツールバーを消す
  (tool-bar-mode 0)
  ;;; スクロールバーを右側に表示する
  (set-scroll-bar-mode 'right)
  ;;; クリップボード
  (setq x-select-enable-clipboard t)
))

;;; バックアップファイルを作らない
(setq backup-inhibited t)

;;; line number
(global-linum-mode t)
(setq linum-format "%4d  ")

;;; 行番号を指定して移動する機能をM-gに割り当て
(global-set-key "\M-g" 'goto-line)

;;; タブを挿入する
;(global-set-key "\C-i" '(lambda ()
(global-set-key [tab] '(lambda ()
  (interactive)
  (insert "\t")))

;;; オートインデントはスペース
(setq-default indent-tabs-mode nil)

;;; 置換
(define-key global-map (kbd "M-s s")     'replace-string)

;;; 正規表現置換
(define-key global-map (kbd "M-s r")     'replace-regexp)

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

;;; common lisp
(require 'cl)

;;; GC設定
(setq gc-cons-threshold 5242880)

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

;;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil) ; デフォルトキーバインドを無効化
(define-key global-map (kbd "C-x SPC") 'cua-rectangle-mark-mode)

;;; インデント停止
(add-hook 'c-mode-hook
          '(lambda ()
             (c-toggle-electric-state -1)))

;;; スクロールを一行ずつにする
(setq scroll-step 1)

;;; 画面右端で折り返さない
(setq-default truncate-lines t)
(setq truncate-partial-width-windows t)

;;; モードラインに情報を表示
(display-time)
(line-number-mode 1)
(column-number-mode 1)

;;; 現在の関数名をモードラインに表示
(which-function-mode 1)

;;; カレントディレクトリをホームディレクトリに設定
(cd "~/")

;;; color
(setq custom-theme-directory "~/.emacs.d/themes/")
(load-theme 'monokai t)

;;; load-path
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;;; カーソル行
(global-hl-line-mode t)
(set-face-background 'hl-line "color-235")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "#2a2a2a" :distant-foreground "black"))))
 '(highlight ((t (:background "brightred"))))
 '(linum ((t (:inherit (shadow default) :foreground "brightblue"))))
 '(hl-line ((t (:background "#222222"))))
 '(region ((t (:background "#444444")))))


;;; list-packages
(require 'package)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(package-initialize)


;;; 120byteを超える行をハイライト
;(setq whitespace-line-column 120)

(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u30fb])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; 保存前に自動でクリーンアップ
;(setq whitespace-action '(auto-cleanup))

(global-whitespace-mode 1)

(set-face-attribute 'whitespace-trailing nil
                    :background "#1d1f21"
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background "#1d1f21"
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background "#1d1f21"
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background "#1d1f21")



;;; 半角スペースと改行を除外
(dolist (d '((space-mark ?\ ) (newline-mark ?\n)))
  (setq whitespace-display-mappings
    (delete-if
     '(lambda (e) (and (eq (car d) (car e))
                       (eq (cadr d) (cadr e))))
     whitespace-display-mappings)))


(when (display-graphic-p)
    (set-face-attribute 'default nil
                        :family "Ricty Diminished"
                        :height 180)
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      (cons "Ricty Diminished" "iso10646-1"))
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0212
                      (cons "Ricty Diminished" "iso10646-1"))
    (set-fontset-font (frame-parameter nil 'font)
                      'katakana-jisx0201
                      (cons "Ricty Diminished" "iso10646-1"))
)

;;; OSX
;(require 'pbcopy)
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;;; direx
(require 'popwin)
(require 'direx)
(setq direx:leaf-icon "  "
      direx:open-icon "▾ "
      direx:closed-icon "▸ ")
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

;; helm
(require 'helm-config)
(helm-mode 1)
;(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))

(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

(defvar helm-source-emacs-commands
  (helm-build-sync-source "Emacs commands"
    :candidates (lambda ()
                  (let ((cmds))
                    (mapatoms
                     (lambda (elt) (when (commandp elt) (push elt cmds))))
                    cmds))
    :coerce #'intern-soft
    :action #'command-execute)
  "A simple helm source for Emacs commands.")

(defvar helm-source-emacs-commands-history
  (helm-build-sync-source "Emacs commands history"
    :candidates (lambda ()
                  (let ((cmds))
                    (dolist (elem extended-command-history)
                      (push (intern elem) cmds))
                    cmds))
    :coerce #'intern-soft
    :action #'command-execute)
  "Emacs commands history")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-mini-default-sources
   (quote
     (helm-source-buffers-list helm-source-recentf helm-source-files-in-current-dir helm-source-emacs-commands-history helm-source-emacs-commands)))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(define-key global-map (kbd "C-;") 'helm-mini)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)




;;; flycheck
;(add-hook 'after-init-hook #'global-flycheck-mode) ; globalやめ

;;; markdown
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;; rust
(setq racer-rust-src-path "/usr/local/rust/src")
(setq racer-cmd "/usr/local/rust/racer/target/release/racer")
(eval-after-load "rust-mode" '(require 'racer))

(add-hook 'rust-mode-hook #'racer-mode)
;(add-hook 'racer-mode-hook #'eldoc-mode
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'racer-mode-hook #'flycheck-mode)

;;; scala-mode
;; (add-to-list 'load-path "~/.emacs.d/scala-mode")
;; (require 'scala-mode-auto)

;;; (add-to-list 'load-path "~/.emacs.d/ensime/elisp/")
;;; (require 'ensime)
;;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;; ;;; php
;;; (load-library "php-mode")
;;; (require 'php-mode)

;;; (add-hook 'php-mode-hook
;;;     '(lambda ()
;;;        (setq-default tab-width 4)
;;;        (setq indent-tabs-mode nil)
;;;        (setq c-basic-offset 4)))

;;; (add-hook 'php-mode-hook
;;;     '(lambda ()
;;;        (c-set-style "stroustrup")
;;;        (setq php-manual-path "/usr/share/doc/php/html")
;;;        (setq php-search-url  "http://www.phppro.jp/")
;;;        (setq php-manual-url  "http://www.phppro.jp/phpmanual")
;;;       (setq tab-width 4)))


;;;; haskell
;;(add-to-list 'load-path "~/.emacs.d/elisp/haskell-mode-2.8.0")
;;
;;(require 'haskell-mode)
;;(require 'haskell-cabal)

;;(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))     ;#!/usr/bin/env runghc 用
;;(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode)) ;#!/usr/bin/env runhaskell 用


;;; JS
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-mode-hook
  '(lambda()
    (setq js2-basic-offset 2)
    (setq js -indent-level 2)
    (setq tab-width 2)
))

;;; json-mode
(add-hook 'json-mode-hook
  '(lambda ()
    (make-local-variable 'js-indent-level)
    (setq js-indent-level 2)))

;;; python
;(require 'jedi-core)
;(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook
  '(lambda()
;    (jedi:setup)
    (with-eval-after-load 'company
;      (add-to-list 'company-backends 'company-jedi)
      (add-to-list 'company-backends 'company-anaconda))
      (setq indent-tabs-mode nil)
      (setq indent-level 4)
      (setq python-indent 4)
      (setq tab-width 4)))

;; Basic usage.
;(add-to-list 'company-backends 'company-jedi)
;; Advanced usage.
;(add-to-list 'company-backends '(company-jedi company-files))

;;; ;;; git
;;; (require 'git)
;;; (require 'git-blame)
;;; (require 'vc-git)

;;; ;;; simple-note
;;; (require 'simplenote)
;;; (setq simplenote-email "test@xx.com") ;登録したメールアドレス
;;; (setq simplenote-password "******")      ;パスワード
;;; (simplenote-setup)

;;(custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; '(column-number-mode t)
;; '(cua-mode t nil (cua-base))
;; '(show-paren-mode t))
;;(custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; )


;;; company-mode
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common) ;
(setq company-tooltip-align-annotations t)


; mark-word-at-point
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



(defun backward-kill-word-or-kill-region ()
  (interactive)
  (if (or (not transient-mark-mode) (region-active-p))
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))
(global-set-key "\C-w" 'backward-kill-word-or-kill-region)

