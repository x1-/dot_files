;;; JS
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-mode-hook
  '(lambda()
    (setq js2-basic-offset 2)
    (setq tab-width 2)
))

