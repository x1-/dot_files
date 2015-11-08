;;; ~/.emacs.d/
(unless (boundp 'user-emacs-directory)
  (defvar user-emacs-directory (expand-file-name "~/.emacs.d/")))

; ~/.emacs.d/site-lisp 以下全部読み込み
(let ((default-directory (expand-file-name "site-lisp" user-emacs-directory)))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'init-loader)
;(setq init-loader-show-log-after-init nil)
(init-loader-load (expand-file-name "inits" user-emacs-directory))

;; load-path
;;(add-to-list 'load-path (expand-file-name "auto-install/" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(require 'install-elisp)
;(require 'auto-install)
;(auto-install-compatibility-setup)


;;; バックアップファイルを作らない
(setq backup-inhibited t)

;; カレントディレクトリをホームディレクトリに設定
(cd "~/")

