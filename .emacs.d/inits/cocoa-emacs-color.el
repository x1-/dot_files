;; coloring
(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(load-library "~/.emacs.d/color-theme/themes/monokai-theme")

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-monokai)))

;; タブの色を変更
(set-face-foreground 'whitespace-tab "#000000")

