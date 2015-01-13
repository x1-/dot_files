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

;;; �o�b�N�A�b�v�t�@�C�������Ȃ�
(setq backup-inhibited t)

;;; �c�[���o�[������
(tool-bar-mode 0)

;;; line number
(global-linum-mode t)


;; �s�ԍ����w�肵�Ĉړ�����@�\��M-g�Ɋ��蓖��
(global-set-key "\M-g" 'goto-line)

;; �t�@�C���̍Ō�ֈړ�����@�\��M-down�Ɋ��蓖��
(global-set-key [M-down] 'end-of-buffer)
(global-set-key [M-up] 'beginning-of-buffer)

;; �R�����g�A�E�g��C-@�����蓖��
(global-unset-key "\C-@")
(global-set-key "\C-@" 'comment-region)

;; �^�u��}������
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

;; GC�ݒ�
(setq gc-cons-threshold 5242880)

;; C-Ret �ŋ�`�I��
;; �ڂ����L�[�o�C���h����Fhttp://dev.ariel-networks.com/articles/emacs/part5/
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

;;; �C���f���g��~
(add-hook 'c-mode-hook
          '(lambda ()
             (c-toggle-electric-state -1)))

;;; �X�N���[������s���ɂ���
(setq scroll-step 1)

;;; �X�N���[���o�[���E���ɕ\������
(set-scroll-bar-mode 'right)

;;; ��ʉE�[�Ő܂�Ԃ��Ȃ�
(setq-default truncate-lines t)
(setq truncate-partial-width-windows t)

;;; ���[�h���C���ɏ���\��
(display-time)
(line-number-mode 1)
(column-number-mode 1)

;;; ���݂̊֐��������[�h���C���ɕ\��
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

;; �p��
 (set-face-attribute 'default nil
             :family "Monaco" ;; font
             :height 140)    ;; font size

;; ���{��
(set-fontset-font
 nil 'japanese-jisx0208
;; (font-spec :family "Hiragino Mincho Pro")) ;; font
  (font-spec :family "Hiragino Kaku Gothic ProN")) ;; font


;====================================
;;jaspace.el ���g�����S�p�󔒁A�^�u�A���s�\�����[�h
;;�؂�ւ��� M-x jaspace-mode-on or -off
;====================================
;(require 'jaspace)
;;; �S�p�󔒂�\��������B
;(setq jaspace-alternate-jaspace-string "��")
;;; ���s�L����\��������B
;(setq jaspace-alternate-eol-string "��\n")
;;; �^�u�L����\���B
;(setq jaspace-highlight-tabs t)
;;;(setq jaspace-highlight-tabs ?^)
;(setq jaspace-mode t)

(global-whitespace-mode 1)
;; �X�y�[�X�̒�`�͑S�p�X�y�[�X�Ƃ���B
(setq whitespace-space-regexp "\x3000+")
;(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-style '(face tabs lines-tail trailing))
(setq whitespace-line-column 120)


;; �^�u�̐F��ύX
(set-face-foreground 'whitespace-tab "#333333")
(set-face-background 'whitespace-tab "#003131")

; ���p�X�y�[�X�Ɖ��s�����O
(dolist (d '((space-mark ?\ ) (newline-mark ?\n)))
  (setq whitespace-display-mappings
        (delete-if
         '(lambda (e) (and (eq (car d) (car e))
                           (eq (cadr d) (cadr e))))
         whitespace-display-mappings)))

;; �S�p�X�y�[�X�Ɖ��s��ǉ�
;(dolist (e '((space-mark   ?\x3000 [?\��])
;             (newline-mark ?\n     [?\u21B5 ?\n] [?$ ?\n])))
;  (add-to-list 'whitespace-display-mappings e))

;; �����������Ȃ��v�f���폜
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
(setq cua-enable-cua-keys nil) ;; �ςȃL�[�o�C���h�֎~

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

(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))     ;#!/usr/bin/env runghc �p
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode)) ;#!/usr/bin/env runhaskell �p


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
;; (setq simplenote-email "test@xx.com") ;�o�^�������[���A�h���X
;; (setq simplenote-password "******")      ;�p�X���[�h
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
