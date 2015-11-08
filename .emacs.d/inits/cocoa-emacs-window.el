(setq initial-frame-alist
  (append
    '((top                 . 20)
      (left                . 20)
      (width               . 130)
      (height              . 38))
       initial-frame-alist))

(setq default-frame-alist
  (append
    '((width               . 130)
      (height              . 38))
       default-frame-alist))

;;; ツールバーを消す
(tool-bar-mode 0)
(setq tool-bar-style 'text)

;;; スクロールバーを右側に表示する
(set-scroll-bar-mode 'right)

