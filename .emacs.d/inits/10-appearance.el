;;; line number
(global-linum-mode t)

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

